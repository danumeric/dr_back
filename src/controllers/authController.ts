const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')
const { validationResult } = require('express-validator')
const { secretKey } = require("../config.ts")
const fs = require("fs")
import { PrismaClient } from '@prisma/client'
import { Request, Response } from 'express'

const prisma = new PrismaClient()


const generateAccessToken = (id: number): string => {
  return jwt.sign({ id }, secretKey, { expiresIn: '24h' })
}


class authController {
  async registration(req: Request, res: Response) {

    try {
      const errors = validationResult(req)
      console.log(errors)
      if (!errors.isEmpty()) {
        return res.status(400).json({ message: "Ошибка при регистрации", errors })
      }
      const { login, password } = req.body

      const hashPassword = bcrypt.hashSync(password, 3)

      const newdata = await prisma.user.create({
        data: {
          login,
          password: hashPassword
        }
      })

      return res.json({ message: 'Регистрация успешна' })
    } catch (e) {
      console.log(e)
      return res.status(400).json({ message: 'Ошибка регистрации', e: e })
    }
  }

  async login(req: Request, res: Response) {
    try {
      const { login, password } = req.body
      const findedUser = await prisma.user.findUnique({
        where: {
          login: login
        },
      })

      if (!findedUser) {
        return res.status(401).json({ message: `Пользователь "${login}" не найден` })
      }
      const isValidPassword = bcrypt.compareSync(password, findedUser.password)

      if (!isValidPassword) {
        return res.status(401).json({ message: `Пароль неверный` })
      }

      const token = generateAccessToken(findedUser.id)
      return res.json({
        token,
        login: findedUser.login
      })

    } catch (e) {
      console.log(e)
      return res.status(401).json({ message: 'Не удалось авторизироваться', e: e })
    }
  }

}

module.exports = new authController()
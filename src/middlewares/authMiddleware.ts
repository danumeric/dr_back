
const jwt = require('jsonwebtoken')
const { secretKey } = require('../config')
import { Express, Request, Response, NextFunction } from 'express'
interface RequestWithUserId extends Request {
  userId?: string,
}

module.exports = function (req: RequestWithUserId, res: Response, next: NextFunction) {

  try {
    let token = ''
    if (req.headers.authorization) {
      token = req.headers.authorization.split(' ')[1]
    }

    if (!token) {
      return res.status(403).json({ message: 'Токен отсутствует' })
    }
    const decodedData = jwt.verify(token, secretKey)
    req.userId = decodedData.id
    next()
  } catch (e) {
    console.log(e)
    return res.status(403).json({ failedAuth: true, message: 'Токен неверный' })
  }
}
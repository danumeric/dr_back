const express = require('express')
const router = express.Router()
let bodyParser = require('body-parser')
import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient()
let jsonParser = bodyParser.json()
const authController = require('../controllers/authController')
const dishesController = require('../controllers/dishesController')
const authMiddleware = require('../middlewares/authMiddleware')
import { Request, Response } from 'express'
type DestinationCallback = (error: Error | null, destination: string) => void
interface IRequestWithFile extends Request {
  file: Express.Multer.File,
}

const multer = require('multer')
const path = require('path')
const webp = require('webp-converter')
const fs = require('fs')

router.post('/registration', [
  jsonParser], authController.registration)

router.post('/login', jsonParser, authController.login)

router.get('/img/:image_src', dishesController.getImage)

router.get('/dishes', dishesController.getDishes)

router.get('/categories', dishesController.getCategories)

router.post('/add-dish', jsonParser, authMiddleware, dishesController.newDish)

router.post('/edit-dish', jsonParser, authMiddleware, dishesController.editDish)
router.delete('/delete-dish/:id', authMiddleware, dishesController.deleteDish)

router.post('/upload-img/:id', authMiddleware, multer({
  storage: multer.diskStorage({
    destination: (req: Request, file: Express.Multer.File, cb: DestinationCallback) => {
      cb(null, `src/assets/images/dishes/`)
    },
    filename: (req: Request, file: Express.Multer.File, cb: DestinationCallback) => {
      cb(null, req.params.id + '_1' + path.extname(file.originalname))
    }
  })
}).single('image')
  , async (req: IRequestWithFile, res: Response) => {
    let pathFile = 'src/assets/images/dishes'
    const result = await webp.cwebp(`${pathFile}/${req.file.filename}`,
      `${pathFile}/${path.parse(req.file.filename).name}.webp`, "-q 80")
    fs.unlinkSync(`${pathFile}/${req.file.filename}`)
    await prisma.dish.update({
      where: {
        id: +req.params.id,
      },
      data: {
        imageSrc: req.params.id + '_1.webp',
      },
    })
    res.status(200)
    res.send('uploaded')
  })

module.exports = router
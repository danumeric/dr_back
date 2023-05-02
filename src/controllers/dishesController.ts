import { PrismaClient } from '@prisma/client'
import { Request, Response } from 'express'

interface ICategory {
  id: number,
  title?: string
}
const prisma = new PrismaClient()

class dishesController {
  async getImage(req: Request, res: Response) {
    try {
      res.sendFile(`${req.params.image_src}`, { root: `./src/assets/images/dishes/` })
    } catch (e) {
      console.log(e)
      return res.status(400).json({ message: 'Изображение не найдено', e: e })
    }
  }

  async getDishes(req: Request, res: Response) {
    try {
      const dishes = await prisma.dish.findMany({
        include: {
          categories: true,
        },
      })
      res.json(dishes)
    } catch (e) {
      console.log(e)
      return res.status(400).json({ message: 'Ошибка', e: e })
    }
  }

  async getCategories(req: Request, res: Response) {
    try {
      const dishes = await prisma.category.findMany({})
      res.json(dishes)
    } catch (e) {
      console.log(e)
      return res.status(400).json({ message: 'Ошибка', e: e })
    }
  }

  async newDish(req: Request, res: Response) {
    try {
      const newDishData = req.body
      newDishData.categories.map((c: ICategory) => delete c.title)

      const newDishInDB = await prisma.dish.create({
        data: {
          title: newDishData.title,
          weight_gramm: +newDishData.weightGramm,
          description: newDishData.description,
          price_rub: +newDishData.priceRub,
          categories: {
            connect: newDishData.categories,
          }
        }
      })

      res.status(201).json({ message: 'Успешно создано', dishData: newDishInDB })

    } catch (e) {
      console.log(e)
      return res.status(400).json({ message: 'Ошибка при добавлении блюда', e: e })
    }
  }

  async editDish(req: Request, res: Response) {
    try {
      const newDishData = req.body
      newDishData.categories.map((c: ICategory) => delete c.title)
      await prisma.dish.update({
        where: {
          id: newDishData.id,
        },
        data: {
          categories: {
            set: [],  // disconnecting all previous features
          }
        }
      })
      const updateDish = await prisma.dish.update({
        where: {
          id: newDishData.id,
        },
        data: {
          title: newDishData.title,
          weight_gramm: +newDishData.weightGramm,
          description: newDishData.description,
          price_rub: +newDishData.priceRub,
          categories: {
            connect: newDishData.categories,
          }
        },
      })
      res.status(201).json({ message: 'Успешно изменено', dishData: updateDish })

    } catch (e) {
      console.log(e)
      return res.status(400).json({ message: 'Ошибка при изменении блюда', e: e })
    }
  }


  async deleteDish(req: Request, res: Response) {
    try {
      const deletedDish = await prisma.dish.delete({
        where: {
          id: +req.params.id,
        },
      })
      return res.status(200).json({ message: 'Удалено' })

    } catch (e) {
      console.log(e)
      return res.status(400).json({ message: 'Ошибка при изменении блюда', e: e })
    }
  }

}

module.exports = new dishesController()
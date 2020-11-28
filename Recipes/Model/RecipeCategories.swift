//
//  Ingredient.swift
//  FoodPin
//
//  Created by Alex on 04.11.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

class RecipeCategories {
    var recipeCategoriesRu = ["Наборы и заготовки", "Блины", "Блюда на пару", "Бургеры и сэндвичи", "Бутерброды", "Вакуум", "Вафли", "Ветчина", "Вторые блюда", "Выпечка", "Гарниры", "Десерты", "Детское меню", "Другие рецепты", "Другие виды чая", "Запеченые блюда", "Здоровое питание", "Зеленый чай", "Каши", "Кисломолочные продукты", "Классический домашний хлеб", "Колбаски", "Консервация", "Копчение", "Кофе", "Люля-кебаб", "Маринады", "Мясо", "Напитки", "Овощи", "Основные блюда", "Паста", "Пироги", "Попкорн", "Птица", "Рыба и морепродукты", "Салаты и закуски", "Сардельки", "Сладкая выпечка", "Смузи", "Сосиски", "Соусы", "Спортивное питание", "Супы", "Тесто", "Фондю", "Фри", "Фрукты и ягоды", "Хлеб", "Хлеб для здорового питания", "Черный чай", "Шашлыки" ]
    var recipeCookingTypeRu = ["Заморозка", "Без термической обработки", "Вакуум", "Варка", "Выпекание", "Вяление", "Жарка", "Заваривание", "Запекание", "На пару", "Сквашивание", "Томление", "Тушение"]
    var recipeCousineStyleRu = ["Азиатская", "Американская", "Английская", "Греческая", "Грузинская", "Еврейская", "Европейская", "Индийская", "Итальянская", "Китайская", "Корейская", "Мексиканская", "Немецкая", "Русская", "Турецкая", "Украинская", "Французская", "Чешская", "Японская"]
    var recipeDietsRu = ["Без глютена", "Без лактозы", "Без сахара", "Вегетарианская", "Детское меню", "Кето-диета", "На пару", "Острая пища", "Постная пища", "Правильное питание", "Стол №1", "Стол №2", "Стол №3", "Стол №4", "Стол №5", "Халяль"]
    
    
    var ingredientProteins = 00.00
    var ingredientFat = 00.00
    var ingredientCarbons = 00.00
    var ingredientGlicemicIndex = 00.00
    var ingredientUserName = ""
    var ingredientImage = ""
    var isSelected = false
    
    init (ingredientName: String, ingredientProteins: Double, ingredientFat: Double, ingredientCarbons: Double, ingredientGlicemicIndex: Double,  ingredientUserName: String, ingredientImage: String, isSelected: Bool) {
        self.ingredientName = ingredientName
        self.ingredientUserName = ingredientUserName
        self.ingredientImage = ingredientImage
        self.isSelected = isSelected
        
    }
    
    convenience init() {
        self.init(ingredientName: "", ingredientProteins: 00.00, ingredientFat: 00.00, ingredientCarbons: 00.00, ingredientGlicemicIndex: 00.00, ingredientUserName: "", ingredientImage: "", isSelected: false)
    }
}

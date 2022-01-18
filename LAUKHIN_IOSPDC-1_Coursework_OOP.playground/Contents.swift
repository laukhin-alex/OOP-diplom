import UIKit


// 1. создаем протоколы


typealias FoodProductType = (FoodProduct, Int) //тип для продуктов и их количества


protocol RestaurantProtocol {
    var name: String { get }
    var restaurantEmployee: [RestaurantEmployeeProtocol] { get set}
    var storeHouse: [FoodProductType] { get set}
    var menu: [Dish] { get set }
    var orders: [OrderProtocol] { get set }

    func orderFoodProduct(foodProduct: [FoodProductType]) -> [FoodProductType]

}

protocol RestaurantEmployeeProtocol {
    var name: String { get }
    var isMale: Bool { get }
    var age: Int { get }
}

protocol DishProtocol {
    var name: String { get }
    var typeOfDish: TypeOfDish { get }
    var ingredients: [FoodProductType] { get set }
    var cookingTime: Int { get set }
    var price: Double { get set }
}

protocol OrderProtocol {
    var timeOfGettingOrder: Int { get set }
    var timeOfGivingOrder: Int { get set }
    var dishInOrder: [Dish] { get set }
    var isReady: Bool { get set }
}

// 2. Создаем классы и структуры

// 2.1 должности

class Chef: RestaurantEmployeeProtocol {
    var name: String
    var isMale: Bool
    var age: Int

    init(name: String, isMale: Bool, age: Int) {
        self.name = name
        self.isMale = isMale
        self.age = age
    }

    func cookDish(dish: [Dish]) -> [Dish] {
        print("\(dish) is ready")
        return dish
    }
}

class SuChef: RestaurantEmployeeProtocol {
    var name: String
    var isMale: Bool
    var age: Int

    init(name: String, isMale: Bool, age: Int) {
        self.name = name
        self.isMale = isMale
        self.age = age
    }

    func cookDish(dish: [Dish]) -> [Dish] {
        print("\(dish) is ready")
        return dish
    }
    func cookHotDish(dish: [Dish]) -> [Dish] {
        for dish in dish {
            if dish.typeOfDish == TypeOfDish.hotMeal {
                print("\(dish) is ready")
            } else {
                print("I can't cook \(dish)")
            }
        }
        return dish
    }
}

class cook: RestaurantEmployeeProtocol {
    var name: String
    var isMale: Bool
    var age: Int

    init(name: String, isMale: Bool, age: Int) {
        self.name = name
        self.isMale = isMale
        self.age = age
    }

    func cookDish(dish: [Dish]) -> [Dish] {
        print("\(dish) is ready")
        return dish
    }

    func cookSaladDish(dish: [Dish]) -> [Dish] {
        for dish in dish {
            if dish.typeOfDish == TypeOfDish.salad {
                print("\(dish) is ready")
            } else {
                print("I can't cook \(dish)")
            }
        }
        return dish
    }
}

class Waiter: RestaurantEmployeeProtocol {
    var name: String
    var isMale: Bool
    var age: Int

    init(name: String, isMale: Bool, age: Int) {
        self.name = name
        self.isMale = isMale
        self.age = age
    }

    func makeOrder(dish: [Dish]) -> [Dish] {
        print("I will repeat your order:")
        for dish in dish {
            print(dish)
        }
        return dish
    }
}

// 2.2 блюда

enum TypeOfDish: String {
    case salad = "Caлад"
    case hotMeal = "Горячее"
    case soup = "Суп"
    case garnish = "Гарнир"
    case drink = "Напиток"
}

enum FoodProduct: String {
    case egg = "Яйцо"
    case salt="Соль"
    case chicken = "Курица"
    case beaf = "Говядина"
    case peper = "Перец"
    case onion = "Лук"
    case bread = "Хлеб"
    case oil = "Масло"
    case sauce = "Соус"
    case saladLeaves = "Листья салата"
    case potato = "Картофель"
    case rice = "Рис"
    case spice = "Специи"
    case water = "Вода"
    case beer = "Пиво"
}

struct Dish: DishProtocol {
    var name: String
    var typeOfDish: TypeOfDish
    var ingredients: [(FoodProduct, Int)]
    var cookingTime: Int
    var price: Double
}

//2.3 заказ

class Order: OrderProtocol {
    var timeOfGettingOrder: Int = 0
    var timeOfGivingOrder: Int = 0
    var dishInOrder: [Dish] = []
    var isReady: Bool = false
}


//3. создаем хранилища, они входят в класс ресторана

class Restaurant: RestaurantProtocol {
    var name: String
    var restaurantEmployee: [RestaurantEmployeeProtocol] = []
    var storeHouse: [FoodProductType] = []
    var orders: [OrderProtocol] = []
    var menu: [Dish] = []

    init(name: String) {
        self.name = name
    }

    func orderFoodProduct(foodProduct: [(FoodProduct, Int)]) -> [(FoodProduct, Int)] {
        storeHouse.insert(contentsOf: foodProduct, at: 0)
        return storeHouse
    }

    func addingDishToMenu(dish: Dish) -> [Dish] {
        menu.insert(dish, at: 0)
        return menu
    }

    func rKeaper(order: Order) -> [OrderProtocol] {
        orders.append(order)
        for order in orders {
            print(order.dishInOrder.self)
        }
        return orders
    }
}


//создали 5 блюд

var salad: Dish = Dish(name: "Salad",
                       typeOfDish: .salad,
                       ingredients: [(.egg, 2),
                                     (.oil, 1),
                                     (.peper, 3),
                                     (.saladLeaves, 2)],
                       cookingTime: 10,
                       price: 300.00)


var beaf: Dish = Dish(name: "Beaf",
                      typeOfDish: .hotMeal,
                      ingredients: [(.beaf, 1),
                                     (.oil, 1),
                                     (.peper, 3)],
                      cookingTime: 30,
                      price: 500.00)

var beer: Dish = Dish(name: "Kozel",
                      typeOfDish: .drink,
                      ingredients: [(.beer, 1)],
                      cookingTime: 0,
                      price: 300.00)

var chicken: Dish = Dish(name: "Chicken",
                         typeOfDish: .hotMeal,
                         ingredients: [(.chicken, 1),
                                     (.oil, 1),
                                     (.peper, 3)],
                         cookingTime: 20,
                         price: 350.00)

var frenchFries: Dish = Dish(name: "Potato Fry",
                             typeOfDish: .garnish,
                             ingredients: [(.potato, 3),
                                           (.oil, 5),
                                           (.peper, 3),
                                           (.salt, 20)],
                             cookingTime: 10,
                             price: 150.00)

//создали ресторан с хранилищами

var alDente = Restaurant(name: "Al Dente")


// бахнули продукты в хранилище
alDente.orderFoodProduct(foodProduct: [(.egg, 50),
                                       (.salt, 10),
                                       (.chicken, 20),
                                       (.beaf, 30),
                                       (.peper, 1000),
                                       (.onion, 200),
                                       (.bread, 30),
                                       (.oil, 50),
                                       (.sauce, 50),
                                       (.saladLeaves, 200),
                                       (.potato, 20),
                                       (.rice, 30),
                                       (.spice, 55),
                                       (.water, 100),
                                       (.beer, 200)])

alDente.addingDishToMenu(dish: frenchFries)
alDente.addingDishToMenu(dish: beer)
alDente.addingDishToMenu(dish: beaf)
alDente.addingDishToMenu(dish: salad)
alDente.addingDishToMenu(dish: chicken)
alDente.menu

// заказ
var orderOne = Order()
orderOne.dishInOrder = [chicken, beer]
orderOne.isReady = true
orderOne.timeOfGettingOrder = 1
orderOne.timeOfGivingOrder = 20

//хранилище заказов
alDente.rKeaper(order: orderOne)
alDente.orders

//Ну как-то так
//Логика реализуется через делегаты, как я раньше делал
/*
 Если все правильно, есть ли смысл делать логику? В принципе, задача на логику со звездочкой,
 а мне кроме как через делегаты другое не нравиться: нету той красоты),
 а у меня еще гит висит:)
*/

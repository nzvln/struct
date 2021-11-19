import UIKit

var greeting = "Hello, playground"
/* Задание 1
 
 Реализуйте структуру Point, описывающую точку на плоскости (2 оси)
 Структура должна обладать следующими характеристиками:
 – свойство, описывающее координаты точки на плоскости
 – метод, принимающую другую точку в качестве входного аргумента и возвращающий расстояние между текущей точкой и переданной
 Проверьте работоспособность вашей структуры
 Расстояние между точками с координатам (10,20) и (15,22) должно быть равно [Double] 5.385164807134504 */
struct Point {
    var coodinates: (x: Int, y: Int)
    func distance( _ point: Point) -> Double{
        return sqrt(
            pow(Double( point.coodinates.0-self.coodinates.0 ), 2) +
            pow(Double( point.coodinates.1-self.coodinates.1 ), 2)
        )
    }
}
var a = Point(coodinates: (10,20))
var b = Point(coodinates: (15,22))
a.distance(b)

/* Задача 2
 Ранее мы уже моделировали с вами сущность шахматная фигура с помощью перечисления Chessman. В этот раз мы смоделируем фигуру с помощью структуры, значительно расширив возможности данной модели. Вы конечно же можете использовать наработки из заданий главы “Перечисления”.
 1) Создайте перечисление Color, которое будет содержать два члена, описывающих цвета фигур. Для каждого члена укажите связанное значение, определяющее наименование цвета на английском языке
 2) Создайте перечисление Type, членами которого будут являться шахматные фигуры. Для каждого члена укажите связанное значение, определяющее наименование фигуры на английском языке
 3) Объявите две переменные. Первой инициализируйте член перечисления Color, а второй – Type
 4) Создайте структуру Chessman, которая описывает сущность “шахматная фигура”.
 Перечисление должно содержать следующие элементы:
 – свойство color типа Color, определяющее цвет фиугры
 – свойство type типа Type, определяющее тип фигуры
 – свойство coordinates типа (Character, UInt)?, определяющее координаты фигуры на шахматной доске.
 – свойство symbol, определяющее UTF-символ данной шахматной фигуры (тип Character)
 – инициализатор, принимающий значения свойств color и type, и устанавливающий coordinates в nil, а symbol в ""
 – инициализатор, принимающий на вход значения для всех свойств: color, type, coordinates, symbol
 – метод setCoordinates(Character,UInt), позволяющий установить новые координаты фигуры
 – метод kill(), сменяющий координаты на nil (убивающий фигуру)
 5) Объявите переменную whiteKing и инициализируйте ей значение типа Chessman, описывающее фигуру “Белый король”. Попробуйте использовать каждый из созданных методов структуры.*/
//1
enum Color: String {
    case black = "Black"
    case white = "White"
}
//2
enum Type: String {
    case king = "King"
    case queen = "Queen"
    case knight = "Knight"
    case bishop = "Bishop"
    case rook = "Rook"
    case pawn = "Pawn"
}
//3
var first = Color.black.rawValue
var second = Type.king.rawValue
//4
struct Chessman {
    var color: Color
    var type: Type
    var coordinates: (Character, UInt)?
    var symbol: Character
    init (color: Color, type: Type) {
        self.color = color
        self.type = type
        self.coordinates = nil
        self.symbol = "?"
    }
    init (color: Color, type: Type, coordinates: (Character,UInt)?, symbol: Character) {
        self.color = color
        self.type = type
        self.coordinates = coordinates
        self.symbol = symbol
    }
    // метод позволяющий менять координаты
    mutating func setCoordinates(_ a: Character, _ b: UInt) {
        self.coordinates = (a,b)
    }
    // метод дающий возможность убивать фигуру
    mutating func kill() {
        self.coordinates = nil
    }
}

//5

var whiteKing = Chessman(color: .white, type: .king)
whiteKing.setCoordinates("A",5)
whiteKing.kill()
print(whiteKing)

var blackKing = Chessman(color: .black, type: .king, coordinates: ("A",2), symbol: "\u{265A}")
print(blackKing)

/* Задание 3
 1) Cоздайте структуру, описывающую сущность “Пользователь”. В ее состав должны входить следюущие элементы:
 – свойства, содержащие имя и фамилию
 – инициализатор, принимающий только имя
 – инициализатор, принимающий имя и фамилию
 – метод, возвращающий информационную строку с указание имени и фамилии пользователя
 – методы, изменяющие имя и фамилию
 2) Проверьте созданную структуру*/
struct User {
    var name: String
    var secondName: String
    init (name: String) {
        self.init(name: name, secondName: "")
    }
    init (name: String, secondName: String) {
        self.name = name
        self.secondName = secondName
    }
    func returnUser() {
        print("Name: \(name), Second Name: \(secondName)")
    }
    mutating func name(name: String) {
        self.name
    }
    mutating func secondName(secondName: String) {
        self.secondName
    }
}
var user = User(name: "Nadia", secondName: "Zavalii")
print(user.returnUser())

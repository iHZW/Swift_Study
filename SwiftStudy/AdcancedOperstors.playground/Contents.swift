//: A UIKit based Playground for presenting user interface
  
import UIKit
//import PlaygroundSupport
//
//class MyViewController : UIViewController {
//    override func loadView() {
//        let view = UIView()
//        view.backgroundColor = .white
//
//        let label = UILabel()
//        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
//        label.text = "Hello World!"
//        label.textColor = .black
//
//        view.addSubview(label)
//        self.view = view
//    }
//}
//// Present the view controller in the Live View window
//PlaygroundPage.current.liveView = MyViewController()



/*
 枚举
 Objective-C 中 实际是中整形数据
 Swift 中 是一种独立的数据类型, 更灵活, 可以设置初始值,相关值类扩展枚举的功能
 */

/*
 溢出运算符是Swift语言独有的
 Swift语言对代码安全性的注重,正常的运算是不允许出现溢出行为的.
 开发者使用溢出运算符可以控制是否允许溢出运算
 */

var a:UInt8 = 0b1000
print(a)

//取反
a = ~a
print(a)
a = ~a
//按位与运算
a = 0b11111111&a
print(a)
//按位或运算
a = 0b11110111 | a
print(a)
a = 0b11111111
print(a)

//按位异或 ^  相同取0,不同取1
a = 0b11111111
a = 0b11110000^a
print(a)

//按位左移运算符 << 用于将数据每一位上的值进行左移操作,实例如下
a = 1<<1
print(a)
a = a<<1
print(a)

//按位右移运算符 >>  用于将数据每一位上的值进行右移操作,实例如下
a = a>>1
print(a)

// &+, &- &* &/ 允许溢出操作
var b:UInt8 = 255
b = b &+ 1
b = b &- 1
b = b &* 2

/*
 重载运算符
 对同一个函数名,设置不同的参数类型以实现不同的功能被称为函数的重载.
 OC严格意义上讲不存在函数重载操作
 */

func addFunc(p1:Int, p2:Int) -> Int {
    return p1+p2
}

func addFunc(p1:Double, p2:Double) -> Double {
    return p1+p2
}

func addFunc(p1:String, p2:String) -> String {
    return p1+p2
}

var value = addFunc(p1: 1.0, p2: 2.0)
value = addFunc(p1: 1, p2: 4)
var value2 = addFunc(p1: "123", p2: "45")

print(value,value2)


class Circle {
    //圆心
    var center:(Double, Double)
    //半径
    var radius:Double
    init(center:(Double, Double), radius:Double) {
        self.center = center
        self.radius = radius
    }
}

/*
 通过重载 "+" 号运算符 可以实现自定义类的 + 法
 */
func +(param1:Circle, param2:Circle) -> Circle {
    return Circle(center: param1.center, radius: param1.radius+param2.radius)
}

let circleOne = Circle(center: (0,0), radius: 10)
let circleTwo = Circle(center: (2,2), radius: 15)
let circleThree = circleOne + circleTwo
print(circleThree)


func myFunc(closure:(Circle, Circle) -> Circle) -> Circle{
    return closure(circleOne, circleTwo)
}
let myFuncValue = myFunc(closure: +)
print(myFuncValue.center, myFuncValue.radius)


/*
 声明自定义运算符  ++
 prefix operator ++
 prefix func ++()->
 
 */
postfix operator ++
postfix func ++(param:Int) ->Int {
    return param + 1
}

var addValue = 10;
//++Int(addValue)
let addValue1 = addValue++
print(addValue1)


/*
 自定义 中缀 "--"运算符
 
 */
infix operator --
func --(param1:Int, param2:Int) -> Int {
    return param1 - param2
}

var minusValue = 1--2
print(minusValue)

//创建一个姓氏类型枚举
enum Surname {
    //使用case进行枚举值的定义
//    case 张
//    case 王
//    case 李
//    case 赵
    // 在一条case语句中定义多个枚举
    case 张,王,李,赵
    
}

//创建一个姓氏枚举类型的变量
var sur:Surname
//对sur变量进行赋值
sur = .张
sur = Surname.李

switch sur {
case .张:
    print("姓张")
case .王:
    print("姓王")
case .李:
    print("姓李")
case .赵:
    print("姓赵")
}

/*
 枚举的原始值
 */
enum Dog:Character {
    case a = "a"
    case b = "b"
    case c = "c"
    case d = "d"
}

var dog:Dog = .b

switch dog {
case .a:
    print("---a--")
default:
    print("--default---")
}

var char = Dog.b
print(char)

//获取char枚举变量的原始值 "b"
var rawValue = char.rawValue
print(rawValue)

//通过原始值 构造枚举变量 .c
var char1 = Dog(rawValue: "c")
print(char1 ?? .a)


/*
 枚举的相关值, 最能够体现Swift语言的灵活与现代
 */
enum Shape {
    //圆形 设置圆心和半径为相关值
    case circle(center:(Double,Double), radius:Double)
    //矩形 设置中心, 宽, 高为相关值
    case rect(center:(Double, Double), width:Double, height:Double)
    //三角形 设置3个顶点为相关值
    case triangle(point1:(Double, Double), point2:(Double, Double), point3:(Double, Double))
}

var circle1:Shape = .circle(center: (1.0, 1.0), radius: 5.0)

func shapeFunc(param:Shape) {
    switch param {
    case let .rect(center, width, height):
        print("-\(center)--\(width)--\(height)")
    case let .circle(center, radius):
        print("\(center)--\(radius)")
    case let .triangle(point1, point2, point3):
        print("\(point1)--\(point2)--\(point3)")
    default:
        print("---default---")
    }
}

shapeFunc(param: circle1)

/*
 递归实现一个正整数的阶乘
 */
func mathsFunc(param: Int) -> Int {
    let temp = param - 1
    print("\(param)---\(temp)")
    if temp > 0 {
        return mathsFunc(param: temp) * param
    } else {
        return 1
    }
}

let resultValue = mathsFunc(param: 3)
print(resultValue)


enum EXpression1 {
    //表示加法运算 两个相关值param1与param2代表进行加法运算的两个参数
    case add(param1: Int, param2:Int)
    //表示减法运算 两个相关值param1与param2代表进行加法运算的两个参数
    case sub(param1: Int, param2:Int)
    //表示乘法运算 两个相关值param1与param2代表进行加法运算的两个参数
    case mul(param1: Int, param2:Int)
    //表示除法运算 两个相关值param1与param2代表进行加法运算的两个参数
    case div(param1: Int, param2:Int)
}

//使用枚举来模拟加减乘除四则运算
enum EXpression {
    //描述打单个数字
    case num(param:Int)
    //表示加法运算
    indirect case add(param1: EXpression, param2:EXpression)
    //表示减法运算
    indirect case sub(param1: EXpression, param2:EXpression)
    //表示乘法运算
    indirect case mul(param1: EXpression, param2:EXpression)
    //表示除法运算
    indirect case div(param1: EXpression, param2:EXpression)
}

/*
 可以将整个枚举声明我可递归的 如下 EXpressionNew
 */

indirect enum ExperssionNew {
    //描述打单个数字
    case num(param:Int)
    //表示加法运算
    case add(param1: EXpression, param2:EXpression)
    //表示减法运算
    case sub(param1: EXpression, param2:EXpression)
    //表示乘法运算
    case mul(param1: EXpression, param2:EXpression)
    //表示除法运算
    case div(param1: EXpression, param2:EXpression)
}


var value001:EXpression = .add(param1: EXpression.num(param: 5), param2: EXpression.num(param: 5))
var value002:EXpression = .mul(param1: value001, param2: EXpression.num(param: 2))
var value003:EXpression = .sub(param1: value002, param2: EXpression.num(param: 8))
var value004:EXpression = .div(param1: value003, param2: EXpression.num(param: 2))
print("----",value004)


/*
 这个递归函数作用是将Expression描述的表达式进行运算 结果返回
 */
func expressionFunc(param: EXpression) -> Int {
    switch param {
        // 单值返回
    case let .num(param):
        return param
        // 返回加法运算结果
    case let .add(param1, param2):
        return expressionFunc(param: param1) + expressionFunc(param: param2)
        // 返回减法运算结果
    case let .sub(param1, param2):
        return expressionFunc(param: param1) - expressionFunc(param: param2)
        // 返回乘法运算结果
    case let .mul(param1, param2):
        return expressionFunc(param: param1) * expressionFunc(param: param2)
        // 返回除法运算结果
    case let .div(param1, param2):
        return expressionFunc(param: param1) / expressionFunc(param: param2)
    }
}

expressionFunc(param: value004)


/*
 模拟C语言通过自定义运算符的方式实现前缀自增、前缀自减、后缀自增、后缀自减运算符
 */
prefix operator +++
prefix func +++(param:Int) -> Int{
    return param+1
}

prefix operator ---
prefix func ---(param:Int) -> Int{
    return param-1
}

postfix operator +++
postfix func +++(param:Int) -> Int {
    return param+1
}

postfix operator ---
postfix func ---(param:inout Int) -> Int {
    return param-1
}

infix operator ++
func ++(param1:inout Int, param2:inout Int) -> Int {
    return param1 + param2
}

var prefixValue = 10
prefixValue = +++prefixValue
print(prefixValue)

prefixValue = ---prefixValue
print(prefixValue)

prefixValue = prefixValue+++
print(prefixValue)

prefixValue---
print(prefixValue)

var infixValue = 10
infixValue++prefixValue
print(infixValue, prefixValue)


/*
 重载加法运算, 支持对区间范围的相加操作
 例如 (0...5) + 5 -> (0...10)
 */
func +(param1: ClosedRange<Int>, param2: Int) -> ClosedRange<Int> {
    return param1.lowerBound...param1.upperBound + param2
}

var transformValue = (0...5)
transformValue = transformValue+5
print(transformValue)

/*
 自定义新后缀运算符“*!”，其功能是对某个数进行阶乘计算。
 */
postfix operator *!
postfix func *!(param:inout Int) -> Int {
    var temp = param
    var resultValue = 1
    while temp > 0 {
        resultValue *= temp
        temp -= 1
    }
    param = resultValue
    return param
}

var mulValue = 3
mulValue*!
print(mulValue)

/*
 模拟设计一个交通工具枚举，将速度与乘坐价钱作为枚举的相关值。
 */
indirect enum TrafficTool {
    //速度
    case speed(param:Double)
    //价格
    case price(param:Double)
    //自行车
    case bicycle(speed:TrafficTool, price:TrafficTool)
    //公交车
    case bus(speed:TrafficTool, price:TrafficTool)
    //私家车
    case car(speed:TrafficTool, price:TrafficTool)
    //地铁
    case metro(speed:TrafficTool, price:TrafficTool)
}

//var tool1:TrafficTool = .speed(param: 10.0)
//var tool2:TrafficTool = .price(param: 5.0)
//var tool3:TrafficTool = .bicycle(speed: tool1, price: tool2)
//var tool4:TrafficTool = .car(speed: tool3, price: tool2)
//
//func transformTool(param:TrafficTool) -> Double {
//
//    switch param {
//
//    case let .speed(param):
//        return param
//
//    case let .price(param):
//        return param
//
//    case let .bicycle(speed, price):
//        return  transformTool(param:speed)
//
//    case let .bus(speed, price):
//        return transformTool(param: speed)
//    case let .car(speed, price):
//        return transformTool(param: speed)
//    case let .metro(speed, price):
//        return transformTool(param: speed)
//
//    }
//}
//
//transformTool(param: tool4)


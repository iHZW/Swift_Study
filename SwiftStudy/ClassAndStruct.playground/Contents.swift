//: A UIKit based Playground for presenting user interface
  
import UIKit

/*
 结构体: Car
 OC中: 只能定义属性, 不能定义方法
 Swift: 可以定义属性, 也可以定义方法, 相对与类来说, 差个继承的特性
 */


struct Car {
    //设置几个属性
    //价格
    var price:Double
    //品牌
    var brand:String
    //油量
    var petrol:Int
    
    //提供一个耗油的方法
    mutating func drive() {
        //开车 油量下降 1
        if petrol>0 {
            petrol -= 1
            print("drive 10 milo")
        }
    }
    // 提供一个加油的方法
    mutating func addPetrol() {
        petrol += 10
        print("加了10单位油")
    }
}
//创建一个汽车结构体, 价格为11000.0元, 品牌为奔驰,初始油量为30
var car = Car(price: 11000.0, brand: "奔驰", petrol: 30)
//使用点语法获取car实例属性
print(car.price, car.brand, car.petrol)
//模拟汽车行为
for _ in 0...35 {
    if car.petrol == 0 {
        car.addPetrol()
    } else {
        car.drive()
    }
}

/*
 Swift中数据类型分为值类型和引用类型
 只有类是引用类型
 其他是值类型
 最大的区别是: 当进行数据传递时, 值类型总是被复制, 而引用类型不会被复制,引用类型是通过引用计数来管理其生命周期的.
 */

/*
 创建一个ClassCar
 */

class ClassCar {
    //价格
    var price:Double
    //品牌
    var brand:String
    //油量
    var petrol:Int
    //开车
    func drive() {
        if petrol > 0 {
            petrol -= 1
            print("class-drive 10 milo")
        }
    }
    //加油
    func addPetrol() {
        petrol += 10
        print("class-加了10单位油")
    }
    //提供一个构造方法
    init(price:Double, brand:String, petrol:Int) {
        self.price = price
        self.brand = brand
        self.petrol = petrol
    }
    
    init(param: ClassCar) {
        self.price = param.price
        self.brand = param.brand
        self.petrol = param.petrol
    }
}

var classCar = ClassCar(price: 5000.0, brand: "宝马", petrol: 100)
print(classCar.petrol)
var tempClassCar = ClassCar(param: classCar)
tempClassCar.brand = "五菱星辰"
print(classCar.brand, tempClassCar.brand)


/*
 创建一个交通工具基类
 提供一个油量指标 默认值为10
 通过一个加油方法,一个耗油方法
 */
class Transportation {
    //油量 默认提供10
    var petrol:Int = 10
    //提供一个行驶的方法
    func drive() {
        if petrol <= 0 {
            self.addPetrol()
        }
    }
    
    func addPetrol() {
        petrol += 10
    }
    
    init(petrol: Int) {
        self.petrol = petrol
    }
    
}

class Bicycle : Transportation {
    override func drive() {
        super.drive()
        self.petrol -= 1
    }
   
}

class MyBus : Transportation {
    override func drive() {
        super.drive()
        
        self.petrol -= 3
    }
}

class MyCar : Transportation {
    override func drive() {
        super.drive()
        self.petrol -= 5
    }
}

var tempBicycle = Bicycle.init(petrol: 20)
print(tempBicycle.petrol)
tempBicycle.drive()
tempBicycle.drive()
print(tempBicycle.petrol)

var tempBus = MyBus.init(petrol: 20)
print(tempBus.petrol)
tempBus.drive()
tempBus.drive()
tempBus.drive()
tempBus.drive()
tempBus.drive()
tempBus.drive()
tempBus.drive()
print(tempBus.petrol)

/*
 被 final修饰的属性和方法不能够被子类覆盖重写,示例如下
 */
class Shape {
    var name:String = "无形"
    final var center:(Double, Double)
    init() {
        center = (0, 0);
    }
}

class Circle : Shape {
    
}

var circleOne = Circle.init()
print(circleOne.center)
circleOne.center = (10.0, 10.0);
print(circleOne.center)


final class ShapeOne {
    var name:String = "无形"
    final var center:(Double, Double)
    init() {
        center = (0, 0);
    }
}

/*
 适合使用结构体的情况
 1: 要描述的数据类型中有少量的简单数据类型的属性
 2: 要描述的数据类型在数据传递时需要以复制的方式进行
 3: 要描述的数据类型中有属性在进行传递时,需要以复制的方式进行
 4: 不需要继承另一个数据类型
 
 注意: 对值类型进行比较操作,使用 "=="
      对引用类型进行比较操作 使用 "==="
 */

// Swift语言在幕后会控制只有绝对需要时才进行真正的复制操作,以确保性能最优,因此开发者在编写代码时没有必要回避复制行为来确保性能

enum Sex {
    
    case 男
    
    case 女
}

class Student {
    
    var name: String
    
    var age: Int
    
    var sex: Sex
    
    func study () {
        print("\(name)-\(age)-\(sex)-学习中...-")
    }
    
    init(name:String, age:Int, sex:Sex) {
        self.name = name
        self.age = age
        self.sex = sex
    }
}

var stu1 = Student(name: "小明", age: 18, sex: .男)
print(stu1.sex)


class ClassManager {
    
    var className:String
    
    var studentNo: Int
    
    var squadLeader: Student
    
    //转入
    func intoClass() {
        self.studentNo += 1
    }
    //转出
    func rollOut() {
        if self.studentNo > 0 {
            self.studentNo -= 1
        }
    }
    
    init(className:String, studentNo:Int, squadLeader:Student) {
        self.className = className
        self.studentNo = studentNo
        self.squadLeader = squadLeader
    }
}

var classOne = ClassManager(className: "三年级一班", studentNo: 20, squadLeader: Student(name: "小丸子", age: 18, sex: .女))
classOne.intoClass()
print(classOne.className, classOne.squadLeader.name, classOne.studentNo)
classOne.rollOut()
print(classOne.className, classOne.squadLeader, classOne.studentNo)


class TeacherClass {
    
    var subject:String
    
    var name:String
    
    var listDic:Dictionary<String, Student> = Dictionary()
    
    var list:Array<Student> = Array()

    func studentMethod() {
        
//        for (key, info) in self.listDic {
//            info.study()
//        }
        // 简写
        self.listDic.forEach {
            $1.study()
        }
        
//        for info in self.list {
//            info.study()
//        }
    }
    
//    init(subject:String, name:String, list:Dictionary<String, Student>) {
//        self.subject = subject
//        self.name = name
//        self.list = list
//    }
    
    init(subject:String, name:String, list:Array<Student>) {
        self.subject = subject
        self.name = name
        self.list = list
        for info in list {
            self.listDic[info.name] = info
        }
    }
}

let student01 = Student(name: "小王", age: 18, sex: .男)
let student02 = Student(name: "小红", age: 18, sex: .女)
var teacherOne = TeacherClass(subject: "语文", name: "Merry", list: [student01, student02])
teacherOne.studentMethod()
print(teacherOne.subject, teacherOne.name)

var student03 = teacherOne.listDic["小王"]
student03?.study()

/*
 可用来存储属性只有   类和结构体
 可用来计算属性的有    类/结构体/枚举
 */

class Work {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class People {
    var age: Int
    //使用延迟存储属性, 确保在使用的时候在初始化
    lazy var work: Work = Work(name: "上学")
    
    init(age: Int) {
        self.age = age
    }
}

var p1 = People(age: 18)
print(p1.age)
print(p1.work.name)

/*
 需要注意的是, 延迟存储属性,并不是线程安全的, 多线程中对延迟属性进行调用,不能保证其 只被构造一次
 */


class CircleClass {
    
    var radius: Double
    
    var center: (Double, Double)
    // 给圆的周长设置 get方法 set方法  newValue就是新设置的值
    var l: Double {
        get {
            return 2*Double.pi*radius
        }
        set {
            radius = newValue/2/Double.pi
        }
    }
    // 圆的面积
    var s: Double {
        get {
            return pow(radius, 2)*Double.pi
        }
//        set {
//            radius = sqrt(newValue/Double.pi)
//        }
        set (value){
            radius = sqrt(value/Double.pi)
        }
    }
    
    init(center: (Double, Double), radiud: Double) {
        self.center = center
        self.radius = radiud
    }
}

var circle_1 = CircleClass(center: (1.0, 1.0), radiud: 1.0)

print("l = \(circle_1.l)--s = \(circle_1.s)")
circle_1.s = 100*Double.pi
print("l = \(circle_1.l)--r = \(circle_1.radius)")

/*
 属性监听
 注意: 在进行属性的构造或初始化时,无论通过构造方法进行的属性构造或初始化还是通过为属性设置默认值,都不会调用属性监听器的方法. 只有初始化后再次对属性赋值开始, 属性监听器才会被调用.
 */

class Person {
    var name:String {
        //此属性将要被赋值时会调用的方法
        willSet {
            //其中会默认生成一个newValue 来接收外界传进来的新值
            print("将要设置新名称为\(newValue)")
        }
        //此属性已经被赋值后会调用的方法 默认值oldValue
        didSet {
            //其中会默认生成一个oldValue来保存此属性的原始值
            print("旧名称为\(oldValue)")
        }
    }
    
    init(name:String) {
        self.name = name
    }
}

var person_01 = Person(name: "小明")
print(person_01.name)

person_01.name = "小王"
print(person_01.name)


/*
 实例属性与类属性
 1: 实例属性由类的实例调用, 类属性由类调用
 2: 实例属性与具体实例相关联,一般用来描述类实例的一些特性;
    类属性与此类型相关,用来描述整个类型的某些特性
 3: 使用static或 class关键字声明
 4: 使用static声明的属性也称为静态属性, 对于计算属性,如果需要子类对其计算方法进行覆写,则需要用class关键字来声明,实例代码如下
 */
class SomeClass {
    //静态存储属性
    static var className:String = "SomeClass"
    //静态计算属性
    static var subName:String {
        return "sub"+className
    }
    //可以被子类覆写的计算属性
    class var classSunName:String {
        return "class"+subName
    }
    
    static func eat() {
        print("吃肉")
    }
    
    class func play() {
        eat()
        print("打篮球")
    }
    
}

//此属性不需要创建实例对象,直接用类名来调用
SomeClass.className
SomeClass.subName
SomeClass.classSunName
SomeClass.eat()
SomeClass.play()
//创建一个继承于SomeClass 的子类

class SubSomeClass : SomeClass {
    override class var classSunName: String {
        return "SubSomeClass"
    }
    
    override class func play() {
        super.play()
        print("sub-踢足球")
    }
    
}
SubSomeClass.classSunName
SubSomeClass.play()
/*
 实例方法和类方法
 一般情况下属性和方法被调用的时候self是可以省略的,  只有参数名和属性名/方法名一样的时候是不可以省略的
 */

/*
 模拟系统的Array数组,创建一个自己的数组类
 */

class MyArray {
    
    var array:Array<Int>
    
    init(param:Int...) {
        array = param
    }
    //subcript是swift中用于定义下标功能的方法
    subscript(index:Int) -> Int {
        get {
            return array[index]
        }
        set {
            array[index] = newValue
        }
    }
}

var myArr = MyArray(param: 1,2,3,4,5,6)
let value_arr = myArr[5]
print(value_arr, myArr[0])
myArr[0] = 0
print(myArr[0], myArr.array)

class MyArrayTwo {
    
    var array:Array<Array<Int>>
    
    init(param:Array<Array<Int>>) {
        array = param
    }
    
    subscript(index1:Int, index2:Int) -> Int {
        get {
            var t_index1 = index1
            var t_index2 = index2
            // 做保护
            if t_index1 >= array.count - 1 {
                t_index1 = array.count - 1
            } else if t_index1 < 0 {
                t_index1 = 0
            }
            let tempArr = array[t_index1]
            
            if t_index2 >= tempArr.count - 1 {
                t_index2 = tempArr.count - 1
            } else if t_index2 < 0 {
                t_index2 = 0
            }
            return tempArr[t_index2]
//            return array[index1] [index2]
        }
        set {
            array[index1] [index2] = newValue
        }
    }
}

var myArrTwo = MyArrayTwo(param: [[1,2,3,4],[4,5,6],[7,8,9]])

let myArrTwoValue = myArrTwo[2, 4]
print(myArrTwoValue)


/*
 设计一个线段结构体，为其提供中心点、长度、斜率3个计算属性。
 */

struct Line {
    
    var point1:(Double, Double)
    
    var point2:(Double,Double)
    
    var center:(Double, Double) {
        //计算中心点坐标
        return ((point1.0 + point2.0)/2, (point1.1 + point2.1)/2)
    }
    
    //sqrt 为开平方函数 abs 为绝对值函数  勾股定理
    var width:Double {
        let value = pow(abs(point2.0 - point1.0), 2) + pow(abs(point2.1 - point1.1), 2)
        return sqrt(value)
    }
    //计算斜率   对边/临边
    var k:Double {
        return (point2.1 - point1.1)/(point2.0 - point1.0)
    }
    
    init(point1:(Double, Double), point2:(Double, Double)) {
        self.point1 = point1
        self.point2 = point2
    }
}

var line = Line(point1: (1.0,1.0), point2: (5.0,4.0))

print("center:\(line.center)--width:\(line.width)--k:\(line.k)")


class TestInitClass {
    var name:String = "111"
    var age:Int
    var work:String? //可以没工作(nil),
    
    init() {
        age = 10
        //构造函数里没有对可选类型赋值, 默认为nil
    }
}

var class_init = TestInitClass()
class_init.work
class_init.name
class_init.age

/*
 值类型 如结构体, 系统会默认提供一个构造方法
 如果自定义了一个构造方法,那么系统提供的构造刚发就失效了
 为了安全考虑,防止开发者调用自定义的构造方法却误调用到系统生成的构造方法
 */

struct MyStruct {
    
    var age:Int = 0
    var name:String
    init(age:Int, name:String) {
        self.age = age
        self.name = name
    }
    //这个构造方法中调用其他构造方法  构造方法嵌套使用
    init() {
        self.init(age: 24, name: "小王")
    }
}

var myStruct = MyStruct.init()
print(myStruct.name, myStruct.age)

/*
 指定构造方法和便利构造方法 Swift有如下原则
 
 1: 子类的指定构造方法中必须调用父类的指定构造方法
 2: 便利构造方法中必须调用当前类的其他构造方法
 3: 便利构造方法归根结底要调用到某个指定构造方法
 */

var image:UIImage = UIImage(named: "con_1") ?? UIImage()

/*
 构造方法的继承关系, 有如下原则
 1: 在继承关系中,如果子类没有覆写或者重写任何指定构造方法,则默认子类会继承父类所有的指定构造方法
 2: 如果子类中提供了父类所有的指定构造方法(无论是通过继承方式还是覆写方式),则子类会默认继承父类的遍历构造方法
 */

/*
 构造方法的安全检测
 1: 子类的指定构造方法中,必须完成当前类所有存储属性的构造,
 才能调用父类的指定构造方法.此检查可以保证: 在构造完从父类继承下来的所有存储属性前,本身定义的所有存储属性也完成构造.
 2: 子类如果要自定义父类中存储属性的值,必须在调用父类的构造方法之后进行设置.此检查可以保证: 子类在设置从父类继承下来的存储属性时,此属性已构造完成.
 3: 如果便利构造方法中需要重新设置某些存储属性的值,必须在调用指定构造方法之后进行设置.此检查可以保证: 遍历狗仔方法中对存储属性值的设置不会被指定方法中的设置覆盖
 4: 子类子啊调用父类的构造方法之前,不能使用self来引用属性(基类无所谓). 此检查可以确保在使用self关键字调用实例本身时.实例已经构造完成
 */

var image2:UIImage = UIImage(named: "con_2") ?? UIImage()

class Check {
    
    var property: Int
    
    required init(param: Int) {
        property = param
    }
    //这个属性的构造使用闭包的方式进行
    var name:Int = {
        return 6+6
    }()
}

var check = Check(param: 1)
check.name
print(check.name)
check.name = 30
print(check.name)


class Temp {
    //析构函数
    deinit {
        print("函数被销毁")
    }
}

var temp:Temp? = Temp()
temp = nil

//子弹类
class Bullet {
    
    var location:Int
    
    static var speed: Int = 30
    
    func fly() {
        self.location += Bullet.speed
    }
    
    init(location:Int) {
        self.location = location
    }
    
    deinit {
        print("子弹命中")
    }
}

//敌人
class Enemy {
    
    var location:Int
    
    static var speed:Int = 10
    
    func escape() {
        self.location += Enemy.speed
    }
    
    init (location:Int) {
        self.location = location
    }
    
    deinit {
        print("敌人被击毙")
    }
}
//创建实例 子弹/敌人
var bullet:Bullet? = Bullet(location: 0)
var enemy:Enemy? = Enemy(location: 300)
//记录回合数
var i = 0
while (bullet!.location) < (enemy!.location) {
    bullet?.fly()
    enemy?.escape()
    i += 1
    print("追击\(i)回合-子弹\(bullet!.location)-敌人\(enemy!.location)")
}
//将敌人和子弹一起销毁
bullet = nil
enemy = nil


var bullet1:Bullet? = Bullet(location: 1)
var bullet2 = bullet1
var bullet3 = bullet2

bullet2 = nil
bullet1 = nil
bullet3 = nil

/*
 弱引用weak解决循环引用, 只能修饰Optional类型的属性
 若使用非Optional类型的属性,需要使用unowned(无主引用)来处理
 */
class Class100 {
    //不是Optional值, 不能使用weak 需要使用 unowned
    unowned var cls: Class101
    var name: String = "Class100"
    init(cls: Class101) {
        self.cls = cls
    }
    
    deinit {
        print("Class100 deinit")
    }
}

class Class101 {
    //这里需要使用隐式拆包的方式
    var cls: Class100!
    
    init() {
        //1:在创建cls属性的时候当前类实例本本身为参数掺入
        //2:由构造方法的原则可知在cls属性创建完成之前,不可以使用self属性
        //3:对于隐式解析类型的属性,上述原则可以忽略.其告诉编译器默认此属性 是构造完成的
        cls = Class100(cls: self)
    }
    
    deinit {
        print("Class101 deinit")
    }
}

var class101:Class101? = Class101()
//class101?.cls.name
//class101 = nil

var class100:Class100? = Class100(cls: class101 ?? Class101())
class100 = nil
class101 = nil

/*
 闭包里的循环引用 使用  [unowned self] 这个解决
 */

class MyClass100 {
    
    var name:String = "hzw"
    
    lazy var closure:(_ param:String)->Void = {
        [unowned self] (p1:String) ->Void in
        print(self.name, p1)
    }
    
    deinit {
        print("MyClass100 deinit")
    }
}

var objc100:MyClass100? = MyClass100()
objc100?.closure("++")
objc100 = nil


/*
 异常抛出与传递
 */

//自定义异常类型
enum MyError:Error {
    //定义三种异常
    case DestroyError
    
    case NormalError
    
    case SimpleError
}

//print("should error")
//throw MyError.DestroyError
//print("finish")

func MyFunc(param:Bool)throws -> Void {
    if param {
        print("success")
    } else {
        throw MyError.DestroyError
    }
}

//try MyFunc(param: false)

//do {
//    try MyFunc(param: false)
//} catch MyError.NormalError {
//    print("NormalError")
//} catch {
//    print("otherError", error)
//}

if let _ = try? MyFunc(param: false) {
    print("success")
} else {
    print("fail")
}


/*
 使用延迟执行语句可以保证无论函数因为何种原因结束,在结束前都会执行延时结构块中的代码
 先打印 handle
 再打印 finish
 */
//func TemFunc() throws -> Void {
//    //延时执行
//    defer {
//        print("finish")
//    }
//    print("handle")
//
//    throw MyError.DestroyError
//}
//
//try TemFunc()


/*
 编写一个函数，其功能是输入一个学生分数，打印输出分数所在的成绩等级，60分以下为不及格，60~75分之间为及格，76~90分之间为良好，90分以上为优秀。需要注意，分数的取值范围为0~100之间，输入范围之外的分数将抛出异常，需要打印分数无效的提示。
 */

enum Level {
    
    case 优秀
    
    case 良好
    
    case 及格
    
    case 不及格
    
    case 无效
}

func inputResult(param: Double) -> Level {
    
    switch param {
        
    case let a where a >= 90.0 && a <= 100 :
        return .优秀
    case let a where a >= 76.0 && a < 90.0 :
        return .良好
    case let a where a >= 60.0 && a < 76.0 :
        return .及格
    case let a where a < 60.0 && a >= 0 :
        return .不及格
    default:
        return .无效
    }
}

let level = inputResult(param: 86.6)
print(level)



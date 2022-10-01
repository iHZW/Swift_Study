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
 判断某个实例是否属于某个具体类型,可以使用 is
 */
var str = "hzw"
//进行实例的类型检查
if str is String {
    print("str 的类型是String")
}

/*
 类型转换 swift中使用 as 关键字
 */

/*
 如果一些类型没有共同的基类,可以使用AnyObject来作为引用类型的通用类型
 AnyObject 是通用的引用类型, 只适用于引用类型
 Any 则更加通用, 可以适用于引用类型和值类型
 */
class MyClassOne {
    
}

class MyClassTwo {
    
}

class MyClassThree {
    
}

var clsOne = MyClassOne()
var clsTwo = MyClassTwo()
var clsThree = MyClassThree()

var classArr:Array<AnyObject> = [clsOne, clsTwo, clsThree]

for obj in classArr {
    if obj is MyClassOne {
        print("MyClassOne")
    } else if obj is MyClassTwo {
        print("MyClassTwo")
    } else if obj is MyClassThree {
        print("MyClassThree")
    }
}

//prefix operator ---
//prefix func ---<T>(param:inout T) -> T {
//    return param
//}

struct Stack<T> {
    var items:[T] = []
    mutating func push(param:T) {
        self.items.append(param)
    }
    mutating func pop() -> T {
        return self.items.removeLast()
    }
}
//给Stack 添加扩展
extension Stack {
    func getArray() -> [T] {
        return items
    }
}

var stack:Stack<Int> = Stack<Int>()
var stack1 = Stack<Int>()
stack.push(param: 1)
stack.push(param: 2)
let popValue = stack.pop()
stack.getArray()
print(popValue, stack.items)


class MyClass {
}
protocol MyProtocol {
    func myFunc();
}
struct StackOne<T:MyClass> {
//struct StackOne<T:MyProtocol> {
    var items:[T] = []
    mutating func push(param: T) {
        self.items.append(param)
    }
    mutating func pop() -> T {
        return self.items.removeLast()
    }
}

extension StackOne : MyProtocol {
    func myFunc() {
        print("StackOne --- myFunc")
    }
}
var stackOne = StackOne()
stackOne.myFunc()
stackOne.items

class MyProtocolOne: MyProtocol {
    func myFunc() {
        print("--myFunc--")
    }
}

class MyClassTC<T, C> where T:MyClass, C:MyProtocol {
    var param1: T
    var param2: C
    init(param1: T, param2: C) {
        self.param1 = param1
        self.param2 = param2
    }
}
var objValue = MyClassTC(param1: MyClass(), param2: MyProtocolOne())

protocol ProtocolNew {
    //定义实例属性
    //可读的
    var name:String{get}
    //可读可写
    var age:Int{set get}
    //可读
    var nameAndAge:String{get}
    // 类中定义 可读属性
    static var className:String{get}
    //声明实例方法
    func logName()
    //声明静态方法
    static func logClassName()
}
//创建一个类来遵守Protocol协议
class ClassNew: ProtocolNew {
    //进行协议中属性的实现
    var name: String = "小红"
    var age: Int = 18
    var nameAndAge: String {
        get{
            return "\(name)" + "\(age)"
        }
    }
    static var className: String {
        get {
            return "Myclass"
        }
    }
    
    func logName() {
        print("logName")
    }
    
    static func logClassName() {
        print("logClassName")
    }
}



protocol ProtocolNewTwo {
    func logName()
    static func logClassName()
}
protocol SubProtocolNewTwo: ProtocolNewTwo {
    //此协议中自动继承ProtocolNewTwo协议中约定的方法
    var name:String{set get}
}


class ProtocolClass:SubProtocolNewTwo {
    func logName() {
        print("logName")
    }
    static func logClassName() {
        print("logClassName")
    }
    var name: String = "class"
}

struct MyStructNew:ProtocolNewTwo {
    var name:String = "111"
    func logName() {
        print(self.name)
    }
    static func logClassName() {
        print("MyStructNew - logClassName")
    }
}

var myStruct = MyStructNew()
myStruct.logName()


@objc protocol SubProtocolNewThree: AnyObject {
    //此协议只能被类遵守
//    var titleName:String { get set }
//    @objc optional var age: Int {get}
    //此协议方法可选实现,即遵守协议的类可以实现也可以不实现
    @objc optional func log()
}
extension SubProtocolNewThree {
    func log() {
        print("log")
    }
}
class ClassE: SubProtocolNewThree {
    var titleName = "123"
}
var cls_e = ClassE()
cls_e.log()

// inout 参数读写冲突
var setSize = 1
func increment(number:inout Int) {
    number += 1
//    number += setSize  //读写冲突
}
increment(number: &setSize)

struct Player {
    var health:Int
    mutating func shareHealth(player:inout Player){
        health = player.health
    }
}
var player = Player(health: 10)
var player1 = Player(health: 20)
//要修改的结构体和传入的结构体是同一个导致读写访问冲突
//player.shareHealth(player: &player)
player.shareHealth(player: &player1)

class Demo {
    var playerInformation = (health:10, energy:20)
    var health:Int = 10
    var energy:Int = 10
    func balance(p1:inout Int, p2: inout Int) {
        print("balance")
    }
//    func balance(p1: Int, p2:  Int) {
//        print("balance")
//    }
    func test() {
        self.balance(p1: &health, p2: &energy)
        // 访问类属性的元组里的属性导致读写访问冲突
//        self.balance(p1: &playerInformation.health, p2: &playerInformation.energy)
    }
}
var myDemo = Demo()
myDemo.test()

//容器协议
protocol Contaniner {
    //约束泛型 Item 为 Int 类型
    associatedtype Item where Item == Int
    func append(_ item:Item)
    var count: Int {get}
    subscript(i: Int) -> Item {get}
}

class MyIntArray: Contaniner {
    var innerArray = [Int]()
    func append(_ item: Item) {
        self.innerArray.append(item)
    }
    var count: Int {
        get {
            return self.innerArray.count
        }
    }
    subscript(i: Int) -> Int {
        print("MyIntArray--subscript")
        return self.innerArray[i]
    }
}

var myIntArr = MyIntArray()
myIntArr.append(1)
myIntArr.count
myIntArr[0]


var multiLineString = """
aaa
bbb
ccc
ddd
"""
print(multiLineString)


protocol Sub {
    associatedtype T
    func getIndex() -> T
}

class SubIndex:Sub {
    var index: Int
    func getIndex() -> Int {
        return self.index
    }
    init(_ index: Int) {
        self.index = index
    }
}

class SubTwoIndex:Sub {
    var tag:String
    
    func getIndex() -> String {
        self.tag
    }
    init(tag:String) {
        self.tag = tag
    }
}

class MySubArray {
    var array = Array<Int>()
    func push(item: Int)  {
        self.array.append(item)
    }
    
    subscript<T:Sub>(i:T) -> Int where T.T == Int {
        return self.array[i.getIndex()]
    }
}

class MyTwoSubArray {
    var array = Array<String>()
    func push(item:String) {
        self.array.append(item)
    }
    subscript<T:Sub>(i:T) -> Bool where T.T == String {
        return self.array.contains(i.getIndex())
    }
    
    func tagIndex(param:(any Sub)) -> Int {
        let indexes = self.array.enumerated().compactMap { index, elem -> Int? in
            guard elem == param.getIndex() as! String else { return nil }
          return index
        }
        return indexes.first ?? 0
    }
}

var a = MySubArray()
a.push(item: 10)
print(a[SubIndex(0)])

var b = MyTwoSubArray()
b.push(item: "aaa")
let b_b = b[SubTwoIndex(tag: "aaa")]
b.tagIndex(param: SubTwoIndex(tag: "aaa"))



protocol Tag {
    associatedtype T
    func getTag() -> T
}

class TagClass:Tag {
    var tag:Int
    func getTag() -> Int {
        return self.tag
    }
    init(tag:Int) {
        self.tag = tag
    }
}

class TagArray {
    var array = Array<Int>()
    func add(param:Int) {
        self.array.append(param)
    }
    subscript<T:Tag>(i:T) -> Int where T.T == Int {
        return self.array[i.getTag()]
    }
}

var tagArr = TagArray()
tagArr.add(param: 10)
tagArr.add(param: 20)
tagArr[TagClass(tag: 1)]

protocol People {
    
    var name: String { get set }

    var age:Int { get set }
}

protocol Teach {
        
    func teachSwift()
}

// 使用 & 符号拼接过个协议, 跟贴切面像协议
class Teacher: People&Teach {
    var name: String = "老师"
    var age: Int = 18
    func teachSwift() {
        print("教Swift")
    }
}
var teach_1 = Teacher()
teach_1.teachSwift()



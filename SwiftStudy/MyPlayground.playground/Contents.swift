import UIKit

// command + Shift + enter 快速运行playground

// 问候
var greeting = "Hello, playground"

let str = "Hi"
// 字符串直接相加
var str1 = str + "hzw"
// 可以使用中文命名
let 韩志伟 = "hzw"

print(str, str1, 韩志伟)

var a1 = MemoryLayout<UInt>.size
var a2 = MemoryLayout<Int16>.size
var a3 = MemoryLayout<Int32>.size
var a4 = MemoryLayout<Int64>.size
var a5 = 2e3 // 2X(10^3)
var a6 = 0x1p3 // 在十六进制中 p 表示 2的n次方  1X(2^3) = 8

var a7 = Float(10)
print(a1,"\n",a2,"\n",a3,"\n",a4, Int32.max,"\n", a5,"\n", a6, "\n",a7)

// 元组 (定义元组)
let pen:(name:String, price:Int) = ("钢笔", 10)

// 通过元组内定义的变量名称
print(pen, pen.name, pen.price)
// 通过下标获取值
print(pen.0, pen.1)

//将元组赋值给其他值
var (__name, __price) = pen;
print(__name, __price)

var (__nameOne, _) = pen;

print(__nameOne)

//可选值类型   Optional类型  是对普通类型的包装
// 类型之后 + ?  包装为可选类型

//声明obj为String?类型
var obj:String? = "H5"
if obj == nil {
    print("objc 为 空")
} else {
    print(obj!)
}

obj = nil
if obj != nil {
    print(obj!)
}

//进行 if - let 绑定
if let tmp = obj {
    print(tmp)
} else {
    obj = "Hs"
    print(obj!)
}


// if -let 多个Optional 值绑定
var obj1:Int? = 1;
var obj2:Int? = 2;
//obj2 = nil
// 多个optioal值绑定时, 只有所有的optional值都不为nil, 绑定才成功
if let temp1 = obj1, let temp2 = obj2 {
    print(temp1, temp2)
}

// if -let 多个表达式
if let temp1 = obj1, let temp2 = obj2, temp1 < temp2 {
    print(temp1, temp2)
}


// 为类型取别名
// 为Int类型取一个Price
typealias Price = Int
// 使用Price代替Int 效果完全一样
var penPrice:Price = 100
print(penPrice)

var b1:Int = 1
var b2:Int = 2
var b3 = b1
b1 = b2
b2 = b1
print(b1,b2,b3)

var product:Int? = 100
product = 10
if let temp = product, temp > 30 {
    print("合格", temp)
} else {
    print("不合格", product ?? 0)
}

//  怎么理解 "?"   "!"
/*
 ---首先分类型和实例两个方面理解
 "?"
 1: 类型后 表示Optional类型
 2: 实例后 表示可选链调用
 "!"
 1: 类型后 表示默认隐式解析
 2: 实例后 出现在实例后表示强制解包
 ---其次 两个符号都和Swift的Optional类型相关, Optional类型是Swift强调安全性的一种方式,某个变量可不可以为空,应该是逻辑上决定的,而不是不可预知,不可控制的
 ---if-let结构与Optional类型值的结合使用可以编写出优雅安全的逻辑代码
 
 */
 

//Swift语言是否只有 var 和 let两种数据类型?
/*
 错:
 1: var和let 并不是数据类型,只是声明变量的两种方式
 2: Swift是一种强数据类型,变量在声明时数据类型就已经确定,有时候我们没有显示指定是由于Xcode有自动类型推断功能
 3: Swift的数据类型有 基本数据类型 和 引用数据类型,
 基本数据类型 包含: 整形, 浮点型, 布尔型, 元组,  ==> 值类型(结构体)
 引用类型  Class, 引用类型的数组,字典
 */


// 字符串类型

// 直接赋值
var greet = "Hello, playground"
// 赋值为空字符串
greet = ""
//通过构造方法类进行str变量构造
greet = String()
greet = String("Hi")
greet = String(666)
greet = String(66.6)
greet = String(false)
greet = String(describing: pen)
// 通过类型定义字符串
greet = String(describing: Double.self)
greet = String(format: "我是%@", "hzw")

// 使用 \() 进行字符串插值
greet = "插值 \(greet)"
greet = "插值 \("666")"

//创建字符
var b5:Character = "h"
//创建字符数组
var b6:[Character] = ["H", "Z", "W"];
var b7 = String(b6)
print(b5, b6, b7)

let name:String = "China"

// 遍历字符
for character in name {
    print(character)
}

// 可以使用 \u{} 来通过unicode码来创建字符,将unicode码填入大括号中即可,实例如下
var b_unicode = "\u{21}"
var b_unicode_1 = "\u{66}"
print(b_unicode, b_unicode_1)

// 字符串比大小
var c1:String = "abcd"
var c2:String = "ebc"

// 字符串比大小, 是从第一个字符开始比较, 一样的话比较第二个, 直到有结果, 和字符串长度无关
if c1 >= c2 {
    print("c1大于或等于c2")
} else {
    print("c1小于c2")
   
}
var c4 = "abc"

print(c4[c4.startIndex],
      c4[c4.index(c4.startIndex, offsetBy: 1)],
      c4[c4.index(c4.startIndex, offsetBy: 0)],
      c4[c4.index(before: c4.endIndex)])

c4.insert("!", at: c4.endIndex)

if c4.count > 3
{
    print("c4长度为", c4.count);
}


// 集合类型 Array, Dictionary  Set

var array1:[Int]
var array2:Array<Int>
var array3 = [1,2,3]
var array4 = Array(arrayLiteral: 1,2,3)

//创建5个字符串都为"hzw"的数组
var array5 = [String](repeating: "hzw", count: 5)
//创建5个Int类型元素的数组,且每个元素都为1
var array6 = Array(repeating: 1, count: 5)
// 数组 相加  "+", 相加的数据类型必须相同
var arrayAdd = array4 + array6;
print(arrayAdd)

var baseArray = Array(arrayLiteral: 1,2,3,4,5,6,7,8,9)
print(baseArray.count)
//判空
if !baseArray.isEmpty {
    print("baseArray非空")
}
//通过下标获取值
print(baseArray[0], baseArray.first ?? 0, baseArray.last ?? 100)
// 通过下标修改值
baseArray[0] = 10
print(baseArray[0]);
//修改数组中间范围元素
baseArray[0...3] = [4,4,4,4];
print(baseArray);
//数组追加元素
baseArray.append(10)
print(baseArray);
//向数组中追加一组元素
baseArray.append(contentsOf: [11,12,13])
print(baseArray)
//数组某个位置插入
baseArray.insert(0, at: 0)
baseArray.insert(contentsOf: [-1, -2], at: baseArray.count-1)
print(baseArray)
//移除数组最后的元素
baseArray.removeLast()
// 移除数组后几位
baseArray.removeLast(2)
baseArray.removeFirst()
print(baseArray)
//移除数组第几位
baseArray.remove(at: 3)
print(baseArray)
//baseArray = [1,2,3,4]
////移除下标数组 (下标存在移除,不存在也不会crash)
//baseArray.remove(atOffsets: [2, 5])
print(baseArray)
// 数组移除区间
baseArray.removeSubrange(0...2)
print(baseArray)
baseArray.replaceSubrange(0...1, with: [8, 8, 6])
print(baseArray)
// 判断包含
if baseArray.contains(8) {
    print("包含: 8")
}
// 降序
baseArray = baseArray.sorted(by: >)
print(baseArray)
//升序
baseArray = baseArray.sorted(by: <)
print(baseArray)

// 获取最大,最小值
print(baseArray.max() ?? 100, baseArray.min() ?? 0)
        


// set集合类型
var mySet:Set<Int> = [1,2,3]
print(mySet)
mySet = Set(arrayLiteral: 2,1,3,4)
print(mySet)
mySet.insert(6)
print(mySet)

mySet[mySet.startIndex]
print(mySet)
mySet[mySet.index(after: mySet.startIndex)]
print(mySet)
// 获取某个位置后几个位置的数据
mySet[mySet.index(mySet.startIndex, offsetBy: 2)]
print(mySet)
//print(mySet[mySet.startIndex],
//      ,
//      mySet[mySet.endIndex],
//      mySet[mySet.index(mySet.startIndex, offsetBy: 2)])


/*
 一:
 分别创建字符串变量China和MyLove，将这两个变量拼接成为一句话并且对拼接后的新字符串变量进行遍历，并检查其中是否有L字符，有则进行打印操作。
 */

var myStr1:String = "China"
var myStr2:String = "MyLove"

var myStr3 = myStr1 + myStr2

for character in myStr3 {
    if character == "L" {
        print("myStr3 包含 字符" , character)
    }
}

if myStr3.contains("L") {
    print("myStr3 包含 字符 L")
}


/*
 二: 删除下面字符串中的所有“!”和“?”符号。
 */
var myStr4 = "swsvr!vrfe?123321!!你好!世界​?"
// 1: 替换
//myStr4.replace("!", with: "")
//myStr4.replace("?", with: "")
//print(myStr4)

// 2: 遍历
var myStr5 = String()
for character in myStr4 {
    if character != "!" && character != "?" {
        myStr5.append(character)
    }
}
print(myStr5)


/*
 三: 将字符串abcdefg进行倒序排列，并打印。
 */

var myStr6:String = "abcdefg"
print(myStr6)
var myStr7:[Character] = []
for character in myStr6 {
    myStr7.append(character)
}
// 数组倒序, 直接将数组倒序
//myStr7.reverse()

//----------------------------
let ret = myStr7.reversed()
myStr7 = Array(ret)
print(Array(ret))
//----------------------------

// 字符数组转化为字符串
var myStr8 = String(myStr7)
print(myStr8)

var myStr9:String = "abcdefg"
var myStr10 = String()
var index10 = myStr9.endIndex
print(index10)
while index10 > myStr9.startIndex {
    index10 = myStr9.index(before: index10)
    myStr10.append(myStr9[index10])
}
print(myStr10)

/*
 将“*”符号逐个插入下面字符串的字符中间，并打印
 "我爱你中国"
 
 "我爱*你中国"
 "我*爱*你*中*国"
 */

var myStr11 = "我爱你中国"
let count = myStr11.count;
let midIndex:Int = count/2
// 找到插入位置
let start = myStr11.index(myStr11.startIndex, offsetBy: midIndex)
//let end = myStr11.index(myStr11.startIndex, offsetBy: 3)
// 插入位置插入 "*"字符
myStr11.insert("*", at: start);
print(myStr11)

var myStr12 = "我爱你中国"
var myStr13 = String()
for character in myStr12 {
    myStr13.append(character)
    myStr13.append("*")
}
myStr13.removeLast()
print(myStr13)

var myStr14 = String()
for index in myStr12.indices {
    myStr14.append(myStr12[index])
    if index<myStr12.index(before: myStr12.endIndex) {
        myStr14.append("*")
    }
}
print(myStr14)

/*
 将下面字符串中所有的abc替换成Hello，并打印。
 
 "abc中国abc美国abc英国abc法国abc德国abc"
 */

var myStr15 = "abc中国bc美国ab英国ac法国abc德国abc"
myStr15.replace("abc", with: "Hello")
print(myStr15)

/*
 进行正负号翻转, 并打印
 将 -123 转换为 +123
 将 +456 转换为 -456
 */

var myStr16 = "+123"


if myStr16.hasPrefix("-") {
    myStr16.replace("-", with: "+")
} else if myStr16.hasPrefix("+") {
    myStr16.replace("+", with: "-")
} else {
    // 判断省略  "+" 的正值
    myStr16.insert(contentsOf: "-", at: myStr16.startIndex)
}
print(myStr16)

/*
 将下列数组中的0去掉,返回新的数组,并打印
 [1,13,45,5,0,0,16,6,0,25,4,17,6,7,0,15]
 */

var arr1:[Int] = [1,13,45,5,0,0,16,6,0,25,4,17,6,7,0,15]
var arrNew:[Int] = Array()
for value in arr1 {
//    if value != 0 {
//        arrNew.append(value)
//    }
    if value == 0 {
        continue
    }
    arrNew.append(value)
}
print(arrNew)

/*
 定义一个包含10个元素的数组，对其进行赋值，使每个元素的值等于其下标，然后输出，最后将数组倒置后输出。
 */
var arr2:[String] = Array(repeating: "1", count: 10)
print(arr2)
for index in arr2.indices {
    arr2[index] = String(index)
}
print(arr2)
arr2.reverse();
print(arr2)
let arrStr = arr2.joined()
let arrStr1 = arr2.compactMap { value in
    return Int(value)
}
print(arrStr, arrStr1)


/*
 工程测量到两组数据，分别为2、4、3、5与3、4、7、1。对两组数据进行整合，使其合成一组数据，重复的数据只算一次，使用代码描述此过程。
 */

var set1:Set<Int> = [2,3,4,5]
var set2:Set<Int> = [3,4,7,1]
// 交集
var set3 = set1.intersection(set2)
// 交集的补集
var set4 = set1.symmetricDifference(set2)
//并集
var set5 = set4.union(set3)
//补集
var setTemp = set1.subtracting(set2)
let result = set5.sorted(by: <)
print("result = ",result)

/*
 期末考试中，“王晓”的成绩为98，“邹明”的成绩为86，“李小伟”的成绩为93，用字典结构来对三人的成绩进行存储，并进行从高到低的排序输出。
 */

var dict1 = ["王晓":98, "皱明":86, "李小伟":93]
var dict_arr = Array<Any>()
// 排序,
for item in dict1.sorted(by: { (student1, student2) -> Bool in
    return student1.value > student2.value
}){
    dict_arr.append(item)
    print(item)
}
print(dict_arr)


let redView:UIView = UIView(frame: CGRect(x: 10, y: 10, width: 100, height: 100))
redView.backgroundColor = UIColor.red
let divide = 4%3



//switch - case
var tuple = (1, 2)

switch tuple {
case (0, 0):
    print("-----")
case (let a, 0):
    print(a)
case (let b, 1):
    print(b)
//  case (let a, let b)  和 case let (a, b) 一样
//case (let a, let b):
//    print("let:",a,"----","let: ",b)
case let (a, b):
    print(a,"----",b)
    
}

/*
 switch
 case -- where  可以追加where条件使用
 */
tuple = (2,2)
switch tuple {
    
case let(a, b) where a == b :
    print(a,b)
    
case (let a, let b) where b == 0:
    print(a, b)
    
default:
    print(tuple)
    
}


/*
 Swift 中提到的流程跳转语句主要有
 continue: 语句用于循环结构中, 其作用是跳过本次循环, 直接使用下次循环
 break,: 语句是中断语   配合 方法标签  可以指定跳转到标签语句
 fallthrough,: 是Swift中特有的一种流程控制语句. swich-case 默认是break, 可以在case中添加 fallthrought 关键词, 继续往下执行下一个case,这时候下一个case的条件就无所谓了,肯定执行下一个case
 return, 返回
 throw: 异常抛出, throw语句抛出的异常如果不进行捕获处理,也会使用程序中断.
 guard: guard-else,  满足gurad 条件才继续往下执行,不然直接返回
 */

for index in 0..<5 {
    if index == 1 {
        print("跳过第\(index)次循环--continue")
        continue
    }
    
    if index == 3 {
        print("第\(index)次循环结束--break")
        break
    }
}

/*
 通过continue + 标签 定义跳转到标签指向的循环
 */
MyLabel:for indexA in 0...2 {
    for indexB in 0...2 {
        if indexA == 1 {
            continue MyLabel
        }
        print("第\(indexA)\(indexB)次循环")
    }
}

var mySwitch:[Int] = [1,2,3,4,5]
let switchIndex = arc4random_uniform(UInt32(mySwitch.count))
let switchValue = mySwitch.index(before: Int(switchIndex))
switch switchValue {
    
case 0:
    print("fallthrough---0")
    fallthrough
    
case 1:
    print("fallthrough---1")
    fallthrough
    
case 2:
    print("fallthrough 条件达成 往下执行")
    
default:
    print("---end----")
}

// 带有返回值的函数
func myFunc() -> Int {
    return 0
}
// 没有返回值的函数
func voidMyFunc() {
    return
}


/*
 throw, 定义异常类型 MyError
 */
enum MyError:Error {
    case errorOne
    case errorTwo
}

func newFunc() throws {
    throw MyError.errorOne
}


/*
 guard - else
 */
func myFuncTwo(param:Int) {
    guard param > 0 else {
        print("myFuncTwo 入参param 需大于0")
        return
    }
    print(param)
}

myFuncTwo(param: 0)


/*
 将下列描述翻译成Swift表达式
 
 小李买了5支铅笔、1块橡皮、3本作业本和11个书签。每支铅笔2元，每块橡皮3元，每本作业本2.5元，每个书签0.5元，计算小李花了多少钱。
 */

var sum = (5.0*2.0 + 1.0*3.0 + 3.0*2.5 + 11.0*0.5)
print("小李共花了\(sum)元")

/*
 随机值 1~7
 */
var arcValue = arc4random()%7 + 1
print(arcValue)
arcValue = arc4random_uniform(7) + 1
print(arcValue)


/*
 对语、数、外3门科目进行测试，当3门科目的成绩都大于60且总分不小于200分时，成绩才为合格,
 使用Swift表达式描述上述逻辑
 */

func checkPass(param:(y:Float, s:Float, w:Float)) -> Bool {

    switch param {
        
//    case let(a,b,c) where (( a + b + c ) > 200.0) :
    case let(a,b,c) :
        if (a >= 60.0) &&
            (b >= 60.0) &&
            (c >= 60.0) &&
            (( a + b + c ) > 200.0) {
            print("成绩合格")
            return true
        } else if (( a + b + c ) > 200.0) {
            print("总成绩合格但")
            if a < 60.0 {
                print("a成绩不合格:\(a)")
            } else if b < 60.0 {
                print("b成绩不合格:\(b)")
            } else if c < 60.0 {
                print("c成绩不合格:\(c)")
            }
            return false
        } else {
            print("总成绩不合格")
            return false
        }
    }
}

checkPass(param: (80.0, 55.0, 60.0))


/*
 编写润判断判断的表达式
 闰年: 1: 能够被400整除
      2: 能被4整除但不能被100整除
 */

func checkLeapYear(param:Int) -> Bool {
// switch -case 写法
//    switch param {
//
//    case param where param%400==0:
//        return true
//
//    case param where param%4==0:
//        if param%100 != 0 {
//            return true
//        } else {
//            return false
//        }
//    default:
//        return false
//    }
    
    if param%400==0 || (param%100 != 0 && param%4 == 0) {
        return true
    } else {
        return false
    }

}

var isLeapYear = checkLeapYear(param: 2100)
print("是否是闰年: \(isLeapYear)")

/*
 打印如下图案
 
 * * * * * * * * * *

 * ? ? ? ? ? ? ? ? *

 * ? ? ? ? ? ? ? ? *

 * * * * * * * * * *
 
 */

for x in 1...4 {
    for y in 1...10 {
        if x == 1 || x == 4 {
            // print() 函数 屏蔽print函数的自动换行功能
            print("* ", separator: "", terminator: "")
        } else if y == 1 || y == 10 {
            print("* ", separator: "", terminator: "")
        } else {
            print("? ", separator: "", terminator: "")
        }
    }
    print("\n")

}



//定义一个计算立方的函数

func cube(val : Int) -> Int
{
    return val * val * val
}

/*
 打印所有的"水仙花数"
 是指 一个三位数, 其各位数字的立方和等于该数字本身
 */

for index in 100...999 {
    let dig = index%10
    let ten = index/10%10
    let hunderd = index%100
    
    // 可以使用 pow(dig, 3) 计算dig的几次方
    let result = cube(val: dig) + cube(val: ten) + cube(val: hunderd)
    if result == index {
        print(index)
    }
}

let dig = 5.0
print(pow(dig, 2))

/*
 猴子吃桃问题：猴子第一天摘下若干个桃子，当即吃了一半，还不过瘾，又多吃了一个。第二天早上将剩下的桃子吃掉一半，又多吃了一个。以后每天早上都吃了前一天剩下的一半零一个。到第10天早上想再吃时，就只剩下一个桃子了。求第一天共摘了多少个桃子。
 */
var countNo = 1
for _ in 1...9 {
    countNo = (countNo + 1)*2
}
print(countNo)

/*
 两个乒乓球队进行比赛，每队各出三人。甲队为p1、p2、p3三人，乙队为q1、q2、q3三人。抽签决定了比赛名单后，有人向队员打听比赛的名单。p1说他不和q1比，p3说他不和q1、q3比，请编写程序列出三对赛手的名单。
 */

var teamOne = (0,1,2)
var teamTwo = (2,0,1)

var resultArr:[Int] = Array()
var resultDict:[Int: Int] = Dictionary()

var tempSet:Set = [1,2,3]
var tempSet1 = tempSet.subtracting([1]) // [2, 3]
var tempSet3 = tempSet.subtracting([1, 3]) //[2]
tempSet1 = tempSet1.subtracting(tempSet3) // [3]
var tempSet2 = (tempSet.subtracting(tempSet1)).subtracting(tempSet3)

for x in 1...3 {
    switch x {
    case 1:
        resultDict[1] = tempSet1.first
    case 2:
        resultDict[2] = tempSet2.first
        
    case 3:
        resultDict[3] = tempSet3.first
        
    default:
        print("default")
    }
}

print(resultDict)

/*
 求1+2!+3!+...+20!的和。
 */

// --------------------方法一----------------------
/*
 计算一个数的阶乘
 */
func calculateFactorialFunc(param:Int) -> Int {
    // 计算阶乘, 默认值为1
    var result = 1
    guard param > 0 else {
        return 0
    }
    
    for index in 1...param {
        result *= index
    }
    return result
}

/*
 结算阶乘和
 */
func factorialSumFunc(param: Int) -> Int {
    var result = 0
    for index in 1...param {
        result += calculateFactorialFunc(param: index)
    }
    return result
}
// 结算阶乘和
let sumReuslt = factorialSumFunc(param: 20)
print(sumReuslt)


// --------------------方法二----------------------
var sumC = 0
for index in 1...20 {
    var temp = 1
    var tempIndex = index
    while tempIndex > 0 {
        temp *= tempIndex
        tempIndex -= 1
    }
    sumC += temp
}
print(sumC)


/*
 打印倒金字塔：
 */

//var tempEndIndex = 10
//for indexX in 1...7 {
//    var tempImdex = indexX
//    if tempImdex > 1 {
//        for _ in 1...(tempImdex-1) {
//            print("  ", separator: "", terminator: "")
//        }
//    }
//    guard tempEndIndex >= 1 else {
//        break
//    }
//    for indexY in 1...tempEndIndex {
//        print("* ", separator: "", terminator: "")
//    }
//    tempEndIndex -= 2
//    print("\n")
//}

/*
 绘制倒金字塔
 */
//func drawPciture(param:(a: Int, b: Int)) {
//    var tempEndIndex = param.b
//    for indexX in 1...param.a {
//        var tempImdex = indexX
//        if tempImdex > 1 {
//            for _ in 1...(tempImdex-1) {
//                print("  ", separator: "", terminator: "")
//            }
//        }
//        guard tempEndIndex >= 1 else {
//            break
//        }
//        for _ in 1...tempEndIndex {
//            print("* ", separator: "", terminator: "")
//        }
//        tempEndIndex -= 2
//        print("\n")
//    }
//}

func drawPciture(param:(a: Int, b: Int)) {
    for indexX in 1...param.a {
        for indexY in 1...param.b {
            if indexY < indexX {
                print("  ", separator: "", terminator: "")
            } else if indexY + indexX-1 <= param.b {
                print("* ", separator: "", terminator: "")
            }
        }
        print("\n")
    }
}

drawPciture(param: (a: 4, b: 7))

/*
 Swift 中的流程控制结构有哪些,分别适用于什么场景
 
 顺序结构
 分支结构
 循环结构
 跳转
 中断
 */

/*
 运算符
 1: 使用空合并运算符来对Optional值进行快捷条件运算  ??
 2: 区间运算符也是很有特点的运算符, 使用它可以方便地创建区间与范围,在集合遍历,字符串和数组的截取中都十分有用
 */



/*
 返回值为可选类型
 */
func myFuncFour(param:Int) -> Int? {
    guard param > 100 else {
        return nil
    }
    return param - 100
}

let valueFour__ = myFuncFour(param: 60)
print(valueFour__ ?? 0)
if let temp = myFuncFour(param: 101) {
    print(temp)
}

func myFunc5(param1: Int, param2: Int) {
    print(param1, param2)
}

myFunc5(param1: 10, param2: 10)

func myFunc6(out1 p1: Int, out2 p2: Int) {
    print(p1, p2)
}

myFunc6(out1: 10, out2: 10)

/*
 省略外部名称的函数参数列表
 */
func myFunc7(_ p1:Int, _ p2:Int) {
    print(p1, p2)
}
myFunc7(6, 6)

/*
 设置函数参数默认值
 */
func myFunc8(p0:Int, p1:Int = 8, p2:Int = 8) {
    print(p1,p2)
}
myFunc8(p0: 8)
myFunc8(p0: 10, p1: 10, p2: 10)

/*
 不定参数数量
 */

func myFunc9(param:Int...) {
    print(param.count)
    print(param)
}
myFunc9(param: 10,10,10,10)

/*
 函数内部修改参数变量值, 参数声明为 inout类型
 inout 类型
 */
func myFunc10(param: inout Int) {
    param += 1
}
var testInoutValue = 10
myFunc10(param: &testInoutValue)
print(testInoutValue)


// 声明一个函数变量
var addFunc:(Int, Int) -> Int
// 对函数变量进行赋值
addFunc = {(param1: Int, param2: Int) in  return param1 + param2}
// 调用函数
let addResult = addFunc(2,3);
print(addResult)


var addFunc2:(Int, Int) -> Int
func myFunc11(p1:Int, p2:Int) -> Int {
    return p1 + p2
}
// 使用函数赋值 函数变量
addFunc2 = myFunc11(p1:p2:)
let addResult2 = addFunc2(10, 10);
print(addResult2)

// 函数作为另外一个函数的参数
func myFunc12(p1: (Int, Int) -> Int, p2: Int) -> Int {
    return p1(10, 10) + p2
}
var myFunc12Value = myFunc12(p1: addFunc2, p2: 10)
print(myFunc12Value)

var addFunc3:(Int, Int) -> Int
addFunc3 = {(p1:Int, p2:Int) in return p1 - p2}
myFunc12Value = myFunc12(p1: addFunc3, p2: 10)
print(myFunc12Value)

/*
 函数作为返回值使用
 */
//声明一个函数变量
var addFunc4:(Int, Int) -> Int
func myFunc15() -> (Int, Int) -> Int {
    return {(p1: Int, p2: Int) in return p1 + p2}
}
// 将函数返回 的 函数 赋值给 函数变量
addFunc4 = myFunc15()
let myFunc15Value = addFunc4(10, 10)
print(myFunc15Value)

func myFunc16() -> (Int, Int) -> Int {
    func subFunc(p1:Int, p2:Int) -> Int {
        return p1 + p2
    }
    return subFunc(p1:p2:)
}

// 将函数返回 的 函数 赋值给 函数变量
addFunc4 = myFunc16()
let myFunc16Value = addFunc4(20, 20)
print(myFunc16Value)


/*
 闭包结构: {(参数列表) 返回 in 闭包体}
 */

func myFunc20(param: Int) -> Int {
    return param*param
}

var myClosures1:(Int, Int) -> Int
var myClosures2 = {(param1:Int, param2:Int)->Int in
    return param1*param2
}

myFunc20(param: 3)

//myClosures1 = myClosures2
myClosures2(3, 2);

//闭包可以省略 返回值,  如果闭包体内有返回值, 则闭包自动将return的数据类型作为返回值类型
myClosures2 = {(p1:Int, p2:Int) in return p1*p2}
myClosures2(2, 2);


func mySortFunc(array:inout Array<Any>, sortClosure:(Int, Int, Array<Any>) -> Bool) -> Array<Any> {
    print(array)
    for x in array.indices {
        //最后一个元素直接返回
        if x == array.count - 1 {
            break
        }
        
        for y in 0...(array.count - 1 - x - 1) {
            //调用传递进来的闭包算法
            if sortClosure(y, y+1, array) {
                
            } else {
                //进行元素交换
                array.swapAt(y, y+1)
            }
        }
    }
    print("mySortFunc: \(array)")
    return array
}

var sortArrOne:Array<Any> = [1,4,3,5,7,5,4,2,7]
mySortFunc(array: &sortArrOne, sortClosure:{(index:Int, next:Int, temArr:Array<Any>) -> Bool in
    return (temArr[index] as! Int) > (temArr[next] as! Int)
})
print("------\(sortArrOne)----")


class Student {
    let achievement:Int
    let name:String
    init(name:String, achievement:Int) {
        self.achievement = achievement
        self.name = name
    }
}

let stu1 = Student(name: "小王", achievement: 89)
let stu2 = Student(name: "小李", achievement: 70)
let stu3 = Student(name: "小名", achievement: 90)
let stu4 = Student(name: "小孙", achievement: 30)

var stuArr:Array<Any> = [stu1, stu2, stu3, stu4]
let sorAfterArr = mySortFunc(array: &stuArr, sortClosure: {(index: Int, next:Int, sortArr:Array<Any>) -> Bool in
//    let stu1:Student = sortArr[index] as! Student
    return (sortArr[index] as! Student).achievement > (sortArr[next] as! Student).achievement
})
print(sorAfterArr)


/*
 冒泡排序
 */
func mySortNewFunc(array: Array<Any>) -> Array<Any> {
    var list = array;
    var count = 1;
    for i in 0..<list.count {
        var flag = true
        count = i;
        for j in 0..<(list.count - 1 - i) {
            
            if (list[j] as! Int) > (list[j+1] as! Int) {
                list.swapAt(j, j+1)
                flag = false
            }
        }
        if flag {
            break
        }
    }
    print("循环次数: \(count)--array: \(list)")
//    array = list
    return list
}

var sortArr:Array<Any> = [1,4,3,5,7,5,4,2,7]
let sortResut1 = mySortNewFunc(array: sortArr)
print("sortArr: \(sortArr)\nsortResut1: \(sortResut1)")

/*
 省略返回值的写法
 */
class Student1 {
    let achievement:Int
    let name:String
    init(name:String, achievement:Int) {
        self.achievement = achievement
        self.name = name
    }
}
let stu5 = Student1(name: "小王", achievement: 89)
let stu6 = Student1(name: "小李", achievement: 70)
let stu7 = Student1(name: "小名", achievement: 90)
let stu8 = Student1(name: "小孙", achievement: 30)
var stuArr2:Array<Any> = [stu5, stu6, stu7, stu8]
// 省略闭包返回值写法
//mySortFunc(array: &stuArr2, sortClosure: {(index:Int, next:Int, tempArr001:Array<Any>) in
//    return (tempArr001[index] as! Student1).achievement > (tempArr001[next] as! Student1).achievement
//})

// 返回值只有一行代码是 省略 return关键字
//mySortFunc(array: &stuArr2, sortClosure: {(index: Int, next: Int, tempArr002:Array<Any>) in
//    (tempArr002[index] as! Student1).achievement > (tempArr002[next] as! Student1).achievement
//})

// 省略参数名称的写, 闭包参数列表会自动创建一组参数,参数名会以$0,$1,$2 这样的结构依次类推.
//mySortFunc(array: &stuArr2, sortClosure: {
//    ($2[$0] as! Student1).achievement > ($2[$1] as! Student1).achievement
//})

print(stuArr2)

/*
 后置闭包: 函数的最后一个参数为闭包时,调用函数时可以将闭包结构脱离出函数的参数列表,追加在函数的尾部,增强代码的可读性
 
 逃逸闭包
 
 自动闭包
 */

/*
 后置闭包写法
 */
//mySortFunc(array: &stuArr2) {
//    ($2[$0] as! Student1).achievement > ($2[$1] as! Student1).achievement
//}


func mySortFunc3(closure: (Int, Int) -> Bool) -> Bool {
   return closure(10, 20)
}

let status1 = mySortFunc3 {
    $0 > $1
}
print(status1)

/*
 将闭包声明为非逃逸类型需要使用
 @noescape 关键字修饰
 */

/*
 @autoclosure : 自动闭包, 1: 不能有参数 2: 调用时只能由一句表达式组成,闭包的返回值即为此表达式的值
 */
// 将闭包参数声明为自动闭包
func myFunc18(closure: @autoclosure () -> Bool) -> Bool{
    return closure()
}

// 调用函数时, 直接传入一个表达式, 编译器会自动生成闭包参数
let myFunc18Value = myFunc18(closure: 1+2>2)
print(myFunc18Value)

//自动闭包默认为非逃逸闭包,
//若要是用逃逸闭包类型的闭包参数, 需要如下声明
func myFunc101(closure: @autoclosure @escaping () -> Bool) -> Bool {
    return closure()
}

let myFunc101Value = myFunc101(closure: 1+2>3)
print(myFunc101Value)



/*
 编写一个计算阶乘的函数
 */
func mySumFunc(param: Int) -> Int {
    // 正数阶乘 判断大于0
    guard param > 0 else {
        return 0
    }
    
    var a = param
    var result = 1
    while a > 0 {
        result *= a
        a -= 1
        print("a : \(a)")
    }
    return result
}

let sunmValue001 = mySumFunc(param: 5)
print(sunmValue001)

/*
 编写函数，其功能是：判断输入的字符是否为数字字符。如果是，则输出true，否则输出false。
 */
func isNumberFunc(param:Character) -> Bool {

//    if param <= "9" && param >= "0" {
//        return true
//    } else {
//        return false
//    }
    return param >= "0" && param <= "9"
}

let isNo = isNumberFunc(param: "8")
print(isNo)


/*
 编写函数，其功能是：将两个两位数的正整数a、b合并成一个整数c，合并规则是将a的十位和个位分别放在c的千位和个位，将b的十位和个位分别放在c的百位和十位。
 */
func myTransformFunc(p1: Int, p2: Int) -> Int {
    guard p1 > 0 && p2 > 0 else {
        return 0
    }
    var resultValue = 0
    let dig = p1%10
    let ten = p2%10
    let best = p2/10%10
    let thousand = p1/10%10
    
//    resultValue = dig + ten*10 + best*100 + thousand*1000
    resultValue = dig + ten*(Int(1e1)) + best*(Int(1e2)) + thousand*(Int(1e3))

    return resultValue
}
let transformValue = myTransformFunc(p1: 56, p2: 23)
print(transformValue)


/*
 编写函数，将字符串中的大写字母变成对应的小写字母，将小写字母变成对应的大写字母，其他字符不变。
 */
func myTransformStrFunc(param: String) -> String {
    
    var str = ""
    guard param.count > 0 else {
        print("--传入的字符串长度不够--")
        return ""
    }
    
    for char in param {
        if char >= "a" && char <= "z" {
            str.append(String(char).uppercased())
        } else if char >= "A" && char <= "Z" {
            str.append(String(char).lowercased())
        } else {
            str.append(char)
        }
    }
    return str
}
let transformStrValue =  myTransformStrFunc(param: "")
print(transformStrValue)

/*
 编写函数，输入一个大于0的数字，将不大于这个数字的所有正奇数的和与正偶数的和以元组的形式返回。
 */
func myCalculateFunc102(param: Int) -> (Int, Int) {
    guard param > 0 else {
        return (0, 0)
    }
    var value1 = 0 //计算奇数和
    var value2 = 0 //计算偶数和
    for index in 1...param {
        if index%2 == 0 {
            value2 += index
            print("偶数: \(index)")
        } else {
            value1 += index
            print("奇数: \(index)")
        }
    }
    return (value1, value2)
}
let calculateFunc102Value = myCalculateFunc102(param: 5)
print(calculateFunc102Value)


/*
 编写函数，输入不定个数的一组整数值，统计其中正数和负数的个数，0不纳入统计。
 */

func  myFunc103(param:Int...) -> (Int, Int) {
    var value1 = 0
    var value2 = 0
//    for value in param.indices {
//        let tempValue = param[value]
//        print("value: \(value)--tempValue: \(tempValue)")
//        if tempValue > 0 {
//            value1 += 1
//        } else if tempValue < 0 {
//            value2 += 1
//        }
//    }
    for value in param {
        print("value: \(value)")
        if value > 0 {
            value1 += 1
        } else if value < 0 {
            value2 += 1
        }
    }
    return (value1, value2)
}

let myFunc103Value = myFunc103(param: 10,0,0,-11,10,-22)
print(myFunc103Value)


/*
 编写函数，输入圆的半径，返回圆的周长和面积。
 */

func myFunc104(param:Double) -> (Double, Double) {
    //周长
    var l = Double.pi * 2 * param
    //面积
    var s = Double.pi * pow(param, 2)
    return (l,s)
    
}
let myFunc104Value = myFunc104(param: 1)
print(myFunc104Value)

func myFunc105(param:Int...) -> (Int, Int) {
    /*
     -------------------方案一---------------------------------
     */
    guard  param.count > 0 else {
        return (0, 0)
    }
    
    var maxValue = Int.min
    var minValue = Int.max
//    print(maxValue,"---", minValue)
    for index in param {
        if index > maxValue {
            maxValue = index
        }
        
        if index < minValue {
            minValue = index
        }
    }
    return (maxValue, minValue)
    
    /*
     -------------------方案二---------------------------------
     */
//    var tempArr = param
//    let max = tempArr.max()
//    let min = tempArr.min()
//    return (max ?? 0, min ?? 0)
}

let myFunc105Value = myFunc105(param: 10,10)
print(myFunc105Value)


/*
 使用闭包的风格模拟Dictionary数据的遍历 中断操作
 */
//创建一个字典示例
let myDict10:Dictionary = [1:"2", 2:"2", 3:"3", 4:"4", 5:"5"]
//创建一个函数,通过闭包传递遍历结果
func myFunc106(dict:Dictionary<Int, String>, closure:(_ key:Int, _ value:String) -> Bool) {
    //遍历字典
    for item in dict {
        //执行闭包代码
        if closure(item.0, item.1) {
            return
        }
    }
}


myFunc106(dict: myDict10, closure: {(key:Int, value: String) in
    if key == 2 {
        print("\(key)---\(value)")
        return true
    }
    print("\(key)---\(value)")
    return false
})














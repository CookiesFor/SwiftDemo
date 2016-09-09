//
//  ViewController.swift
//  SwiftDemo
//
//  Created by SIMPLE PLAN on 16/4/1.
//  Copyright © 2016年 SIMPLE PLAN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        self.view.backgroundColor =  .redColor()
//        
//        let possibleNumber = "123"
//        
//        var my: Int = Int(possibleNumber)!
//        print(my)
//        
//        
//        for _ in my...134 {
//            
//            my += my
//            print(my)
//            
//        }
//        
//        
//        print()
//        
//        
//        
//        
//        
//        //let声明常量，var声明变量
//        
//        let catCharacters:[Character] = ["C","a","t","!","?"]
//        
//        let catString = String(catCharacters)
//        
//        print(catString)
//        
//        var welcome: String
//        
//        
//        let string1 = "hello"
//        let string2 = "there"
//        welcome = string1 + string2
//        
//        
//        print(welcome)
//        
//        //冒号后面表示类型
//        var welcomeMessage: String
//        welcomeMessage = "hello"
//        
//        print(welcomeMessage)
//        
//        let meaningOfLife = 42
//         print(meaningOfLife)
//        
//        let hexadecimallInteger = 0x11
//        print(hexadecimallInteger)
//        
//        let octallInteger = 0o21
//        print(octallInteger)
//        
//        let a: Double
//        a = 0.23
//        print(a)
//        
//        
//        let i = 1
//    
//        if i==1 {
//            print("1234")
//        }
//        
//        let tooBig: Int8 = Int8.min + 1
//        print(tooBig)
//        
//        
//        
//        let three = 3
//        let four = 0.12134
//        let pi = Double(three) + four
//        print(pi)
//        
//        
//       let textButton = UIButton(frame:CGRectMake(30, 40, 50,50))
//        
//        textButton.backgroundColor = UIColor .blueColor()
//        textButton.titleLabel?.text = welcomeMessage
//        
//        self.view .addSubview(textButton)
//        
//        textButton.addTarget(self, action: #selector(ViewController.buttonClick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
//        
//        
//        let textView = UIView(frame:CGRectMake(100,100,100,100))
//        textView.backgroundColor = UIColor .grayColor()
//        textView.addGestureRecognizer(UITapGestureRecognizer(target: self,action: #selector(ViewController.viewTap(_:))))
//        
//        textView.userInteractionEnabled = true;
//        
//        
//        self.view .addSubview(textView)
//        
//        
//        
//        var five = Double(three) + four
//        five = five + 0.234
//        print(five)
//        
//        
//        
//        
//        for character in "Dog!🐕".characters {
//            
//            print(character)
//            
//        }
//        
//        
//        
//        
//        
////        let catCharacters: [Character] = ["C","a","t","!","🐕"]
////        let catString = String(catCharacters)
////        
////        print(catString);
//        
//        
//        var instruction = "look over"
//        let str:String = " is"
//        
//        let message = "\(instruction) \(str) \(five)"
//        
//        print(message)
//        
//        instruction += str
//        
//        instruction += String(five)
//        
//        
//        
//        
//        print(instruction)
//        
//        
//        
//        
//        
//        let emptyString = ""
//        let anotherEmptyString = String()
//        
//        if emptyString.isEmpty {
//            print("123")
//        }
//        
//        if anotherEmptyString.isEmpty {
//            print("abc")
//        }
//        
//        
//        var variableString = "Horse"
//        variableString += " and carriage"
//        
//        print(variableString)
//        
//        
//        let dogString = "Dog!🐶"
//        
//        for codeUnit in dogString.utf8 {
//            
//            print("\(codeUnit)")
//            
//        }
//        
//        
//        var someInts = [Int]()
//        someInts.append(3)
//        print(someInts)
//        print(someInts.count)
//        
//        
//        
//        var fourDoubles = Array(count:3 ,repeatedValue:1.2)
//        
//        var fiveDoubles = Array(count:4 ,repeatedValue:1.3)
//        
//        //通过两个数组相加得到另一个数组
//        var anotherDoubles = fourDoubles + fiveDoubles
//        
//        print(anotherDoubles)
//        
//        print(fourDoubles)
//        
//        
//        
//        //用字面量构造数组
//        //可以使用字面量来进行数组构造，这是一种用一个或者多个数组构造数组的简单方法。字面量是一系列由逗号分割并由方括号包含的数组
//        //类型
//        var shoppingList: [String] = ["Eggs", "Milk", "2.4"]
//        
//        print("字面量构造数组 \(shoppingList)")
//        
//        
//        var arr = [2.4, "Eggs"]
//        print(arr)
//        
//        arr.append(3.3)
//        shoppingList.append("ear")
//        
//        print("append after \(arr)")
//        print("append after \(shoppingList)")
//
//        
//        shoppingList += ["Baking Power"]
//        print("+之后的数据 \(shoppingList)")
//        
//        arr += ["Chesse", "Butter"]
//        print("+之后的数据\(arr)")
//        
//        
//        var firstItem = shoppingList[0]
//        
//        var firstArrItem = arr.endIndex
//        
//        print(arr[arr.endIndex-1])
//        print(arr.last)
//        print(arr.first)
//        
//        //替换2-4下标对应的字符
//        shoppingList[2...4] = ["123", "ert"]
//        print(shoppingList)
//        
//        //集合
//        var letters = Set<Character>()
//        print("letters is of type Set<Character> with \(letters.count) items")
//        
//        //集合插入的都是第一个位置
//        letters.insert("e")
//        letters.insert("t")
//        letters.insert("n")
//        letters.insert("a")
//        letters.insert("b")
//        letters.insert("c")
//        print(letters)
//        
//        //从集合中删除一个
//        if let removeSex = letters.remove("c") {
//            print("\(removeSex)")
//        }else
//        {
//            print("未查找到")
//        }
//        
//        //遍历一个集合
//        for lets in letters {
//            
//            print("\(lets)")
//            
//        }
//        
//        
//        //按照特定顺序遍历,降序
//        for gener in letters.sort() {
//            print("顺序遍历结果：\(gener)")
//        }
//        
//        let oddDigits: Set = [1, 3, 5, 7, 9]
//        let evenDigits: Set = [0, 2, 4, 6, 8]
//        let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
//    
//        //insersect(_:)方法根据两个集合中都包含的值创建的一个新的集合
//        //exclusive(_:)方法根据在一个集合中但不在两个集合中的值创建一个新的集合
//        //union(_:)方法根据两个集合的值创建一个新的集合
//        //subtract(_:)方法根据不在该集合中的值创建一个新的集合
//        
//        
//        print("union \(oddDigits.union(evenDigits).sort())")
//        // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
//        print("intersect \(oddDigits.intersect(evenDigits).sort())")
//        // []
//        print("subtract \(oddDigits.subtract(singleDigitPrimeNumbers).sort())")
//        // [1, 9]
//        print("exclusiveOr \(oddDigits.exclusiveOr(singleDigitPrimeNumbers).sort())")
//        
//        
//        
//    
//        //isSubsetOf(_:)方法来判断一个集合中的值是否也被包含在另一个集合中
//        //isSupersetOF(_:)方法来判断一个集合中包含另一个集合中所有的值
//        //isStrictSubsetOf(_:)或者isStrictSupersetOf(_:)方法来判断一个集合是否是另一个集合的字集合或者父集合并且两个集合并不相等
//        //isDisjointWith(_:)方法来判断两个集合是否不包含有相同的值（是否没有交集）
//        
//        let houseAnimals: Set = ["🐶", "🐔", "🐑"]
//        let farAnimanls: Set = ["🐂", "🐶", "🐑","🐱"]
//        let cityAnimals: Set = ["🐦", "🐭"]
//        
//        print(houseAnimals.isSubsetOf(farAnimanls))
//        
//        print(farAnimanls.isSupersetOf(houseAnimals))
//        
//        print(houseAnimals.isStrictSubsetOf(farAnimanls))
//        
//        print(houseAnimals.isDisjointWith(cityAnimals))
//        
//        
//        
//        /*
//         *字典是一种存储多个相同类型的值的容器，每个值(value)都关联唯一的键(key)，键做为字典中这个值数据的标识符，Swift的字典类型是无序集合类型，为了以特定顺序遍历字典的键或值，可以对字典的key或value属性使用sort()方法
//         *
//         *Swift中的字典使用:Dictionary<Key: Value>
//         */
//        
//        //创建一个空字典,nameOfIntegers 是一个空的[Int: String]字典。key是Int型，value是String型
//        var namesOfIntegers = [Int: String]()
//        namesOfIntegers[1] = "one"
//        print("字典 \(namesOfIntegers)")
//        
//        
//        //使用字典字面量创建字典,每一个键值对的键和值都由冒号分隔，这些键值对构成一个列表，其中这些键值对由方括号包含、由逗号分割[Key1:value1, Key2:value2, Key3:value3]
//        //还可使用bool值来检查是否为空 X.isEmpty
//        
//        var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
//        
//        //可以自动推断类型
//        var airports2 = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
//        
//        print("The Dictionary of airports contains \(airports.count) items")
//        
//        airports["LHK"] = "London Heathrow"
//        
//        print(airports)
//        
//        airports2["LHK"] = "London Hearthrow"
//
//        print(airports2)
//        
//        
//        //updateValue(_:forKey)方法可以设置或者更新特定键对应的值，并且这个方法在这个键不存在对应值的时候会设置新值或者存在时更新已存在的值。updateValue(_:forKey)这个方法返回更新值之前的原值，这样可以使的我们可以检查更新是否成功
//        if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
//            
//            print("the old value for DUB was \(oldValue)")
//            
//        }
//        
//        
//        print(airports)
//        
//        //可以使用下标语法在字典中检索特定键对应的值，也可以使用点语法通过给某个键对应的值赋值为nil从字典中移除这个键值对
//        if let airportname = airports["DUB"] {
//            
//            print("the name of the airport is \(airportname)")
//            
//        }else
//        {
//            print("not")
//        }
//        
//        
//        airports["AS"] = "ASXCVB"
//        print("添加 \(airports)")
//        airports["AS"] = nil
//        print("移除 \(airports)")
//        
//        //使用removeValueForKey(_:)方法也可以用来在字典中移除键值对，这个方法在键值对存在的时候会移除并且返回被移除的值或者在没有值的情况下返回nil
//        airports.removeValueForKey("AS")
//        
//        //字典遍历，使用for循环。通过访问keys或者values属性，也可以遍历字典中的键或者值
//        for (airportCode, airportName) in airports {
//            
//            print("循环遍历中的键值对：\(airportCode), \(airportName)")
//            
//        }
//        
//        
//        
//        
//        
//        for index in 1...5 {
//            
//            print("\(index) times 5 is \(index * 5)")
//            
//        }
//        
//        //使用for-in遍历一个数组所有元素
//        let names = ["Anna", "Alex", "Brian", "Jack"]
//        for name in names {
//            
//            print("Hello, \(name)")
//            
//        }
//        
//        
//        for var index2 = 0; index2<3; ++index2 {
//        
//            print("index2 is \(index2)")
//            
//        }
//        
//        //while循环，每次循环开始时计算条件是否符合
//        //repeat-while循环，每次在循环结束时计算条件是否符合
//        
//        
//        //条件语句 if语句最简单的形式就是只包含一个条件，当切仅当该条件为true时，才执行相关代码
//        var temp = 30
//        if temp<32 {
//            print("It is very code")
//        }
//        
//        //Switch语句会尝试把某个值与若干个模式(pattern)进行匹配.switch由多个case组成
//        //在这个例子中，第一个case分支用于五个元音，第二个case分支用于匹配所有的辅音
//        let someCharacter: Character = "e"
//        switch someCharacter {
//        case "a", "e", "i", "o", "u":
//            print("\(someCharacter) is a vowel")
//        case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
//             "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
//            print("\(someCharacter) is a consonant")
//        default:
//            print("\(someCharacter) is not a vowel or a consonant")
//        }
//        
//        
//        
//        
//        
//        [self .sayHello("qwertyuiop")];
//        
//        [self .sayHelloWorld()];
//        
//        
//        [self .sayHello("1234556", alreadyGreeted: true)];
//        
//        [self .sayGoodbay("goodbye")];
//        
//        [self .minMax([1,2,3,4,5])];
//        
//        
//        
//        
//        let namess = ["Chris","Alex","Ewa","Barry","Daniella"]
//        
//        var reversed  = namess.sort(backwards)
//        
//        print(reversed)
//        
//        
//        var reversed2 = namess.sort({(s1: String,s2: String) -> Bool in return s1 > s2})
//        print(reversed2)
        
        
        
        
        
        
        
    }
    
    func backwards(s1: String, s2: String) -> Bool
    {
        return s1>s2
    }
    

    /*
     * 函数的定义与调用，一个函数的实参必须与函数参数表里参数的顺序一致
     **/
    func sayHello(personName: String) -> String {
        
        let greeting = "Hello, " + personName + "!"
        print(greeting)
        return greeting
        
        
    }
    
    /*
     * 函数参数与返回值   无参函数
     **/
    func sayHelloWorld() -> String {
        print("Hello, world")
        return "Hello, world"
    }
    
    /*
     * 多参数函数
     **/
    func sayHello(personName: String, alreadyGreeted: Bool) -> String {
        
        if alreadyGreeted {
            print("this is \(sayHello(personName))")
            return sayHello(personName)
        }else
        {
            print("this is \(sayHello(personName))")
            return sayHello(personName)
        }
        
    }
    
    /*
     * 无返回值函数
     **/
    func sayGoodbay(personName: String) {
        print("goodbye, \(personName)")
    }
    
    /*
     * 多重返回值函数
     * 可选元组返回类型，元组返回类型反应整个元组可以是nil的事实，可以通过在元组类型的右括号后放置一个问号来定义一个可选元组
     **/
    func minMax(array: [Int]) -> (min: Int, max: Int)? {
        
        if array.isEmpty {
            return nil
        }
        
        
        var currentMin = array[0]
        var currentMax = array[0]
        
        for value in array[1..<array.count] {
            
            if value < currentMin {
                
                currentMin = value
                
            }else if value > currentMax {
                
                currentMax = value
                
            }
            
        }
        print("min is \(currentMin), max is \(currentMax)")
        return (currentMin,currentMax)
        
    }
    
    func getSumOf(numbers :Float) -> Float {
        
        let sum: Float = 0.1
        
        
        return sum
    }
    
    func getAva(num: Float) {
        let sun:Float = self .getSumOf(num)
        
        
    }
    
    
    
    func viewTap(tap:UITapGestureRecognizer)  {
        
        print("手势使用")
        
    }
    
    
    func buttonClick(sender:UIButton) {
        
        print("ertyyu")
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


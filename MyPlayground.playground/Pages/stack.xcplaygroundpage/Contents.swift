import Foundation

var arr = [String]()
arr.append("haha")
arr.append("Hoho")
arr.append("qiuqiu")
print(arr.last!)
arr.popLast()
print(arr)


struct Stack<Elemment>{
    fileprivate var innerArray: [Elemment] = []
    
    mutating func push(_ element:Elemment) {
        innerArray.append(element)
    }
    
    mutating func pop() -> Elemment? {
        return innerArray.popLast()
    }
    
    mutating func peek() -> Elemment? {
        return innerArray.last
    }
    
    var isEmpty: Bool {
        return innerArray.isEmpty
    }
    
    var count: Int {
        return innerArray.count
    }
    
}

extension Stack:CustomStringConvertible {
    var description: String {
        let stackElements = innerArray.map{"\($0)"}.reversed().joined(separator: "\n")
        return "----Stack----\n" + stackElements + "\n-------------\n"
    }
}

var myStack = Stack<String>()
myStack.push("haha")
myStack.push("hehe")
print(myStack)
myStack.pop()
print(myStack)



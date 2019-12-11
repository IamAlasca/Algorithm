import Foundation


public class Node<T> {
    var value: T
    init(_ value: T) {
        self.value = value
    }
    
    var next: Node<T>?
    weak var prev: Node<T>?
}

extension Node: CustomStringConvertible {
    public var description: String {
        return self.value as! String
    }
}

public class LinkedList<T> {
    fileprivate var head: Node<T>?
    fileprivate var tail: Node<T>?
    
    public var isEmpty: Bool {
        return head == nil
    }
    public var first: Node<T>? {
        return head
    }
    public var last: Node<T>? {
        return tail
    }
    
    public func append(_ value:T) {
        let newNode = Node(value)
        if let tailNode = tail {
            tailNode.next = newNode
            newNode.prev = tailNode
        } else {
            head = newNode
        }
        tail = newNode
    }
    
    public func nodeAt(_ index: Int) -> Node<T>? {
        if index >= 0 {
            var loopNode = head
            var a = 0
            while loopNode != nil {
                if index == a { return loopNode }
                a += 1
                loopNode = loopNode?.next
            }
        }
        return nil
    }
    
    public func removeAll() {
        head = nil
        tail = nil
    }
    
    public func removeNode(_ node: Node<T>) -> String {
        let prev = node.prev
        let next = node.next
        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        if let next = next {
            next.prev = prev
        } else {
            tail = prev
        }
        
        node.prev = nil
        node.next = nil
        return node.value as! String
    }
}

extension LinkedList: CustomStringConvertible {
  public var description: String {
    var text = "["
    var node = head
    while node != nil {
      text += "\(node!.value)"
      node = node!.next
      if node != nil { text += ", " }
    }
    return text + "]"
  }
}

var linkList = LinkedList<String>()
linkList.append("haha")
linkList.append("jojo")
if let value = linkList.nodeAt(1) {
    print(value)
}

let deletedNode = Node("haha")

linkList.removeNode(deletedNode)
print(linkList)




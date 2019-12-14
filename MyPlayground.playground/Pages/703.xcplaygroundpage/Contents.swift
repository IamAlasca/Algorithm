/**
703. Kth Largest Element in a Stream

Design a class to find the kth largest element in a stream. Note that it is the kth largest element in the sorted order, not the kth distinct element.

Your KthLargest class will have a constructor which accepts an integer k and an integer array nums, which contains initial elements from the stream. For each call to the method KthLargest.add, return the element representing the kth largest element in the stream.

Example:

int k = 3;
int[] arr = [4,5,8,2];
KthLargest kthLargest = new KthLargest(3, arr);
kthLargest.add(3);   // returns 4
kthLargest.add(5);   // returns 5
kthLargest.add(10);  // returns 5
kthLargest.add(9);   // returns 8
kthLargest.add(4);   // returns 8
Note:
You may assume that nums' length ≥ k-1 and k ≥ 1.
*/

/**
* Your KthLargest object will be instantiated and called as such:
* let obj = KthLargest(k, nums)
* let ret_1: Int = obj.add(val)
*/
//var heap = Heap<Int>(elements:[3,2,6,4,0], priorityFunction: >)
class KthLargest {
    var minHeap : Heap<Int>
    let kthNum: Int
    
    init(_ k: Int, _ nums: [Int]) {
        self.kthNum = k
        self.minHeap = Heap<Int>(elements:[], priorityFunction: <)

        for num in nums {
            add(num)
        }
    }
    
    func add(_ val: Int) -> Int {
//        print("new num \(val)")
//        print(minHeap.elements)
//        print("-----------")
        if minHeap.count < kthNum {
            minHeap.enqueue(val)
            return minHeap.peek()!
        } else {
            if (minHeap.peek()! < val) {
                minHeap.dequeue()
                minHeap.enqueue(val)
                return minHeap.peek()!
            }
            return minHeap.peek()!;
        }
    }
}



/// Using an array to create an min or map heap data structure, and that's why it's important for the heap to be a compact tree.
struct Heap<Element> {
    var elements : [Element]
    let priorityFunction : (Element, Element) -> Bool
    
    init(elements: [Element] = [], priorityFunction: @escaping (Element, Element) -> Bool) {
        self.elements = elements
        self.priorityFunction = priorityFunction
        buildHeap()
    }
    
    mutating func buildHeap() {
        for index in (0 ..< count / 2).reversed()  {
            siftDown(elementAtIndex: index)
        }
    }
    
    // simple functions
    var isEmpty : Bool {
        return elements.isEmpty
    }
    
    var count : Int {
        return elements.count
    }
    
    func peek() -> Element? {
        return elements.first
    }
    
    func isRoot(_ index: Int) -> Bool {
        return index == 0
    }
    
    func leftChildIndex(of index: Int) -> Int {
        return (2 * index) + 1
    }
    
    func rightChildIndex(of index: Int) -> Int {
        return 2 * index + 2
    }
    
    func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }
    
    // comparing priority
    func isHigherPriority(at firstIndex: Int, than secondIndex: Int) -> Bool {
        return priorityFunction(elements[firstIndex], elements[secondIndex])
    }
    
    func highestPriorityIndex(of parentIndex: Int, and childIndex: Int) -> Int {
        guard childIndex < count && isHigherPriority(at: childIndex, than: parentIndex) else {
            return parentIndex
        }
        return childIndex
    }
    
    func highestPriorityIndex(for parent: Int) -> Int {
        return highestPriorityIndex(of: highestPriorityIndex(of: parent, and: leftChildIndex(of: parent)), and: rightChildIndex(of: parent))
    }
    
    mutating func swapElement(at firstIndex: Int, with secondIndex: Int) {
        guard firstIndex != secondIndex else {
            return
        }
        elements.swapAt(firstIndex, secondIndex)
    }
    
    mutating func enqueue(_ element: Element) {
        elements.append(element)
        siftUp(elementAtIndex: count-1)
    }
    
    mutating func siftUp(elementAtIndex index: Int) {
        let parent = parentIndex(of: index)
        guard !isRoot(index), isHigherPriority(at: index, than: parent) else {
            return
        }
        swapElement(at: index, with: parent)
        siftUp(elementAtIndex: parent)
    }
    
    mutating func dequeue() -> Element? {
        guard !isEmpty else {
            return nil
        }
        swapElement(at: 0, with: count-1)
        let element = elements.removeLast()
        if !isEmpty {
            siftDown(elementAtIndex: 0)
        }
        return element
    }
    
    mutating func siftDown(elementAtIndex index: Int) {
        let childIndex = highestPriorityIndex(for: index)
        if index == childIndex {
            return
        }
        swapElement(at: index, with: childIndex)
        siftDown(elementAtIndex: childIndex)
    }
}

//let k = 3;
//let arr = [4,5,8,2];
//let kthLargest = KthLargest(3, arr);
//print(kthLargest.add(3));   // returns 4
//print(kthLargest.add(5));   // returns 5
//print(kthLargest.add(10));  // returns 5
//print(kthLargest.add(9));   // returns 8
//print(kthLargest.add(4));   // returns 8


let k = 3;
let arr = [5,-1];
let kthLargest = KthLargest(3, arr);
print(kthLargest.add(2));   // returns -1
print(kthLargest.add(1));   // returns 1
print(kthLargest.add(-1));  // returns 1
print(kthLargest.add(3));   // returns 2
print(kthLargest.add(4));   // returns 3

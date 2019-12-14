/*
23. Merge k Sorted Lists

Merge k sorted linked lists and return it as one sorted list. Analyze and describe its complexity.

Example:

Input:
[
  1->4->5,
  1->3->4,
  2->6
]
Output: 1->1->2->3->4->4->5->6
*/

/**
 * Definition for singly-linked list.
 */
public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init(_ val: Int) {
      self.val = val
      self.next = nil
  }
}

class Solution {
//    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
//        if lists.count == 0 {
//            return nil;
//        } else if lists.count == 1 {
//            return lists[0]
//        } else {
//            var allLists = lists
//            var l1 = lists[0]
//            let l2 = lists[1]
//            l1 = mergeTwoLists(l1, l2)
//            allLists[0] = l1
//            allLists.remove(at: 1)
//            return mergeKLists(allLists)
//        }
//    }
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        if lists.count == 0 {
            return nil;
        } else if lists.count == 1 {
            return lists[0]
        } else {
            var newLists = [ListNode?]()
            for i in stride(from: 0, to: lists.count ,by: 2) {
                let nextListNode = (lists.count % 2 != 0 && (i == lists.count-1)) ? nil : lists[i+1]
                let twoMergedNode = mergeTwoLists(lists[i], nextListNode)
                newLists.append(twoMergedNode)
            }
            return mergeKLists(newLists)
        }
    }
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil { return l2 }
        if l2 == nil { return l1 }
        
        if l1!.val < l2!.val {
            l1!.next = mergeTwoLists(l1!.next, l2)
            return l1
        } else {
            l2!.next = mergeTwoLists(l2!.next, l1)
            return l2
        }
    }
    
    func mergeKLists2(_ lists: [ListNode?]) -> ListNode? {
        if lists.count == 0 {
            return nil;
        }
        
        var values = [Int]()
        for i in 0..<lists.count {
            var listNode = lists[i]
            
            while listNode != nil {
                values.append(listNode!.val)
                listNode = listNode?.next
            }
        }
        if values.count == 0 {
            return nil
        }
        values = values.sorted()
        let head = ListNode(values[0])
        var loopNode: ListNode? = head
        for value in values {
            loopNode!.next = ListNode(value)
            loopNode = loopNode!.next
        }
        return head.next
    }
}

let head1 = ListNode(1)
let node1 = ListNode(8)
let node2 = ListNode(9)
head1.next = node1
node1.next = node2
node2.next = nil

let head2 = ListNode(1)
let node3 = ListNode(3)
let node4 = ListNode(4)
let node5 = ListNode(5)
head2.next = node3
node3.next = node4
node4.next = node5

let head3 = ListNode(2)
let node6 = ListNode(3)
let node7 = ListNode(4)
let node8 = ListNode(15)
head3.next = node6
node6.next = node7
node7.next = node8

let solution = Solution.init()
var result = solution.mergeKLists2([head1, head2, head3])

while result != nil {
    print(result!.val)
    result = result?.next
}


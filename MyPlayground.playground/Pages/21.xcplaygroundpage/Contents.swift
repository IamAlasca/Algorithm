/**
21. Merge Two Sorted Lists
Easy

Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.

Example:

Input: 1->2->4, 1->3->4
Output: 1->1->2->3->4->4
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
//    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
//        if l1 == nil {
//            return l2
//        } else if l2 == nil {
//            return l1
//        } else {
//            var firstListNode = l1
//            var secondListNode = l2
//
//            let newHead :ListNode? = ListNode(0)
//            var loopNode = newHead
//
//            while (firstListNode != nil) && (secondListNode != nil) {
//                if firstListNode!.val <= secondListNode!.val {
//                    loopNode?.next = firstListNode
//                    firstListNode = firstListNode?.next
//                } else {
//                    loopNode?.next = secondListNode
//                    secondListNode = secondListNode?.next
//                }
//                loopNode = loopNode?.next
//            }
//            if firstListNode != nil {
//                loopNode?.next = firstListNode
//            }
//            if secondListNode != nil {
//                loopNode?.next = secondListNode
//            }
//            return newHead!.next
//        }
//    }
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

let solution = Solution.init()
var result = solution.mergeTwoLists(head1, head2)

while result != nil {
    print(result!.val)
    result = result?.next
}

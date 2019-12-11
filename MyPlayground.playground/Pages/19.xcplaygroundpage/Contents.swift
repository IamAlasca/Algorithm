/**
Given a linked list, remove the n-th node from the end of list and return its head.
 
Example:

Given linked list: 1->2->3->4->5, and n = 2.

After removing the second node from the end, the linked list becomes 1->2->3->5.
Note:

Given n will always be valid.
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
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let count = getListCount(head)
        var index = count - n
        var nodeBeforeDeletedNode : ListNode? = nil
        if index > 0 {
            var loopNode = head
            while  index >= 0 {
                if index == 1 {
                    nodeBeforeDeletedNode = loopNode!
                } else if index == 0 {
                    nodeBeforeDeletedNode?.next = loopNode?.next
                }
                loopNode = loopNode?.next
                index -= 1
            }
            return head
        } else if index == 0 {
            return head?.next
        } else {
            return nil
        }
        
    }
    
    func getListCount(_ head: ListNode?) -> Int {
        if head != nil {
            var loopNode = head
            var count = 1
            while loopNode?.next != nil {
                count += 1
                loopNode = loopNode?.next
            }
            return count
        } else {
            return 0;
        }
    }
}

let head = ListNode(1)
let node1 = ListNode(2)
let node2 = ListNode(3)
let node3 = ListNode(4)
let node4 = ListNode(5)
head.next = node1
node1.next = node2
node2.next = node3
node3.next = node4
node4.next = nil

let solution = Solution.init()
var result = solution.removeNthFromEnd(head, 8)

while result != nil {
    print(result!.val)
    result = result?.next
}

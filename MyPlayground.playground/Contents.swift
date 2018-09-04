
import Cocoa
import PlaygroundSupport

var str = "Hello, playground"
func twoSum(_ nums:[Int], _ target: Int) -> [Int] {
    var dict = [Int : Int]()
    for (i, num) in nums.enumerated() {
        if  let firstIndex =  dict[target - num] {
            return [firstIndex,i]
        } else {
            dict[num] = i
        }
    }
    fatalError("No valid output")
}

twoSum([2,7,11,15], 9)
twoSum([1,3,5,7,9], 12)
twoSum([1,3,7,5,9], 12)

var test = "haha"

var dict = [2:3,3:5]
dict[2]

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
    func getNextNode(_ l:ListNode?) -> ListNode? {
        if l != nil {
            return l!.next
        } else {
            return nil
        }
    }
    func getValFromNode(_ l:ListNode?) -> Int {
        if l != nil {
            return l!.val
        } else {
            return 0
        }
    }
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil && l2 == nil {
            return nil
        }
        let resultList = ListNode(0)
        var tmpNode = resultList
        var carry = 0
        var ll1 = l1
        var ll2 = l2
        while (ll1 != nil) || (ll2 != nil) || (carry != 0) {
            var a = getValFromNode(ll1) + getValFromNode(ll2) + carry
            carry = a / 10
            a = a % 10
            tmpNode.val = a
            
            ll1 = getNextNode(ll1)
            ll2 = getNextNode(ll2)
            if ll1 != nil || ll2 != nil || carry != 0 {
                tmpNode.next = ListNode(0)
                tmpNode = getNextNode(tmpNode)!
            }
        }
        return resultList
    }
    func printResult(_ l:ListNode?) -> Void {
        var ll = l
        while ll != nil {
//            print("\(getValFromNode(ll))")
            ll = getNextNode(ll)
        }
    }
}
let l1 = ListNode(2)
l1.next = ListNode(4)
l1.next!.next = ListNode(3)
let l2 = ListNode(5)
l2.next = ListNode(6)
l2.next!.next = ListNode(4)
let solu = Solution()
let result = solu.addTwoNumbers(l1,l2)
solu.printResult(result)
//print("\(result?.val)")


let s = "1234567"
let charIndex = s.index(s.startIndex, offsetBy: 0)
s[charIndex]


// abcdaacbde

class Solution3 {
    func charAt(str:String, at: Int) -> Character {
        let charIndex = str.index(str.startIndex, offsetBy: at)
        return str[charIndex]
    }
    
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var dict = [Character : Int]()
        var i = 0, ans = 0
        for j in 0..<s.count {
            let theChar = self.charAt(str: s, at: j)
            if let index = dict[theChar] {
                
//                if index < i { // Don't care index before i
//                    ans = max(ans, j - i + 1)
//                } else {
//                    i = index + 1
//                }
                i = max(index + 1, i)
            }
            ans = max(ans, j - i + 1)
            dict[theChar] = j // Need to keep refresh the dict
        }
        return ans
    }
}


//let solu3 = Solution3()
//let result31 = solu3.lengthOfLongestSubstring("aaaaaa")
//let result3 = solu3.lengthOfLongestSubstring("abcddeab")
//
//let result32 = solu3.lengthOfLongestSubstring("pwwkew")
//let result33 = solu3.lengthOfLongestSubstring("abcabcbb")
//let result34 = solu3.lengthOfLongestSubstring("tmmzuxt")

class Solution4 {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var nums: [Int] = Array(repeating: 0, count: nums1.count + nums2.count)
        
        var t1 = 0, t2 = 0
        while t1 < nums1.count && t2 < nums2.count {
            if nums1[t1] < nums2[t2] {
                nums[t1+t2] = nums1[t1]
                t1 += 1
                
            } else if nums1[t1] == nums2[t2] {
                nums[t1+t2] = nums1[t1]
                t1 += 1
                nums[t1+t2] = nums2[t2]
                t2 += 1
            } else {
                nums[t1+t2] = nums2[t2]
                t2 += 1
            }
        }
        while t1 < nums1.count {
            nums[t1+t2] = nums1[t1]
            t1 += 1
        }
        while t2 < nums2.count {
            nums[t1+t2] = nums2[t2]
            t2 += 1
        }
//        print("The nums is \(nums)")
        let middle = nums.count / 2
        if nums.count % 2 == 0 {
            return Double(nums[middle - 1] + nums[middle]) / 2.0
        } else {
            return Double(nums[middle])
        }
        
    }
}
let solu4 = Solution4()
let nums1 = [1, 3]
let nums2 = [2]
solu4.findMedianSortedArrays(nums1, nums2)


class Solution5 {
    func charAt(str:String, at: Int) -> Character {
        let charIndex = str.index(str.startIndex, offsetBy: at)
        return str[charIndex]
    }
    
    func longestPalindrome(_ s: String) -> String {
        
        
        return ""
    }
}

class Solution6 {
    func charAt(str:String, at: Int) -> Character {
        let charIndex = str.index(str.startIndex, offsetBy: at)
        return str[charIndex]
    }
    func convert(_ s: String, _ numRows: Int) -> String {
        // 注意先处理极端情况
        if s.count <= numRows || numRows == 1{
            return s
        }
        var resultStr = ""
        for i in 0..<numRows {
            var gap = 0
            while (i + gap) < s.count { // i + gap
                if i == 0 || i == (numRows - 1) { // 第一行和最后一行先处理
                    let a  = self.charAt(str: s, at: (i + gap))
                    print("i is \(i), gap is \(gap), a is \(a), index is \(i + gap)")
                    resultStr.append(a)
                } else {
                    var a:Character
                    a  = self.charAt(str: s, at: (i + gap))
                    resultStr.append(a)
                  
                    let tmpGap = gap + 2 * numRows - 2
                    if (tmpGap - i) < s.count {
                        a  = self.charAt(str: s, at: (tmpGap - i))
                        resultStr.append(a)
                    }
                    
                }
                gap += 2 * numRows - 2
            }
        }
        return resultStr
    }
}

let solu6 = Solution6()
let s6 = "ABCDE"
let numRows = 4
solu6.convert(s6, numRows)
// 3 PAHNAPLSIIGYIR
//   PAHNAPLSIIGYIR
// 4 PINALSIGYAHRPI
//   PINALSIGYAHRPI



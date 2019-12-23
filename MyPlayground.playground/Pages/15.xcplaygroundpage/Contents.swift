/**
15. 3Sum
Medium
Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.

Note:

The solution set must not contain duplicate triplets.

Example:

Given array nums = [-1, 0, 1, 2, -1, -4],

A solution set is:
[
  [-1, 0, 1],
  [-1, -1, 2]
]
Accepted
724,607
Submissions
2,854,527
*/

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        if nums.count<3 {
            return result
        }
        let nums = nums.sorted()
        for i in 0..<nums.count-2 {
            if i > 0 && nums[i] == nums[i - 1] {
                continue
            }
            var left = i+1
            var right = nums.count-1
            while left < right {
                if nums[i] + nums[left] + nums[right] == 0 {
                    result.append([nums[i], nums[left], nums[right]])
                    repeat {
                        left += 1
                    } while nums[left-1] == nums[left] &&  left < right
                    repeat {
                        right -= 1
                    } while nums[right+1] == nums[right] && left < right
                } else if (nums[i] + nums[left] + nums[right] > 0) {
                    right -= 1
                } else { // <0
                    left += 1
                }
                
            }
 
        }
        return result
        
    }
}

let solution = Solution()
let nums = [-1, 0, 1, 2, -1, -4]
print(solution.threeSum(nums))
print("end")

let nums2 = [0, 0, 0]
print(solution.threeSum(nums2))
print("end")

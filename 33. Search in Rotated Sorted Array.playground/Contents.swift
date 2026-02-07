
class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var l = 0, h = nums.endIndex
        var pivot = 0
        
        if h < 3 {
            return nums.firstIndex(of: target) ?? -1
        }
        
        for i in 0..<nums.count-1 {
            if nums[i] > nums[i+1] {
                pivot = i
                break
            }
        }

        if target == nums[pivot] {
            print("returning ", terminator: "")
            return pivot
        } else if target >= nums[0] && target <= nums[pivot] {
            l = 0
            h = pivot
        } else if target >= nums[pivot+1] && target <= nums.last! {
            l = pivot+1
            h = nums.endIndex
        } else {
            return -1
        }
        
        while l <= h {
            var m = (l+h) / 2

            if nums[m] == target {
                return m
            } else if target < nums[m]  {
                h = m-1
            } else if target > nums[m] {
                l = m+1
            } else {
                print("something went wrong")
            }
        }
        return -1
    }
}
print("start")
let s = Solution()
print(s.search([1], 0))
print(s.search([1], 1))
print(s.search([4,5,6,7,0,1,2], 2))
print(s.search([4,5,6,7,0,1,2], 1))
print(s.search([4,5,6,7,8,9,10,0,1,2], 0))
print(s.search([4,5,6,7,8,9,10,0,1,2], 13))
print(s.search([4,5,6,7,8,9,10,1,2,3], 0))
print(s.search([4,5,6,7,0,1,2], 0))
print(s.search([4,5,6,7,0,1,2], 3))
print("end")

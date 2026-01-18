class Solution {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var max = 0
        var newCount = 0
        
        for n in nums {
            if n == 1 {
                newCount += 1
            } else {
                if newCount > max {
                    max = newCount
                }
                newCount = 0
            }
        }
        
        if newCount > max {
            max = newCount
        }
        return max
    }
}

let s = Solution()
print(s.findMaxConsecutiveOnes([1,1,1,1,1,1,0,0,1,1,01,1,0,1,0,1,0,0,1,1,1,0,1,0,1]))

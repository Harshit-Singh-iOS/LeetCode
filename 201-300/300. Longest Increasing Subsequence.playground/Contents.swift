class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var dp = Array(repeating: 0, count: nums.endIndex)
        dp[nums.endIndex-1] = 1
        var maxR = 1
        
        for i in  stride(from: dp.endIndex-2, through: 0, by: -1) {
            var newMax = 1
            var found = false
            
            for j in i..<nums.endIndex where nums[j] > nums[i] {
                newMax = max(newMax, dp[j])
                found = true
            }
            
            dp[i] = found ? newMax + 1 : newMax
            maxR = max(dp[i], maxR)
        }

        return maxR
    }
}

print("start")
let s = Solution()
//print(s.lengthOfLIS([10,9,2,5,3,7,101,18]))
print(s.lengthOfLIS([0]))

print("end")

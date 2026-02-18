
import Foundation

class Solution {
    func getLastMoment(_ n: Int, _ left: [Int], _ right: [Int]) -> Int {
        let maxL = left.max() ?? 0
        var maxR = -1
        
        for a in right {
            maxR = max(maxR, n-a)
        }
        return max(maxL, maxR)
    }
}

var s = Solution()
print(s.getLastMoment(7, [1,2,3,4,5,6,7], [0]))
print(s.getLastMoment(7, [], [5]))
print(s.getLastMoment(7, [5], [0]))

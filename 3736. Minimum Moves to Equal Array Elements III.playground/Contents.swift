class Solution {
    func minMoves(_ nums: [Int]) -> Int {
        let max = nums.max()!
        var moves = 0
        
        for n in nums {
            moves += max - n
        }
        
        return moves
    }
}

let s = Solution()
var res = s.minMoves([3,1,4])




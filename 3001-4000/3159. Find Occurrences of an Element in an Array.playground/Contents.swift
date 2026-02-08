class Solution {
    func occurrencesOfElement(_ nums: [Int], _ queries: [Int], _ x: Int) -> [Int] {
        var dict: [Int: Int] = [:], res: [Int] = []
        // dict: (occurence, position)
        
        var count = 0
        for (i, n) in nums.enumerated() {
            if n == x {
                count += 1
                dict[count] = i
            }
        }
        
        queries.forEach {
            if let val = dict[$0] {
                res.append(val)
            } else {
                res.append(-1)
            }
        }
        
        return res
    }
}

let s = Solution()
var res = s.occurrencesOfElement([1,4,3,3,6,4,8,3,10], [1,2,1,1,1,1,2,2,1,1], 7)
print(res)



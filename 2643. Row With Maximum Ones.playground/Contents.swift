class Solution {
    func rowAndMaximumOnes(_ mat: [[Int]]) -> [Int] {
        var rowNum = -1, maxCount = -1

        for (r, row) in mat.enumerated() {
            var count = 0
            row.forEach {
                if $0 == 1 {
                    count += 1
                }
            }

            if count > maxCount {
                maxCount = count
                rowNum = r
            }
        }
        return [rowNum, maxCount]
    }
}

let s = Solution()
var res = s.rowAndMaximumOnes([])




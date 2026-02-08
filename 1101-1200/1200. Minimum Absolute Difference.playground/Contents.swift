
class Solution {
    func minimumAbsDifference(_ arr: [Int]) -> [[Int]] {
        var arr = arr.sorted()
        var result: [[Int]] = []
        var minSum = Int.max

        for i in 0..<arr.count-1 {
            var diff = abs(arr[i]-arr[i+1])
            if diff <= minSum {
                minSum = diff
                var new = [arr[i],arr[i+1]]
                result.append(new)
            }
        }

        result.removeAll(where: { ($0[1]-$0[0]) > minSum })

        return result
    }
}

let s = Solution()
print(s.minimumAbsDifference([4,2,1,3]))
print(s.minimumAbsDifference([1,3,6,10,15]))
print(s.minimumAbsDifference([3,8,-10,23,19,-4,-14,27]))

class Solution {
    func longestBalanced(_ s: String) -> Int {
        var array = Array(s)
        var max = -1
        
        for i in 0..<array.count {
            var dict: [Character: Int] = [:]
            
            for j in i..<array.count {
                dict[array[j], default: 0] += 1
                if Set(dict.values).count <= 1 && (j-i+1) > max {
                    max = (j-i+1)
                }
            }
        }
        
        return max
    }
}


var s = Solution()
print(s.longestBalanced("abbac"))
print(s.longestBalanced("aabac"))
print(s.longestBalanced("aabcc"))
print(s.longestBalanced("aba"))
print(s.longestBalanced("aaaaabaaaaa"))


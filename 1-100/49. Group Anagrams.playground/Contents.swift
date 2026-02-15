
class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dict: [[Character: Int]: [String]] = [:]
        
        strs.forEach { str in
            var new: [Character: Int] = [:]
            str.forEach { c in
                new[c, default: 0] += 1
            }
            dict[new, default: []].append(str)
        }
        
        return Array(dict.values)
    }
}

var s = Solution()
print(s.groupAnagrams(["eat","tea","tan","ate","nat","bat"]))

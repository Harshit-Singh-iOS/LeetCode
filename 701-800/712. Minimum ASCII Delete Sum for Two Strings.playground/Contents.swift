import Foundation

class Solution {
    func minimumDeleteSum(_ s1: String, _ s2: String) -> Int {
        var dict1: [Character: Int] = [:]
        var dict2: [Character: Int] = [:]
        var removedKeys: Set<Character> = .init()
        
        for c in s1 {
            dict1[c, default: 0] += 1
        }
        
        for c in s2 {
            dict2[c, default: 0] += 1
        }
        
        var total = 0
        
        for (key, value) in dict1 {
            if let val = dict2[key] {
                total += abs(val-value) * Int(key.asciiValue ?? 0)
                dict1.removeValue(forKey: key)
                dict2.removeValue(forKey: key)
                removedKeys.insert(key)
            } else {
                total += value * Int(key.asciiValue ?? 0)
            }
        }
        
        for (key, value) in dict2 {
            if let val = dict1[key] {
                total += abs(val-value) * Int(key.asciiValue ?? 0)
            } else {
                total += value * Int(key.asciiValue ?? 0)
            }
        }
        
        print(removedKeys)
        return total
    }
}

let s = Solution()
print(s.minimumDeleteSum("sea", "eat"))
print(s.minimumDeleteSum("delete", "leet"))





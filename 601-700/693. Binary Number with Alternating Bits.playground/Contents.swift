
import Foundation

class Solution {
    func hasAlternatingBits(_ n: Int) -> Bool {
        var n = n
        var expect = 1
        var first = true
        
        while n > 0 {
            let d = n % 2
            n = n / 2
            
            if first {
                expect = d == 0 ? 1 : 0
                first = false
                continue
            } else {
                if d == expect {
                    expect = expect == 0 ? 1 : 0
                    continue
                } else {
                    return false
                }
            }
        }
        
        return true
    }
}

var s = Solution()
print(s.hasAlternatingBits(5)) // true
print(s.hasAlternatingBits(7))
print(s.hasAlternatingBits(9))
print(s.hasAlternatingBits(10)) // true
print(s.hasAlternatingBits(15))
print(s.hasAlternatingBits(21)) // true
print(s.hasAlternatingBits(42)) // true
print(s.hasAlternatingBits(67))
print(s.hasAlternatingBits(85)) // true

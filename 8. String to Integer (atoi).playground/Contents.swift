import Foundation

class Solution {
    func myAtoi(_ s: String) -> Int {
        var isPositive = true
        var startRecording = false
        var s = s.trimmingCharacters(in: .whitespaces), newS = 0
        
        if s.first == "+" {
            isPositive = true
            s = String(s.dropFirst())
        } else if s.first == "-" {
            isPositive = false
            s = String(s.dropFirst())
        }
        
        for c in s {
            if let newD = Int(String(c)) {
                newS = newS * 10 + newD
                
                if newS > 2147483647 {
                    break
                }
            } else {
                break
            }
        }

        newS = isPositive ? newS : -1 * newS
        
        if newS < -2147483648 {
            return -2147483648
        } else if newS > 2147483647 {
            return 2147483647
        }
        
        return newS
    }
}

let s = Solution()
//print(s.myAtoi("42"))
//print(s.myAtoi("-042"))
//print(s.myAtoi("1337c0d3"))
//print(s.myAtoi("0-1"))
//print(s.myAtoi("words and 987"))
//print(s.myAtoi("-91283472332"))
print(s.myAtoi("20000000000000000000"))
print(s.myAtoi("-20000000000000000000"))




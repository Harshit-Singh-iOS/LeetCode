class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        if numRows == 1 {
            return s
        }
        
        var array = Array(repeating: "", count: numRows)
        
        var pos = 0
        let cMax = numRows, cMin = 0
        var positive = true
        
        for c in s {
            array[pos].append(c)
//            print(array)
            
            if positive {
                pos += 1
            } else {
                pos -= 1
            }
            
            if pos == cMax {
                pos -= 2
                positive = false
            } else if pos < 0 {
                pos += 2
                positive = true
            }
        }
        
        return array.joined()
    }
}

let s = Solution()
//print(s.convert("PAYPALISHIRING", 3))
//print(s.convert("PAYPALISHIRING", 4))
print(s.convert("AB", 1))




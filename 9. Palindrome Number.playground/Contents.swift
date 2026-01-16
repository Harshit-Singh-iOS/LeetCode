class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        var x = Array(String(x))
        
        let length = x.endIndex-1
        
        let loop = length % 2 == 0 ? (length / 2) : (length / 2) + 1
        
        for i in 0..<loop {
            if x[i] != x[length-i] {
                return false
            }
        }

        return true
    }
}


let s = Solution()
print(s.isPalindrome(121))
print(s.isPalindrome(1211))
print(s.isPalindrome(111111111211111111))
print(s.isPalindrome(1214121))
print("end")

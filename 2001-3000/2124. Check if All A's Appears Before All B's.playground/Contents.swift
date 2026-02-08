
class Solution {
    func checkString(_ sa: String) -> Bool {
        var arr = Array(sa)
        var pastB = false
        
        for c in arr {
            if c == "a" {                
                if pastB {
                    return false
                }
            }
            
            if c == "b" {
                pastB = true
            }
        }
        
        return true
    }
}

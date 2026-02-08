import Foundation

class Solution {
    func generateMatrix(_ n: Int) -> [[Int]] {
        var mat = Array(repeating: Array(repeating: 0, count: n), count: n)
        var minR = 0, maxR = n-1, minC = 0, maxC = n-1
        
        if n == 1 {
            return [[1]]
        }
        
        var counter = 0
        
        while counter < n*n {
            
            for j in stride(from: minC, through: maxC, by: 1){
                counter += 1
                mat[minR][j] = counter
            }
            
            minR += 1
            
            for i in stride(from: minR, through: maxR, by: 1) {
                counter += 1
                mat[i][maxC] = counter
            }
        
            maxC -= 1
            
            for j in stride(from: maxC, through: minC, by: -1) {
                counter += 1
                mat[maxR][j] = counter
            }
            
            maxR -= 1
            
            for i in stride(from: maxR, through: minR, by: -1) {
                counter += 1
                mat[i][minC] = counter
            }
            
            minC += 1
        }
        
        return mat
    }
}

let s = Solution()
s.generateMatrix(3).forEach({
    print($0)
})





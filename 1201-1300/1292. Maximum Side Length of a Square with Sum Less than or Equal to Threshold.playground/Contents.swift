

class Solution {
    func maxSideLength(_ grid: [[Int]], _ threshold: Int) -> Int {
        let m = grid.endIndex
        let n = grid[0].endIndex
        
        let maxSizeGrid = min(m, n)
        var magicSize = 0, prevMaxSum = -1
        var foundMaxSum = false
        
        for size in 1...maxSizeGrid {
            let (foundSum, maxForAllGridOfSize) = maxForAllGridOfSize(size: size, m: m, n: n, grid: grid, threshold: threshold)
            
            if foundSum {
                foundMaxSum = true
                if maxForAllGridOfSize >= prevMaxSum &&
                    maxForAllGridOfSize <= threshold {
    //                print("$$$$$$$$$$$$$$ Current size", size, "maxSum", maxForAllGridOfSize)
                    magicSize = size
                    prevMaxSum = maxForAllGridOfSize
                }
                
            }
        }
        
//        print("prevMaxSum", prevMaxSum)
        
        if foundMaxSum {
            return magicSize
        } else {
            return 0
        }

    }
    
    private func maxForAllGridOfSize(size: Int, m: Int, n: Int, grid: [[Int]], threshold: Int) -> (foundSum: Bool, sum: Int) {
        var max = -1
        var foundSum = false
        
        for i in 0..<(m - size + 1) {
            for j in 0..<(n - size + 1) {
                let newSum = allGridRequiredSums(m: m, n: n, startPoint: (i,j), currentSize: size, grid: grid)
                if newSum <= threshold && newSum > max {
//                    print("********** Current size", size, "maxSum", newSum)
                    max = newSum
                    foundSum = true
                }
            }
        }
        
        return (foundSum, max)
    }
    
    private func allGridRequiredSums(m: Int, n: Int, startPoint: (row: Int, col: Int), currentSize: Int, grid: [[Int]]) -> Int {
        var sum = 0
        
        // All row, col,diagonal sums
        for i in 0..<currentSize {
            for j in 0..<currentSize {
                sum += grid[i+startPoint.row][j+startPoint.col]
            }
        }
        return sum
    }
}

let s = Solution()
print(s.maxSideLength([[1,1,3,2,4,3,2], [1,1,3,2,4,3,2],[1,1,3,2,4,3,2]], 4)) // 2
print(s.maxSideLength([[2,2,2,2,2],[2,2,2,2,2],[2,2,2,2,2],[2,2,2,2,2],[2,2,2,2,2]], 1)) // 0
print(s.maxSideLength([[0]], 1)) // 1
print(s.maxSideLength([[0,0,1]], 1)) // 1
print(s.maxSideLength([[9]], 1)) // 0


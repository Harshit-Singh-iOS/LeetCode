import Foundation

class Solution {    
    func orangesRotting(_ grid1: [[Int]]) -> Int {
        var didSomethingRot = false, first = true
        var grid = grid1
        var time = 0
        
        let rotten = 2, fresh = 1, noOrange = 0
        let tr = grid.count, tc = grid[0].count
                        
        while first || didSomethingRot {
            first = false
            didSomethingRot = false
            
            for (r, row) in grid.enumerated() {
                for (c, orange) in row.enumerated() {
                    
                    if orange == rotten {
                        if r-1 > -1, fresh == grid[r-1][c] {
                            grid[r-1][c] = 2
                            didSomethingRot = true
                        }
                        
                        if r+1 < tr, fresh == grid[r+1][c] {
                            grid[r+1][c] = 2
                            didSomethingRot = true
                        }
                        
                        if c-1 > -1, fresh == grid[r][c-1] {
                            grid[r][c-1] = 2
                            didSomethingRot = true
                        }
                        
                        if c+1 < tc, fresh == grid[r][c+1] {
                            grid[r][c+1] = 2
                            didSomethingRot = true
                        }
                    }
                }
            }
                        
            time += 1
        }
        
        return finalCheck(grid, time: time-1)
    }
    
    func finalCheck(_ grid: [[Int]], time: Int) -> Int {
        for row in grid {
            for o in row {
                if o == 1 {
                    return -1
                }
            }
        }
        return time
    }
}

let s = Solution()
print(s.orangesRotting([[2,1,1],[1,1,0],[0,1,1]]))
print(s.orangesRotting([[2,1,1],[0,1,1],[1,0,1]]))
print(s.orangesRotting([[0,2]]))





class Solution {
    func maximumInvitations(_ grid: [[Int]]) -> Int {
        var countRows = 0, countCols = 0
        
        var rowData: [Int] = Array(repeating: 0, count: grid.endIndex)
        var colData: [Int] = Array(repeating: 0, count: grid[0].endIndex)
        
        print(rowData)
        print(colData)
        for (i, row) in grid.enumerated() {
            for (j, _) in grid[0].enumerated() {
                rowData[i] = rowData[i] | grid[i][j]
            }
        }
        
        for col in 0..<grid[0].count {
            for row in 0..<grid.count {
                colData[col] = colData[col] | grid[row][col]
            }
        }

        countRows = rowData.count(where: { $0 == 1 })
        countCols = colData.count(where: { $0 == 1 })
     
        return min(min(countCols, countRows), min(grid.endIndex, grid[0].endIndex))
    }
}

let s = Solution()
//var res = s.maximumInvitations([[1,1,1],
//                                [1,0,1],
//                                [0,0,1]])

//var res = s.maximumInvitations([[1,2,3],
//                                [4,5,6],
//                                [7,8,9],
//                                [10,11,12]])

//print(res)




let data =
[[0,0,0,0,0,0,0,1,0,0,1,0,0,0,0],
 [1,1,0,0,0,0,0,0,0,0,0,0,0,0,0],
 [1,0,0,1,0,1,0,0,0,0,0,0,0,1,0],
 [0,0,0,0,0,0,0,1,0,0,0,0,0,0,0],
 [0,0,0,0,0,0,0,1,0,0,0,0,0,0,0],
 [1,1,0,0,1,0,0,0,0,0,0,0,0,0,0],
 [0,0,0,1,0,1,0,0,0,0,0,0,0,0,0],
 [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
 [1,1,0,0,0,0,0,0,0,0,0,0,0,0,0],
 [0,0,0,1,0,1,0,0,0,0,0,0,0,1,0],
 [0,0,0,0,0,1,0,0,0,0,0,0,0,0,0],
 [0,0,0,0,0,1,0,0,0,0,0,0,0,1,0],
 [0,0,0,0,0,0,0,1,0,0,0,0,0,0,0],
 [0,0,0,1,0,0,0,0,0,0,0,0,1,0,1],
 [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
 [0,0,0,0,0,0,0,1,0,0,0,0,0,0,0],
 [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
 [0,0,0,1,0,1,0,0,0,0,0,0,0,0,0],
 [0,0,0,1,0,1,0,0,0,0,0,0,0,0,0],
 [1,1,0,0,0,0,0,0,0,0,0,0,0,0,0],
 [0,0,0,1,0,1,0,0,0,0,0,0,0,1,0]]

var res1 = s.maximumInvitations(data)

print(res1)

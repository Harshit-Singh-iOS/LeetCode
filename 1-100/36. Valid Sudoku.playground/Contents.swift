
class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        for i in 0..<9 {
            var countH: Set<Character> = []
            var countV: Set<Character> = []
            
            for j in 0..<9 {
                let c1 = board[i][j]

                if c1 != "." {
                    if countH.contains(c1) {
                        return false
                    }

                    countH.insert(c1)
                }

                let c2 = board[j][i]
                if c2 != "." {
                    if countV.contains(c2) {
                        return false
                    }
                    countV.insert(c2)
                }
            }
            
            countH = []
            countV = []
        }
        
        for r in stride(from: 0, to: 9, by: 3) {
            for c in stride(from: 0, to: 9, by: 3) {
                var countGrid: Set<Character> = []
                
                for i in 0..<3 {
                    for j in 0..<3 {
                        
                        let c = board[i + r][j + c]
                        if c != "." {
                            if countGrid.contains(c) {
                                return false
                            }
                            countGrid.insert(c)
                        }
                    }
                }
            }
        }

        return true
    }
}

let s = Solution()
let board: [[Character]] =
[[".",".",".", ".","5",".", ".","1","."],
 [".","4",".", "3",".",".", ".",".","."],
 [".",".",".", ".",".","3", ".",".","1"],

 ["8",".",".", ".",".",".", ".","2","."],
 [".",".","2", ".","7",".", ".",".","."],
 [".","1","5", ".",".",".", ".",".","."],
 
 [".",".",".", ".",".","2", ".",".","."],
 [".","2",".", "9",".",".", ".",".","."],
 [".",".","4", ".",".",".", ".",".","."]]
print(s.isValidSudoku(board))

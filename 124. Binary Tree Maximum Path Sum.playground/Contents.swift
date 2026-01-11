class Solution {
    var sumList: [Int] = []
   
    func maxPathSum(_ root: TreeNode?) -> Int {
        if let root,
           root.left == nil,
           root.right == nil {
            return root.val
        }
       
        maxPathSumHelper(root)
        return sumList.max()!
    }
   
    private func maxPathSumHelper(_ root: TreeNode?) -> Int? {
        
       if root == nil {
           return nil
       } else {
            sumList.append(root!.val)
       }

       if let root,
           root.left == nil,
           root.right == nil {
            return root.val
        }
       
        let leftSum = maxPathSumHelper(root?.left)
        let rightSum = maxPathSumHelper(root?.right)
       
        let maxSum: Int
        
        if let leftSum, let rightSum {
            maxSum = max(leftSum, rightSum)
            
            let currentRootPath = leftSum + (root?.val ?? 0) + rightSum
            let currentRootPathLeft = leftSum + (root?.val ?? 0)
            let currentRootPathRight = (root?.val ?? 0) + rightSum
            
            sumList.append(currentRootPathLeft)
            sumList.append(currentRootPathRight)
            sumList.append(currentRootPath)
            sumList.append(leftSum)
            sumList.append(rightSum)
            
        } else if let leftSum {
            maxSum = leftSum
            
            let currentRootPath = leftSum + (root?.val ?? 0)
            let currentRootPathRight = (root?.val ?? 0)
            
            sumList.append(currentRootPathRight)
            sumList.append(currentRootPath)
            sumList.append(leftSum)
            
        } else if let rightSum {
            maxSum = rightSum
            
            let currentRootPath = (root?.val ?? 0) + rightSum
            let currentRootPathLeft = (root?.val ?? 0)
            
            sumList.append(currentRootPathLeft)
            sumList.append(currentRootPath)
            sumList.append(rightSum)
        } else {
            maxSum = Int.min
        }
            
               
        return maxSum + (root?.val ?? 0)
    }
}

let s = Solution()
print(s.maxPathSum(.init(1, .init(2), .init(3))))
s.sumList = []
print(s.maxPathSum(.init(-10, .init(9), .init(20, .init(15), .init(7)))))
s.sumList = []
print(s.maxPathSum(.init(78, .init(27, .init(40, .init(1), .init(14)), .init(71, .init(8), .init(4))), .init(35, .init(6), .init(24)))))
s.sumList = []
print(s.maxPathSum(.init(78, .init(27, .init(40, .init(1), .init(14)), .init(71, .init(8), nil)), .init(35, .init(6), .init(24)))))
s.sumList = []
print(s.maxPathSum(.init(2, .init(-1), nil)))
s.sumList = []
print(s.maxPathSum(.init(-2, .init(1), nil)))
s.sumList = []
print(s.maxPathSum(.init(-2, .init(-1), nil)))
print(s.sumList)
print("end")


public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

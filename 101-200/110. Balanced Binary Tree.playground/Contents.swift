class Solution {
    func isBalanced(_ root: TreeNode?) -> Bool {
        var left = balanceHeight(node: root?.left)
        var right = balanceHeight(node: root?.right)
        
        if left.0 == false || right.0 == false {
            return false
        }
        
        return abs(left.1 - right.1) <= 1
    }
    
    func balanceHeight(node: TreeNode?) -> (Bool, Int) {
        if node == nil {
            return (true, 0)
        }
        
        var left = balanceHeight(node: node?.left)
        var right = balanceHeight(node: node?.right)
        
        if left.0 == false || right.0 == false {
            return (false, 999)
        }
        
        return (abs(left.1 - right.1) <= 1, max(left.1, right.1) + 1)
    }
}

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func insertGreatestCommonDivisors(_ head: ListNode?) -> ListNode? {
        var val1 = 0, val2 = 0
        var node = head
        
        while node != nil && node?.next != nil {
            val1 = node!.val
            val2 = node!.next!.val
            
            var newNodeVal = gcd(v1: val1, v2: val2)
            
            var newNode = ListNode(newNodeVal, node?.next)
            node?.next = newNode
            
            node = node?.next?.next
        }
        
        return head
    }
    
    func gcd(v1: Int, v2: Int) -> Int {
        var v1 = v1, v2 = v2
        while v2 != 0 {
            var temp = v2
            v2 = v1 % v2
            v1 = temp
        }
        return v1
    }
}

let s = Solution()
var res = s.insertGreatestCommonDivisors(.init(18, .init(6, .init(10, .init(3)))))

while res != nil {
    print(res!.val)
    res = res?.next
}





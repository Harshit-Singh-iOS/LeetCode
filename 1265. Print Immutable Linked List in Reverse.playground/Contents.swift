
public class ImmutableListNode {
    public func printValue() {}
    public func getNext() -> ImmutableListNode? { return .init() }
}

class Solution {
    func printLinkedListInReverse(_ head: ImmutableListNode?) {
        if let head {
            printLinkedListInReverse(head.getNext())
            head.printValue()
        }
    }
}

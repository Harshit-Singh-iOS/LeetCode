public class Node {
    public var val: Int
    public var children: [Node]
    public init(_ val: Int, children: [Node] = []) {
        self.val = val
        self.children = children
    }
}


class Solution {
    func levelOrder(_ root: Node?) -> [[Int]] {
        var result: [[Int]] = []
        
        guard let root else {
            return result
        }
        
        var queue: [(node: Node, level: Int)] = []
        
        queue.append((root, 0))
        result.append([root.val])
        
        while !queue.isEmpty {
            let pop = queue.removeFirst()
            
            for child in pop.node.children {
                queue.append((child, pop.level + 1))
                
                if result.endIndex <= pop.level + 1 {
                    result.append([])
                }
                result[pop.level+1].append(child.val)
            }
        }
        
        return result
    }
}


let s = Solution()
//print(s.levelOrder(.init(1, children: [.init(3, children: [.init(5, children: []), .init(6, children: [])]), .init(2), .init(4)])))

let tree: Node = Node(1,
                      children: [
                        .init(2),
                        .init(3,
                              children: [
                                .init(6),
                                .init(7, children: [
                                    .init(11, children: [.init(14)])
                                ])
                              ]),
                        .init(4, children: [
                            .init(8, children: [.init(12)])
                        ]),
                        .init(5, children: [
                            .init(9, children: [.init(13)]),
                            .init(10)
                        ]),
                      ])

print(s.levelOrder(tree))

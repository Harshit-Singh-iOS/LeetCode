struct Node {
    var managerId: Int
    var subId: [Int]
    var timeTaken: Int
}

class Solution {
    var managerAndEmp: [Int: [Int]] = [:]
    
    func numOfMinutes(_ n: Int, _ headID: Int, _ manager: [Int], _ informTime: [Int]) -> Int {
        var stack: [Node] = []
        var maxTime = Int.min
        
        if n == 1 {
            return 0
        }
        
        manager.forEach { m in
            if managerAndEmp[m] == nil {
                managerAndEmp[m] = subOf(managerId: m, manager: manager)
            }
        }
        
        let subOfHead = subOf(managerId: headID, manager: manager)
        stack.append(.init(managerId: headID, subId: subOfHead, timeTaken: informTime[headID]))
                
        while !stack.isEmpty {
            if let top = stack.popLast() {
                top.subId.forEach { m in
                    let subOfManager = managerAndEmp[m] ?? []
                    let newTime = top.timeTaken + informTime[m]
                    
                    if subOfManager.isEmpty {
                        maxTime = max(newTime, maxTime)
                    } else {
                        stack.append(.init(managerId: m, subId: subOfManager, timeTaken: newTime))
                    }
                }
            }
        }
        
        return maxTime
    }
    
    private func subOf(managerId: Int, manager: [Int]) -> [Int] {
        var newSubs: [Int] = []
        for (i, m) in manager.enumerated() {
            if m == managerId {
                newSubs.append(i)
            }
        }
        return newSubs
    }
}

let s = Solution()
var res = s.numOfMinutes(6, 2, [2,2,-1,2,2,2], [0,0,1,0,0,0])
print(res)
var res2 = s.numOfMinutes(10, 2, [2,2,-1,2,2,2,3,4,5,5], [0,0,1,0,3,4,0,0,0,0])
print(res2)


// Fail 38 / 39
// n = 100000
// Big test case: 2160 ms

print("end")

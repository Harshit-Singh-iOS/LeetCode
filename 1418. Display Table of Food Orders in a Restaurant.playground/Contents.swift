
class Solution {
    func displayTable(_ orders: [[String]]) -> [[String]] {
        
        
        var currentOrders: [String: [String: Int]] = [:]
        var food: Set<String> = []
        // [Table no: [Food: Count]]
        for order in orders {
            food.insert(order[2])
            
            let thisTable = order[1]
            let food = order[2]
            
            currentOrders[thisTable, default: [food: 0]][food, default: 0] += 1
        }
        
        let sortedFood = food.sorted()
        let sortedCurrentOrder = currentOrders.sorted(by: { Int($0.key)! < Int($1.key)! })
        
        var result: [[String]] = [["Table"]]
        result[0].append(contentsOf: sortedFood)
        
        for (table, order) in sortedCurrentOrder {
            var newRow: [String] = []
            newRow.append(table)
            
            for f in sortedFood {
                newRow.append("\(order[f] ?? 0)")
            }
            result.append(newRow)
        }
                
        return result
    }
}

let s = Solution()
let input = [
    ["David","3","Ceviche"],
    ["Corina","10","Beef Burrito"],
    ["David","3","Fried Chicken"],
    ["Carla","5","Water"],
    ["Carla","5","Ceviche"],
    ["Rous","3","Ceviche"]
]

s.displayTable(input).forEach { row in
    print(row)
}

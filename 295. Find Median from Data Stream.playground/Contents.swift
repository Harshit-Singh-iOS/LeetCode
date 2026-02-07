
class MedianFinder {
    var data: [Int] = []
    
    init() { }
    
    func addNum(_ num: Int) {
        if data.isEmpty {
            data.append(num)
        } else {
            let index = binary(element: num)
            data.insert(num, at: index)
        }
    }
    
    private func binary(element: Int) -> Int {
        var l = 0, h = data.endIndex
        var m = 0
        
        while l < h {
            m = (l+h) / 2
            
            if element == data[m] {
                return m
            } else if element > data[m] {
                l = m + 1
            } else if element < data[m] {
                h = m
            }
        }
        
        return l
    }
    
    func findMedian() -> Double {
        if data.endIndex % 2 == 0 {
            let middle = (data.endIndex / 2)
            let one = Double(data[middle - 1])
            let two = Double(data[middle])
            return (one + two) / 2
        } else {
            let middle = (data.endIndex / 2)
            return Double(data[middle])
        }
    }
}

print("Start")

let medianFinder = MedianFinder()
//medianFinder.addNum(1);    // arr = [1]
//medianFinder.addNum(2);    // arr = [1, 2]
//medianFinder.findMedian(); // return 1.5 (i.e., (1 + 2) / 2)
//medianFinder.addNum(3);    // arr[1, 2, 3]
//medianFinder.findMedian(); // return 2.0

//let data = [1,24,235,236,2,62,35,235,2,52,35,235,23,52,35,2,32,6,2,62,36,32,62,23532,5,23,2,34,23,42,35,23,2,97,65,523,35,235,23,23,5,23,52,5,235,2,52,35,32,523,8,46,7568,5,6,34,67,54,63,3,2,3632,6,4236,2,6,345,23,6,26,326,5]


let data = [1768, 3181, 2366]
data.forEach({ medianFinder.addNum($0)})
medianFinder.findMedian()

//let data = [1, 2, 24, 235, 236]
//medianFinder.data = data
//medianFinder.addNum(62)

print("end")


//let arr = [1,2,3,4,5,6,7,8]
//print(arr.endIndex)
//let middle = (arr.endIndex / 2)
//print(middle)
//
//let one = Double(arr[middle-1])
//let two = Double(arr[middle])
//
//print(one)
//print(two)


//var arr = [1,2,4,5,6]
//print(arr.endIndex)
//arr.insert(10, at: 5)

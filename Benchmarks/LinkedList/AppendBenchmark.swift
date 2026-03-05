//
//  Created by Vitali Kurlovich on 5.03.26.
//

import Benchmarks
import ListCollections

struct LinkedListAppendBenchmark {
    let count: Int

    var name: String {
        "LinkedList append \(count.formatted())"
    }

    func run() {
        let linkedList = RefLinkedList<Int>()

        for value in 0 ..< count {
            linkedList.append(value)
        }

        blackHole(linkedList.first)
        blackHole(linkedList.last)

        blackHole(linkedList)
    }
}

struct ArrayAppendBenchmark {
    let count: Int

    var name: String {
        "Array append \(count.formatted())"
    }

    func run() {
        var array: [Int] = []
        for value in 0 ..< count {
            array.append(value)
        }

        blackHole(array.first)
        blackHole(array.last)

        blackHole(array)
    }
}

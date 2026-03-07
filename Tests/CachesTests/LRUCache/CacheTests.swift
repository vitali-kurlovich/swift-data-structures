//
//  Created by Vitali Kurlovich on 6.03.26.
//

@testable import Caches
@testable import Lists
import Testing

@Suite("Cache")
struct CacheTests {}

extension CacheTests {
    @Test("Push")
    func push() {
        let cache = Cache<Int, String>(countLimit: 4)

        cache[0] = "0"
        #expect(cache.count == 1)
        #expect(cache[0] == "0")
        #expect(cache[1] == nil)

        cache[1] = "1"
        #expect(cache.count == 2)
        #expect(cache[0] == "0")
        #expect(cache[1] == "1")
        #expect(cache[2] == nil)

        cache[2] = "2"
        #expect(cache.count == 3)
        #expect(cache[0] == "0")
        #expect(cache[1] == "1")
        #expect(cache[2] == "2")
        #expect(cache[3] == nil)

        cache[3] = "3"
        #expect(cache.count == 4)
        #expect(cache[0] == "0")
        #expect(cache[1] == "1")
        #expect(cache[2] == "2")
        #expect(cache[3] == "3")

        cache[4] = "4"
        #expect(cache.count == 4)
        #expect(cache[0] == nil)
        #expect(cache[1] == "1")
        #expect(cache[2] == "2")
        #expect(cache[3] == "3")
        #expect(cache[4] == "4")

        #expect(cache[1] == "1")
        cache[5] = "5"

        #expect(cache.count == 4)
        #expect(cache[0] == nil)
        #expect(cache[1] == "1")
        #expect(cache[2] == nil)
        #expect(cache[3] == "3")
        #expect(cache[4] == "4")
        #expect(cache[5] == "5")
    }
}

//
extension CacheTests {
    @Test("Contains")
    func contains() {
        let cache = Cache<Int, String>(countLimit: 4)
        cache[0] = "0"
        cache[1] = "1"
        cache[2] = "2"
        cache[3] = "3"

        #expect(cache.contains(0))
        #expect(cache.contains(1))
        #expect(cache.contains(2))
        #expect(cache.contains(3))

        #expect(cache.contains(4) == false)

        cache[4] = "4"

        #expect(cache.contains(0) == false)
        #expect(cache.contains(1))
        #expect(cache.contains(2))
        #expect(cache.contains(3))
        #expect(cache.contains(4))
    }
}

extension CacheTests {
    @Test("Remove")
    func remove() {
        let cache = Cache<Int, String>(countLimit: 4)

        cache[0] = "0"
        cache[1] = "1"
        cache[2] = "2"
        cache[3] = "3"

        #expect(cache.count == 4)
        #expect(cache[0] == "0")
        #expect(cache[1] == "1")
        #expect(cache[2] == "2")
        #expect(cache[3] == "3")

        cache.remove(for: 1)

        #expect(cache.count == 3)
        #expect(cache[0] == "0")
        #expect(cache[1] == nil)
        #expect(cache[2] == "2")
        #expect(cache[3] == "3")

        cache.remove(for: 1)
        #expect(cache.count == 3)
        #expect(cache[0] == "0")
        #expect(cache[1] == nil)
        #expect(cache[2] == "2")
        #expect(cache[3] == "3")

        cache[3] = nil
        #expect(cache.count == 2)

        #expect(cache[0] == "0")
        #expect(cache[1] == nil)
        #expect(cache[2] == "2")
        #expect(cache[3] == nil)
    }
}

extension CacheTests {
    @Test("Remove All")
    func removeAll() {
        let cache = Cache<Int, String>(countLimit: 4)

        cache[0] = "0"
        cache[1] = "1"
        cache[2] = "2"
        cache[3] = "3"

        #expect(cache.count == 4)
        #expect(cache[0] == "0")
        #expect(cache[1] == "1")
        #expect(cache[2] == "2")
        #expect(cache[3] == "3")

        cache.removeAll()

        #expect(cache.count == 0)

        #expect(cache[0] == nil)
        #expect(cache[1] == nil)
        #expect(cache[2] == nil)
        #expect(cache[3] == nil)
    }
}

extension CacheTests {
    @Test("Change countLimit")
    func countLimit() {
        let cache = Cache<Int, String>(countLimit: 4)

        #expect(cache.countLimit == 4)

        cache[0] = "0"
        cache[1] = "1"
        cache[2] = "2"
        cache[3] = "3"

        #expect(cache.count == 4)
        #expect(cache[0] == "0")
        #expect(cache[1] == "1")
        #expect(cache[2] == "2")
        #expect(cache[3] == "3")

        cache.countLimit = 2
        #expect(cache.count == 2)

        #expect(cache[0] == nil)
        #expect(cache[1] == nil)
        #expect(cache[2] == "2")
        #expect(cache[3] == "3")

        cache[4] = "4"
        #expect(cache.count == 2)

        #expect(cache[0] == nil)
        #expect(cache[1] == nil)
        #expect(cache[2] == nil)
        #expect(cache[3] == "3")
        #expect(cache[4] == "4")

        cache.countLimit = 2
        #expect(cache.count == 2)

        #expect(cache[0] == nil)
        #expect(cache[1] == nil)
        #expect(cache[2] == nil)
        #expect(cache[3] == "3")
        #expect(cache[4] == "4")

        cache.countLimit = 3
        #expect(cache.count == 2)

        cache[5] = "5"
        #expect(cache.count == 3)

        #expect(cache[0] == nil)
        #expect(cache[1] == nil)
        #expect(cache[2] == nil)
        #expect(cache[3] == "3")
        #expect(cache[4] == "4")
        #expect(cache[5] == "5")

        cache[6] = "6"
        #expect(cache.count == 3)

        #expect(cache[0] == nil)
        #expect(cache[1] == nil)
        #expect(cache[2] == nil)
        #expect(cache[3] == nil)
        #expect(cache[4] == "4")
        #expect(cache[5] == "5")
        #expect(cache[6] == "6")

        cache.countLimit = 0

        cache[7] = "7"
        cache[8] = "8"
        cache[9] = "9"

        #expect(cache.count == 6)

        #expect(cache[0] == nil)
        #expect(cache[1] == nil)
        #expect(cache[2] == nil)
        #expect(cache[3] == nil)
        #expect(cache[4] == "4")
        #expect(cache[5] == "5")
        #expect(cache[6] == "6")
        #expect(cache[7] == "7")
        #expect(cache[8] == "8")
        #expect(cache[9] == "9")
    }
}

extension CacheTests {
    @Test("Change totalCostLimit")
    func totalCostLimit() {
        let cache = Cache<Int, String>(totalCostLimit: 100)

        #expect(cache.totalCostLimit == 100)

        cache.push(key: 0, value: "0", cost: 20)
        #expect(cache.totalCost == 20)
        #expect(cache.count == 1)

        cache.push(key: 1, value: "1", cost: 30)
        #expect(cache.totalCost == 50)
        #expect(cache.count == 2)

        cache.push(key: 2, value: "2", cost: 50)
        #expect(cache.totalCost == 100)
        #expect(cache.count == 3)

        cache.push(key: 3, value: "3", cost: 25)
        #expect(cache.totalCost == 75)
        #expect(cache.count == 2)

        cache[2] = nil
        #expect(cache.totalCost == 25)
        #expect(cache.count == 1)

        cache.push(key: 4, value: "4", cost: 25)
        #expect(cache.totalCost == 50)
        #expect(cache.count == 2)

        cache.push(key: 5, value: "5", cost: 10)
        #expect(cache.totalCost == 60)
        #expect(cache.count == 3)

        cache.push(key: 6, value: "6", cost: 10)
        #expect(cache.totalCost == 70)
        #expect(cache.count == 4)

        cache.push(key: 7, value: "7", cost: 10)
        #expect(cache.totalCost == 80)
        #expect(cache.count == 5)

        cache.push(key: 8, value: "8", cost: 10)
        #expect(cache.totalCost == 90)
        #expect(cache.count == 6)

        cache.push(key: 9, value: "9", cost: 10)
        #expect(cache.totalCost == 100)
        #expect(cache.count == 7)

        #expect(cache[3] == "3")

        cache.totalCostLimit = 50

        #expect(cache.totalCost == 45)
        #expect(cache.count == 3)
    }
}

extension CacheTests {
    @Test("DropLast")
    func dropLast() {
        let cache = Cache<Int, String>(countLimit: 4)

        cache[0] = "0"
        cache[1] = "1"
        cache[2] = "2"
        cache[3] = "3"

        #expect(cache.count == 4)
        #expect(cache[0] == "0")
        #expect(cache[1] == "1")
        #expect(cache[2] == "2")
        #expect(cache[3] == "3")

        #expect(cache.dropLast() == "0")

        #expect(cache.count == 3)
        #expect(cache.contains(0) == false)
        #expect(cache.contains(1))
        #expect(cache.contains(2))
        #expect(cache.contains(3))

        #expect(cache[1] == "1")
        #expect(cache.dropLast() == "2")

        #expect(cache.count == 2)
        #expect(cache.contains(0) == false)
        #expect(cache.contains(1))
        #expect(cache.contains(2) == false)
        #expect(cache.contains(3))

        #expect(cache.dropLast() == "3")

        #expect(cache.count == 1)
        #expect(cache.contains(0) == false)
        #expect(cache.contains(1))
        #expect(cache.contains(2) == false)
        #expect(cache.contains(3) == false)

        #expect(cache.dropLast() == "1")

        #expect(cache.count == 0)
        #expect(cache.contains(0) == false)
        #expect(cache.contains(1) == false)
        #expect(cache.contains(2) == false)
        #expect(cache.contains(3) == false)

        #expect(cache.dropLast() == nil)
        #expect(cache.count == 0)
    }
}

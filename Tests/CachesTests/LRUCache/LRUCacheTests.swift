//
//  Created by Vitali Kurlovich on 6.03.26.
//

@testable import Caches
@testable import Lists
import Testing

@Suite("LRUCache")
struct LRUCacheTests {}

extension LRUCacheTests {
    @Test("Push")
    func push() {
        let cache = LRUCache<Int, String>(countLimit: 4)

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
extension LRUCacheTests {
    @Test("Contains")
    func contains() {
        let cache = LRUCache<Int, String>(countLimit: 4)
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

extension LRUCacheTests {
    @Test("Remove")
    func remove() {
        let cache = LRUCache<Int, String>(countLimit: 4)

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

extension LRUCacheTests {
    @Test("Remove All")
    func removeAll() {
        let cache = LRUCache<Int, String>(countLimit: 4)

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

extension LRUCacheTests {
    @Test("Change countLimit")
    func countLimit() {
        let cache = LRUCache<Int, String>(countLimit: 4)

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
    }
}

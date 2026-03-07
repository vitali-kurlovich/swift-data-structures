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

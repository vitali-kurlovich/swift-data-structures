//
//  Created by Kurlovich Vitali on 9/30/26.
//

import Caches
import Foundation
import Testing

struct PersistentCacheTests {
    @Test func persistentCache() async throws {
        let name = UUID().uuidString

        let cache = PersistentCache(
            named: name,
            keyType: Int.self,
            valueType: String.self
        )

        await #expect(throws: (any Error).self) {
            _ = try await cache.load()
        }

        cache.push(key: 1, value: "1")
        cache.push(key: 2, value: "2")

        #expect(cache[1] == "1")
        #expect(cache[2] == "2")
        #expect(cache[3] == nil)

        try await cache.save()

        let secondCache = PersistentCache(named: name, keyType: Int.self,
                                          valueType: String.self)
        try await secondCache.load()

        #expect(secondCache[1] == "1")
        #expect(secondCache[2] == "2")
        #expect(secondCache[3] == nil)

        secondCache.push(key: 3, value: "3")

        #expect(secondCache[3] == "3")

        try await secondCache.save()

        try await cache.load()
        #expect(cache[1] == "1")
        #expect(cache[2] == "2")
        #expect(cache[3] == "3")

        #expect(cache.fileUrl == cache.storage.fileUrl)

        #expect(FileManager.default
            .fileExists(atPath: cache.fileUrl.path()) == true)

        try cache.removeCacheFile()

        #expect(FileManager.default
            .fileExists(atPath: cache.fileUrl.path()) == false)
    }
}

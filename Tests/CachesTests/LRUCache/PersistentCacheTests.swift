//
//  Created by Kurlovich Vitali on 9/30/26.
//

import Caches
import Foundation
import Testing

struct PersistentCacheTests {
    @Test func persistentCache() async throws {
        // 1. Get the system temporary directory URL
        let tempDir = FileManager.default.temporaryDirectory

        // 2. Create a unique filename for isolation
        let fileURL = tempDir.appendingPathComponent(UUID().uuidString + ".cache")

        // 3. Clean up the file automatically when the test finishes
        defer {
            try? FileManager.default.removeItem(at: fileURL)
        }

        let storage = JSONFilePersistentKeyValueStorage<Int, String>(
            fileUrl: fileURL
        )

        let cache = PersistentCache(storage: storage)

        await #expect(throws: (any Error).self) {
            _ = try await cache.load()
        }

        cache.push(key: 1, value: "1")
        cache.push(key: 2, value: "2")

        #expect(cache[1] == "1")
        #expect(cache[2] == "2")
        #expect(cache[3] == nil)

        try await cache.save()

        let secondCache = PersistentCache(storage: storage)
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
    }
}

//
//  Created by Kurlovich Vitali on 9/30/26.
//

import Caches
import Foundation
import Testing

#if canImport(Combine)
    import Combine

    struct FilePersistentKeyValueStorageTests {
        @Test func fileStorage() throws {
            // 1. Get the system temporary directory URL
            let tempDir = FileManager.default.temporaryDirectory

            // 2. Create a unique filename for isolation
            let fileURL = tempDir.appendingPathComponent(UUID().uuidString + ".cache")

            // 3. Clean up the file automatically when the test finishes
            defer {
                try? FileManager.default.removeItem(at: fileURL)
            }

            let storage = FilePersistentKeyValueStorage<Int, String, JSONDecoder, JSONEncoder>(
                fileUrl: fileURL,
                decoder: JSONDecoder(),
                encoder: JSONEncoder()
            )

            #expect(throws: (any Error).self) {
                _ = try storage.load()
            }

            let sequence = [(key: 1, value: "1"), (key: 2, value: "2")]

            try storage.save(sequence)

            let items = try Array(storage.load())
            #expect(sequence.count == items.count)

            #expect(sequence[0].key == 1)
            #expect(sequence[0].value == "1")

            #expect(sequence[1].key == 2)
            #expect(sequence[1].value == "2")
        }
    }

#endif

struct JSONFilePersistentKeyValueStorageTests {
    @Test func fileStorage() throws {
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

        #expect(throws: (any Error).self) {
            _ = try storage.load()
        }

        let sequence = [(key: 1, value: "1"), (key: 2, value: "2")]

        try storage.save(sequence)

        let items = try Array(storage.load())
        #expect(sequence.count == items.count)

        #expect(sequence[0].key == 1)
        #expect(sequence[0].value == "1")

        #expect(sequence[1].key == 2)
        #expect(sequence[1].value == "2")
    }
}

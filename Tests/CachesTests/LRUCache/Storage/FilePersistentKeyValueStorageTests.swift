//
//  Created by Kurlovich Vitali on 9/30/26.
//

import Caches
import Foundation
import Testing

#if canImport(Combine)
    import Combine

    struct FilePersistentKeyValueStorageTests {
        @Test func fileStorage() async throws {
            let name = UUID().uuidString

            let storage = FilePersistentKeyValueStorage<Int, String, JSONDecoder, JSONEncoder>(
                named: name,
                decoder: JSONDecoder(),
                encoder: JSONEncoder()
            )

            #expect(throws: (any Error).self) {
                _ = try storage.removeFile()
            }

            await #expect(throws: (any Error).self) {
                _ = try await storage.load()
            }

            let sequence = [(key: 1, value: "1"), (key: 2, value: "2")]

            try await storage.save(sequence)

            let items = try await Array(storage.load())
            #expect(sequence.count == items.count)

            #expect(sequence[0].key == 1)
            #expect(sequence[0].value == "1")

            #expect(sequence[1].key == 2)
            #expect(sequence[1].value == "2")

            #expect(FileManager.default
                .fileExists(atPath: storage.fileUrl.path()) == true)

            try storage.removeFile()

            #expect(FileManager.default
                .fileExists(atPath: storage.fileUrl.path()) == false)
        }
    }

#endif

struct JSONFilePersistentKeyValueStorageTests {
    @Test func fileStorage() async throws {
        let name = UUID().uuidString

        let storage = JSONFilePersistentKeyValueStorage<Int, String>(
            named: name
        )

        #expect(throws: (any Error).self) {
            _ = try storage.removeFile()
        }

        await #expect(throws: (any Error).self) {
            _ = try await storage.load()
        }

        let sequence = [(key: 1, value: "1"), (key: 2, value: "2")]

        try await storage.save(sequence)

        let items = try await Array(storage.load())
        #expect(sequence.count == items.count)

        #expect(sequence[0].key == 1)
        #expect(sequence[0].value == "1")

        #expect(sequence[1].key == 2)
        #expect(sequence[1].value == "2")

        #expect(FileManager.default
            .fileExists(atPath: storage.fileUrl.path()) == true)

        try storage.removeFile()

        #expect(FileManager.default
            .fileExists(atPath: storage.fileUrl.path()) == false)
    }
}

//
//  Created by Kurlovich Vitali on 9/30/26.
//

import Foundation

#if canImport(Combine)

    import Combine

    public struct FilePersistentKeyValueStorage<
        Key: Codable, Value: Codable,
        Decoder: TopLevelDecoder,
        Encoder: TopLevelEncoder
    >: PersistentKeyValueStorage, FileStorage
        where Decoder.Input == Data, Encoder.Output == Data
    {
        public let fileUrl: URL
        public let decoder: Decoder
        public let encoder: Encoder

        public init(fileUrl: URL, decoder: Decoder, encoder: Encoder) {
            self.fileUrl = fileUrl
            self.decoder = decoder
            self.encoder = encoder
        }

        public struct StoredKeyValues: Codable {
            public let keys: [Key]
            public let values: [Value]
        }

        public func load() async throws -> some Sequence<(key: Key, value: Value)> {
            let data: Data = try loadFile()

            let keyValues = try decoder.decode(StoredKeyValues.self, from: data)

            return zip(keyValues.keys, keyValues.values).lazy.map {
                (key: $0.0, value: $0.1)
            }
        }

        public func save(_ cachedData: any Sequence<(key: Key, value: Value)>) async throws {
            var keys: [Key] = []
            var values: [Value] = []

            for item in cachedData {
                keys.append(item.key)
                values.append(item.value)
            }

            let stored = StoredKeyValues(keys: keys, values: values)
            let data = try encoder.encode(stored)

            try saveFile(data)
        }
    }

    extension FilePersistentKeyValueStorage: Sendable where Decoder: Sendable, Encoder: Sendable {}

    public extension FilePersistentKeyValueStorage {
        /**
         Create file in the temporaryDirectory with name {named}.cache
         */
        init(named: String, decoder: Decoder, encoder: Encoder) {
            let tempDir = FileManager.default.temporaryDirectory
            let fileURL = tempDir.appendingPathComponent(named + ".cache")
            self.init(fileUrl: fileURL, decoder: decoder, encoder: encoder)
        }
    }

#endif

public struct JSONFilePersistentKeyValueStorage<
    Key: Codable, Value: Codable
>: PersistentKeyValueStorage, FileStorage, Sendable {
    public let fileUrl: URL
    public let decoder: JSONDecoder
    public let encoder: JSONEncoder

    public init(
        fileUrl: URL,
        decoder: JSONDecoder = JSONDecoder(),
        encoder: JSONEncoder = JSONEncoder()
    ) {
        self.fileUrl = fileUrl
        self.decoder = decoder
        self.encoder = encoder
    }

    public struct StoredKeyValues: Codable {
        public let keys: [Key]
        public let values: [Value]
    }

    public func load() async throws -> some Sequence<(key: Key, value: Value)> {
        let data: Data = try loadFile()

        let keyValues = try decoder.decode(StoredKeyValues.self, from: data)

        return zip(keyValues.keys, keyValues.values).lazy.map {
            (key: $0.0, value: $0.1)
        }
    }

    public func save(_ cachedData: any Sequence<(key: Key, value: Value)>) async throws {
        var keys: [Key] = []
        var values: [Value] = []

        for item in cachedData {
            keys.append(item.key)
            values.append(item.value)
        }

        let stored = StoredKeyValues(keys: keys, values: values)
        let data = try encoder.encode(stored)

        try saveFile(data)
    }
}

public extension JSONFilePersistentKeyValueStorage {
    /**
     Create file in the temporaryDirectory with name {named}.cache
     */
    init(named: String, decoder _: JSONDecoder = JSONDecoder(), encoder _: JSONEncoder = JSONEncoder()) {
        let tempDir = FileManager.default.temporaryDirectory
        let fileURL = tempDir.appendingPathComponent(named + ".cache")
        self.init(fileUrl: fileURL)
    }
}

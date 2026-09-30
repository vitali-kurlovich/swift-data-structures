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
    >: PersistentKeyValueStorage
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

        public func load() throws -> some Sequence<(key: Key, value: Value)> {
            let data = try Data(contentsOf: fileUrl)

            let keyValues = try decoder.decode(StoredKeyValues.self, from: data)

            return zip(keyValues.keys, keyValues.values).lazy.map {
                (key: $0.0, value: $0.1)
            }
        }

        public func save(_ cachedData: any Sequence<(key: Key, value: Value)>) throws {
            var keys: [Key] = []
            var values: [Value] = []

            for item in cachedData {
                keys.append(item.key)
                values.append(item.value)
            }

            let stored = StoredKeyValues(keys: keys, values: values)
            let data = try encoder.encode(stored)

            try data.write(to: fileUrl, options: .atomic)
        }
    }

#endif

public struct JSONFilePersistentKeyValueStorage<
    Key: Codable, Value: Codable
>: PersistentKeyValueStorage {
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

    public func load() throws -> some Sequence<(key: Key, value: Value)> {
        let data = try Data(contentsOf: fileUrl)

        let keyValues = try decoder.decode(StoredKeyValues.self, from: data)

        return zip(keyValues.keys, keyValues.values).lazy.map {
            (key: $0.0, value: $0.1)
        }
    }

    public func save(_ cachedData: any Sequence<(key: Key, value: Value)>) throws {
        var keys: [Key] = []
        var values: [Value] = []

        for item in cachedData {
            keys.append(item.key)
            values.append(item.value)
        }

        let stored = StoredKeyValues(keys: keys, values: values)
        let data = try encoder.encode(stored)

        try data.write(to: fileUrl, options: .atomic)
    }
}

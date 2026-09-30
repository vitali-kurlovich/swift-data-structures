//
//  Created by Kurlovich Vitali on 9/30/26.
//

import Foundation

public extension PersistentCache where Storage: FileStorage {
    var fileUrl: URL {
        storage.fileUrl
    }

    func removeCacheFile() throws {
        try storage.removeFile()
    }
}

public extension PersistentCache {
    convenience init(
        named: String,
        keyType _: Key.Type,
        valueType _: Value.Type,
        decoder: JSONDecoder = JSONDecoder(),
        encoder: JSONEncoder = JSONEncoder()
    ) where Storage == JSONFilePersistentKeyValueStorage<Key, Value> {
        let storage = JSONFilePersistentKeyValueStorage<Key, Value>(
            named: named,
            decoder: decoder,
            encoder: encoder
        )

        self.init(storage: storage)
    }
}

//
//  Created by Kurlovich Vitali on 9/30/26.
//

public final class PersistentCache<Storage: PersistentKeyValueStorage> where Storage.Key: Hashable {
    public typealias Key = Storage.Key
    public typealias Value = Storage.Value

    public let cache: Cache<Key, Value>
    public let storage: Storage

    public init(cache: Cache<Key, Value>, storage: Storage) {
        self.cache = cache
        self.storage = storage
    }

    public convenience init(storage: Storage) {
        let cache = Cache<Key, Value>()
        self.init(cache: cache, storage: storage)
    }

    public func load() async throws {
        for item in try await storage.load() {
            cache.push(key: item.key, value: item.value)
        }
    }

    public func save() async throws {
        try await storage.save(cache)
    }
}

extension PersistentCache: CacheProtocol {
    public func pull(key: Storage.Key) -> Storage.Value? {
        cache.pull(key: key)
    }

    public func push(key: Key, value: Value, cost: Int) {
        cache.push(key: key, value: value, cost: cost)
    }

    public func remove(for key: Storage.Key) {
        cache.remove(for: key)
    }
}

extension PersistentCache: Sequence {
    public typealias Element = Cache<Key, Value>.Element
    public typealias Iterator = Cache<Key, Value>.Iterator

    public func makeIterator() -> Iterator {
        cache.makeIterator()
    }
}

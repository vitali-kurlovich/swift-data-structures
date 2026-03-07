//
//  Created by Vitali Kurlovich on 6.03.26.
//

import Lists

/**
 An LRU (Least Recently Used) Cache is a data structure that stores a limited number of items, automatically evicting the oldest, least recently accessed data when capacity is reached.
 */
public final class LRUCache<Key: Hashable, T> {
    /// The name of the cache.
    public var name: String

    /// The maximum number of objects the cache should hold.
    public var countLimit: Int {
        didSet {
            assert(countLimit > 0)
            removeRedundant()
        }
    }

    let storage = LinkedList<KeyValue>()
    var map: [Key: MapValue]

    public init(name: String = "", countLimit: Int) {
        assert(countLimit > 0)
        self.name = name
        self.countLimit = countLimit
        map = .init()
    }
}

extension LRUCache {
    typealias MapValue = ListNode<KeyValue>

    struct KeyValue {
        let key: Key
        let value: T
    }
}

public extension LRUCache {
    /// The number of objects the cache held
    var count: Int {
        map.count
    }

    /// Returns a Boolean value indicating whether the cache contains the object associated with a given key.
    func contains(_ key: Key) -> Bool {
        map[key] != nil
    }
}

public extension LRUCache {
    subscript(_ key: Key) -> T? {
        get {
            pull(key: key)
        }
        set {
            if let newValue {
                push(key: key, value: newValue)
            } else {
                remove(for: key)
            }
        }
    }
}

public extension LRUCache {
    /// Returns the value associated with a given key.
    func pull(key: Key) -> T? {
        guard let node = map[key] else {
            return nil
        }

        storage.remove(node)
        storage.prepend(node: node)

        return node.value.value
    }

    func push(key: Key, value: T) {
        let stored = KeyValue(key: key, value: value)

        if count < countLimit {
            let node = storage.prepend(stored)
            map[key] = node
        } else {
            let node = storage.dropLast()!
            map[node.value.key] = nil
            node.value = stored
            map[key] = node
            storage.prepend(node: node)
        }
    }
}

public extension LRUCache {
    /// Remove the oldest value from the cache
    @discardableResult
    func dropLast() -> T? {
        if let node = storage.dropLast() {
            map[node.value.key] = nil
            return node.value.value
        } else {
            return nil
        }
    }
}

public extension LRUCache {
    /// Empties the cache.
    func removeAll() {
        storage.removeAll()
        map.removeAll()
    }

    /// Removes the value of the specified key in the cache.
    func remove(for key: Key) {
        guard let node = map[key] else {
            return
        }

        storage.remove(node)
        map[key] = nil
    }
}

private extension LRUCache {
    func removeRedundant() {
        let redundantCount = count - countLimit

        guard redundantCount > 0 else { return }

        for _ in 0 ..< redundantCount {
            let node = storage.dropLast()!
            map[node.value.key] = nil
        }
    }
}

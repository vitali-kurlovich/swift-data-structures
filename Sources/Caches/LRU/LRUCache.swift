//
//  Created by Vitali Kurlovich on 6.03.26.
//

import Lists

public final class LRUCache<Key: Hashable, T> {
    public let maxCacheSize: Int

    let storage = LinkedList<KeyValue>()
    var map: [Key: MapValue]

    public init(maxCacheSize: Int = 64) {
        assert(maxCacheSize > 0)
        self.maxCacheSize = maxCacheSize
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
    var count: Int {
        map.count
    }

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
                remove(by: key)
            }
        }
    }
}

public extension LRUCache {
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

        if count < maxCacheSize {
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
    func removeAll() {
        storage.removeAll()
        map.removeAll()
    }

    func remove(by key: Key) {
        guard let node = map[key] else {
            return
        }

        storage.remove(node)
        map[key] = nil
    }
}

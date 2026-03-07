//
//  Created by Vitali Kurlovich on 6.03.26.
//

import Lists

/**
 An LRU (Least Recently Used) Cache is a data structure that stores a limited number of items, automatically evicting the oldest, least recently accessed data when capacity is reached.
 */
public final class Cache<Key: Hashable, T> {
    /// The name of the cache.
    public var name: String

    /// The maximum number of objects the cache should hold.
    public var countLimit: Int {
        didSet {
            assert(countLimit >= 0)
            removeRedundant()
        }
    }

    /// The maximum total cost that the cache can hold before it starts evicting objects.
    public var totalCostLimit: Int {
        didSet {
            assert(totalCostLimit >= 0)
            removeRedundant()
        }
    }

    private(set) var totalCost: Int = 0

    let storage = LinkedList<KeyValue>()
    private(set) var map: [Key: MapValue]

    public init(name: String = "", countLimit: Int = 0, totalCostLimit: Int = 0) {
        assert(countLimit >= 0)
        assert(totalCostLimit >= 0)

        self.name = name
        self.countLimit = countLimit
        self.totalCostLimit = totalCostLimit
        map = .init()
    }
}

extension Cache {
    typealias MapValue = ListNode<KeyValue>

    struct KeyValue {
        let cost: Int
        let key: Key
        let value: T
    }
}

public extension Cache {
    /// The number of objects the cache held
    var count: Int {
        map.count
    }

    /// Returns a Boolean value indicating whether the cache contains the object associated with a given key.
    func contains(_ key: Key) -> Bool {
        map[key] != nil
    }
}

public extension Cache {
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

public extension Cache {
    /// Returns the value associated with a given key.
    func pull(key: Key) -> T? {
        guard let node = map[key] else {
            return nil
        }

        storage.remove(node)
        storage.prepend(node: node)

        return node.value.value
    }

    func push(key: Key, value: T, cost: Int = 0) {
        assert(cost >= 0)

        let stored = KeyValue(cost: cost, key: key, value: value)

        let reachedCostLimit = totalCostLimit > 0 && (totalCost + cost > totalCostLimit)
        let reachedCountLimit = countLimit > 0 && count >= countLimit

        if storage.isEmpty || !(reachedCostLimit || reachedCountLimit) {
            let node = storage.prepend(stored)
            map[key] = node
            totalCost += cost
        } else {
            let node = storage.dropLast()!

            totalCost -= node.value.cost
            totalCost += cost

            map[node.value.key] = nil

            node.value = stored
            map[key] = node

            storage.prepend(node: node)

            removeRedundant()
        }
    }
}

public extension Cache {
    /// Remove the oldest value from the cache
    @discardableResult
    func dropLast() -> T? {
        if let node = storage.dropLast() {
            map[node.value.key] = nil
            totalCost -= node.value.cost
            return node.value.value
        } else {
            return nil
        }
    }
}

public extension Cache {
    /// Empties the cache.
    func removeAll() {
        storage.removeAll()
        map.removeAll()
        totalCost = 0
    }

    /// Removes the value of the specified key in the cache.
    func remove(for key: Key) {
        guard let node = map[key] else {
            return
        }

        storage.remove(node)
        map[key] = nil
        totalCost -= node.value.cost
    }
}

private extension Cache {
    func removeRedundant() {
        removeRedundantByCount()
        removeRedundantByCost()
    }

    func removeRedundantByCount() {
        guard countLimit > 0 else { return }

        while !storage.isEmpty, countLimit < count {
            let node = storage.dropLast()!
            map[node.value.key] = nil
            totalCost -= node.value.cost
        }
    }

    func removeRedundantByCost() {
        guard totalCostLimit > 0 else { return }

        while !storage.isEmpty, totalCostLimit < totalCost {
            let node = storage.dropLast()!
            map[node.value.key] = nil
            totalCost -= node.value.cost
        }
    }
}

//
//  Created by Vitali Kurlovich on 4.03.26.
//

public extension RefLinkedList {
    @discardableResult
    func remove(_ node: RefListNode<T>) -> RefListNode<T> {
        assert(contains(node))

        if node === _first {
            _first = node.next
        }

        if node === _last {
            _last = node.prev
        }

        node.remove()
        return node
    }

    func removeAll() {
        defer {
            _first = nil
            _last = nil
        }
        var current = _first

        while let node = current {
            current = node.next

            node._prev = nil
            node._next = nil
        }
    }
}

public extension RefLinkedList {
    func append(node: RefListNode<T>) {
        if isEmpty {
            _first = node.first
            _last = node.last
        } else {
            _last?.append(node.first)
            _last = node.last
        }

        assert(first !== nil)
        assert(last !== nil)

        assert(first?.prev == nil)
        assert(last?.next == nil)
    }

    @discardableResult
    func append(_ value: T) -> RefListNode<T> {
        let node = RefListNode(value)
        append(node: node)
        return node
    }
}

public extension RefLinkedList {
    func prepend(node: RefListNode<T>) {
        if isEmpty {
            _first = node.first
            _last = node.last
        } else {
            let first = _first!
            _first = node.first
            node.last.setNext(first)
        }

        assert(first?.prev == nil)
        assert(last?.next == nil)
    }

    @discardableResult
    func prepend(_ value: T) -> RefListNode<T> {
        let node = RefListNode(value)
        prepend(node: node)
        return node
    }
}

public extension RefLinkedList {
    func insert(node: RefListNode<T>, after other: RefListNode<T>) {
        assert(contains(other))

        if other === _last {
            other.append(node)
            _last = node.last
        } else {
            other.append(node)
        }
    }

    @discardableResult
    func insert(_ value: T, after other: RefListNode<T>) -> RefListNode<T> {
        let node = RefListNode<T>(value)
        insert(node: node, after: other)
        return node
    }
}

public extension RefLinkedList {
    func insert(node: RefListNode<T>, before other: RefListNode<T>) {
        assert(contains(other))

        if other === _first {
            other.prepend(node)
            _first = node.first
        } else {
            other.prepend(node)
        }
    }

    @discardableResult
    func insert(_ value: T, before other: RefListNode<T>) -> RefListNode<T> {
        let node = RefListNode<T>(value)
        insert(node: node, before: other)
        return node
    }
}

public extension RefLinkedList {
    func swap(_ node: RefListNode<T>, with other: RefListNode<T>) {
        guard node !== other else { return }

        assert(contains(node))
        assert(contains(other))

        node.swap(with: other)

        if node === _first {
            _first = other.first
        }

        if node === _last {
            _last = other.last
        }

        if other === _first {
            _first = node.first
        }

        if other === _last {
            _last = node.last
        }
    }
}

public extension RefLinkedList {
    func disconnect(by node: RefListNode<T>) -> RefLinkedList<T> {
        assert(contains(node))

        let second = node.disconnect()

        _last = node

        return RefLinkedList<T>(first: second, last: second?.last)
    }
}

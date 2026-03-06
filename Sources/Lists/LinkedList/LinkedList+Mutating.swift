//
//  Created by Vitali Kurlovich on 4.03.26.
//

public extension LinkedList {
    @discardableResult
    func remove(_ node: ListNode<T>) -> ListNode<T> {
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

public extension LinkedList {
    @discardableResult
    func dropFirst() -> ListNode<T>? {
        guard let first else {
            return nil
        }

        return remove(first)
    }

    @discardableResult
    func dropLast() -> ListNode<T>? {
        guard let last else {
            return nil
        }

        return remove(last)
    }
}

public extension LinkedList {
    func append(node: ListNode<T>) {
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
    func append(_ value: T) -> ListNode<T> {
        let node = ListNode(value)
        append(node: node)
        return node
    }
}

public extension LinkedList {
    func prepend(node: ListNode<T>) {
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
    func prepend(_ value: T) -> ListNode<T> {
        let node = ListNode(value)
        prepend(node: node)
        return node
    }
}

public extension LinkedList {
    func insert(node: ListNode<T>, after other: ListNode<T>) {
        assert(contains(other))

        if other === _last {
            other.append(node)
            _last = node.last
        } else {
            other.append(node)
        }
    }

    @discardableResult
    func insert(_ value: T, after other: ListNode<T>) -> ListNode<T> {
        let node = ListNode<T>(value)
        insert(node: node, after: other)
        return node
    }
}

public extension LinkedList {
    func insert(node: ListNode<T>, before other: ListNode<T>) {
        assert(contains(other))

        if other === _first {
            other.prepend(node)
            _first = node.first
        } else {
            other.prepend(node)
        }
    }

    @discardableResult
    func insert(_ value: T, before other: ListNode<T>) -> ListNode<T> {
        let node = ListNode<T>(value)
        insert(node: node, before: other)
        return node
    }
}

public extension LinkedList {
    func swap(_ node: ListNode<T>, with other: ListNode<T>) {
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

public extension LinkedList {
    func disconnect(by node: ListNode<T>) -> LinkedList<T> {
        assert(contains(node))

        let second = node.disconnect()

        _last = node

        return LinkedList<T>(first: second, last: second?.last)
    }
}

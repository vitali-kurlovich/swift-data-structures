//
//  Created by Vitali Kurlovich on 4.03.26.
//

public extension LinkedList {
    @discardableResult
    @inlinable func remove(_ node: ListNode<T>) -> ListNode<T> {
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
    @inlinable func dropFirst() -> ListNode<T>? {
        guard let first else {
            return nil
        }

        return remove(first)
    }

    @discardableResult
    @inlinable func dropLast() -> ListNode<T>? {
        guard let last else {
            return nil
        }

        return remove(last)
    }
}

public extension LinkedList {
    @inlinable func append(node: ListNode<T>) {
        guard node !== last else { return }

        if node === first {
            _first = node.next
        }

        node.remove()

        if let last = _last {
            last.setNext(node)
            _last = node

        } else {
            _first = node
            _last = node
        }

        assert(first !== nil)
        assert(last !== nil)

        assert(first?.prev == nil)
        assert(last?.next == nil)
    }

    @discardableResult
    @inlinable func append(_ value: T) -> ListNode<T> {
        let node = ListNode(value)
        append(node: node)
        return node
    }
}

public extension LinkedList {
    @inlinable func prepend(node: ListNode<T>) {
        guard node !== first else { return }

        if node === last {
            _last = node.prev
        }

        node.remove()

        if let first = _first {
            node.setNext(first)
            _first = node
        } else {
            _first = node
            _last = node
        }

        assert(first !== nil)
        assert(last !== nil)

        assert(first?.prev == nil)
        assert(last?.next == nil)
    }

    @discardableResult
    @inlinable func prepend(_ value: T) -> ListNode<T> {
        let node = ListNode(value)
        prepend(node: node)
        return node
    }
}

public extension LinkedList {
    @inlinable func insert(node: ListNode<T>, after other: ListNode<T>) {
        assert(contains(other))

        guard node !== other else { return }

        if other === _last {
            other.append(node)
            _last = node
        } else {
            other.append(node)
        }
    }

    @discardableResult
    @inlinable func insert(_ value: T, after other: ListNode<T>) -> ListNode<T> {
        let node = ListNode<T>(value)
        insert(node: node, after: other)
        return node
    }
}

public extension LinkedList {
    @inlinable func insert(node: ListNode<T>, before other: ListNode<T>) {
        assert(contains(other))

        guard node !== other else { return }

        if node === _last {
            _last = node.prev
        }

        other.prepend(node)

        if node.prev == nil {
            _first = node
        }

        if other.next == nil {
            _last = other
        }
    }

    @discardableResult
    @inlinable func insert(_ value: T, before other: ListNode<T>) -> ListNode<T> {
        let node = ListNode<T>(value)
        insert(node: node, before: other)
        return node
    }
}

public extension LinkedList {
    @inlinable func swap(_ node: ListNode<T>, with other: ListNode<T>) {
        assert(contains(node))
        assert(contains(other))

        node.swap(with: other)

        if node.prev == nil {
            _first = node
        }

        if node.next == nil {
            _last = node
        }

        if other.prev == nil {
            _first = other
        }

        if other.next == nil {
            _last = other
        }
    }
}

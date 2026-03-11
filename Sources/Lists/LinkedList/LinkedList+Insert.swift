//
//  Created by Vitali Kurlovich on 10.03.26.
//

public extension LinkedList {
    @inlinable func insert(node: ListNode<T>, after other: ListNode<T>) {
        assert(contains(other))

        guard node !== other else { return }

        if node === first {
            _first = node.next
        }

        other.append(node)

        if node.next == nil {
            _last = node
        }

        if other.prev == nil {
            _first = other
        }

        assert(first !== nil)
        assert(last !== nil)

        assert(first?.prev == nil)
        assert(last?.next == nil)

        assert(contains(other))
        assert(contains(node))
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

        if node === last {
            _last = node.prev
        }

        other.prepend(node)

        if node.prev == nil {
            _first = node
        }

        if other.next == nil {
            _last = other
        }

        assert(first != nil)
        assert(last != nil)

        assert(first?.prev == nil)
        assert(last?.next == nil)

        assert(contains(other))
        assert(contains(node))
    }

    @discardableResult
    @inlinable func insert(_ value: T, before other: ListNode<T>) -> ListNode<T> {
        let node = ListNode<T>(value)
        insert(node: node, before: other)
        return node
    }
}

public extension LinkedList {
    @inlinable func append(node: ListNode<T>) {
        if let last {
            insert(node: node, after: last)
        } else {
            _first = node
            _last = node
        }
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
        if let first {
            insert(node: node, before: first)
        } else {
            _first = node
            _last = node
        }
    }

    @discardableResult
    @inlinable func prepend(_ value: T) -> ListNode<T> {
        let node = ListNode(value)
        prepend(node: node)
        return node
    }
}

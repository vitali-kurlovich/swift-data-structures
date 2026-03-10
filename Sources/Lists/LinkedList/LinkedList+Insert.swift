//
//  Created by Vitali Kurlovich on 10.03.26.
//

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

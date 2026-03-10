//
//  Created by Vitali Kurlovich on 10.03.26.
//

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

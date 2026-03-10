//
//  Created by Vitali Kurlovich on 10.03.26.
//

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

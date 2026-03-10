//
//  Created by Vitali Kurlovich on 10.03.26.
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

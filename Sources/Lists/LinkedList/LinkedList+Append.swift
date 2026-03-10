//
//  Created by Vitali Kurlovich on 10.03.26.
//

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

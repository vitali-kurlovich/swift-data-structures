//
//  Created by Vitali Kurlovich on 3.03.26.
//

extension ListNode {
    @inlinable func append(_ node: ListNode<T>) {
        guard node !== self else { return }

        if next === node {
            assert(node.prev === self)
            return
        }

        node.remove()

        let next = next

        setNext(node)
        node.setNext(next)
    }

    @inlinable func prepend(_ node: ListNode<T>) {
        guard node !== self else { return }

        if prev === node {
            assert(node.next === self)
            return
        }

        node.remove()
        let prev = prev

        setPrev(node)
        node.setPrev(prev)
    }
}

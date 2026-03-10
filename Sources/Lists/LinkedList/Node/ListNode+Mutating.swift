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

        if node === prev {
            debugPrint(node)
        }

        node.remove()

        let next = self.next

        setNext(node)
        node.setNext(next)
    }

    @inlinable func prepend(_ node: ListNode<T>) {
        guard node !== self else { return }

        if prev === node {
            assert(node.next === self)
            return
        }

        let prev = self.prev

        node.remove()
        setPrev(node)
        node.setPrev(prev)
    }
}

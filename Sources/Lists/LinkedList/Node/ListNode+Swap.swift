//
//  Created by Vitali Kurlovich on 10.03.26.
//

extension ListNode {
    @inlinable func swap(with node: ListNode<T>) {
        guard self !== node else { return }

        if next === node {
            node._prev = _prev
            node._prev?._next = node

            _next = node._next
            _next?._prev = self

            node._next = self
            _prev = node

        } else if node.next === self {
            node.swap(with: self)
        } else {
            let dstNext = node.next
            let dstPrev = node.prev

            let srcNext = next
            let srcPrev = prev

            node._next = srcNext
            srcNext?._prev = node

            node._prev = srcPrev
            srcPrev?._next = node

            _next = dstNext
            dstNext?._prev = self

            _prev = dstPrev
            dstPrev?._next = self
        }
    }
}

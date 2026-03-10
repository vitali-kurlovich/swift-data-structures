//
//  Created by Vitali Kurlovich on 10.03.26.
//

extension ListNode {
    @inlinable func remove() {
        let prevNode = prev
        let nextNode = next

        prevNode?._next = nextNode

        nextNode?._prev = prevNode

        _prev = nil
        _next = nil
    }
}

//
//  Created by Vitali Kurlovich on 3.03.26.
//

extension ListNode {
    @inlinable func setNext(_ node: ListNode<T>?) {
        _next = node
        _next?._prev = self
    }

    @inlinable func setPrev(_ node: ListNode<T>?) {
        _prev = node
        _prev?._next = self
    }
}

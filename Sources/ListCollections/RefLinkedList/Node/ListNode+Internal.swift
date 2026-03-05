//
//  Created by Vitali Kurlovich on 3.03.26.
//

extension ListNode {
    func setNext(_ node: ListNode<T>?) {
        _next = node
        _next?._prev = self

        assert(ListNode.isCyclic(node: self) == false)
    }

    func setPrev(_ node: ListNode<T>?) {
        _prev = node
        _prev?._next = self

        assert(ListNode.isCyclic(node: self) == false)
    }
}

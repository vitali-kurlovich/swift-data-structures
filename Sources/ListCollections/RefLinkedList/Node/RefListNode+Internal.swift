//
//  Created by Vitali Kurlovich on 3.03.26.
//

extension RefListNode {
    func setNext(_ node: RefListNode<T>?) {
        _next = node
        _next?._prev = self

        assert(RefListNode.isCyclic(node: self) == false)
    }

    func setPrev(_ node: RefListNode<T>?) {
        _prev = node
        _prev?._next = self

        assert(RefListNode.isCyclic(node: self) == false)
    }
}

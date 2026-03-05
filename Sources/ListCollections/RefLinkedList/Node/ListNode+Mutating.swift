//
//  Created by Vitali Kurlovich on 3.03.26.
//

extension ListNode {
    func remove() {
        defer {
            self._prev = nil
            self._next = nil

            assert(ListNode.isCyclic(node: self) == false)
        }

        let prevNode = prev
        let nextNode = next

        prevNode?._next = nextNode
        nextNode?._prev = prevNode
    }
}

extension ListNode {
    func append(_ node: ListNode<T>) {
        defer {
            assert(ListNode.isCyclic(node: self) == false)
        }
        assert(contains(node) == false)

        let first = node.first
        let last = node.last

        let left = self
        let right = next

        left._next = first
        first._prev = left

        last._next = right
        right?._prev = last
    }

    func prepend(_ node: ListNode<T>) {
        defer {
            assert(ListNode.isCyclic(node: self) == false)
        }

        assert(contains(node) == false)

        let first = node.first
        let last = node.last

        let left = prev
        let right = self

        left?._next = first
        first._prev = left

        last._next = right
        right._prev = last
    }
}

extension ListNode {
    func swap(with node: ListNode<T>) {
        defer {
            assert(ListNode.isCyclic(node: self) == false)
        }

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

extension ListNode {
    func disconnect() -> ListNode<T>? {
        guard let next = next else {
            return nil
        }

        _next = nil
        next._prev = nil

        return next
    }
}

//
//  Created by Vitali Kurlovich on 4.03.26.
//

public extension ListNode {
    func copy() -> (first: ListNode<T>, copy: ListNode<T>, last: ListNode<T>) {
        let root = ListNode(value)
        var last = root

        var right = self

        while let node = right.next {
            right = node

            let copy = ListNode(node.value)

            last.append(copy)
            last = copy
        }

        var first = root

        var left = self

        while let node = left.prev {
            left = node

            let copy = ListNode(node.value)

            first.prepend(copy)
            first = copy
        }

        return (first: first, copy: root, last: last)
    }
}

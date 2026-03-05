//
//  Created by Vitali Kurlovich on 4.03.26.
//

public extension ListNode {
    func copy() -> ListNode<T> {
        let root = ListNode(value)
        var parent = root

        var current = prev
        while let node = current {
            current = current?.prev
            let new_node = ListNode(node.value)
            parent.prepend(new_node)
            parent = new_node
        }

        current = next
        parent = root

        while let node = current {
            current = current?.next
            let new_node = ListNode(node.value)
            parent.append(new_node)
            parent = new_node
        }

        return root
    }
}

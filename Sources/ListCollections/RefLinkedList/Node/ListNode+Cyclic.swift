//
//  Created by Vitali Kurlovich on 2.03.26.
//

extension ListNode {
    static func isCyclic(node: ListNode<T>) -> Bool {
        var current = node

        while current.next != nil {
            if current.next === node {
                return true
            }

            current = current.next!
        }

        current = node

        while current.prev != nil {
            if current.prev === node {
                return true
            }

            current = current.prev!
        }

        return false
    }
}

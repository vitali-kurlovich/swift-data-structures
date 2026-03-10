//
//  Created by Vitali Kurlovich on 10.03.26.
//

public extension LinkedList {
    @discardableResult
    @inlinable func dropFirst() -> ListNode<T>? {
        guard let first else {
            return nil
        }

        return remove(first)
    }

    @discardableResult
    @inlinable func dropLast() -> ListNode<T>? {
        guard let last else {
            return nil
        }

        return remove(last)
    }
}

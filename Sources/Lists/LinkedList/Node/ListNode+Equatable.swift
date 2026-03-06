//
//  Created by Vitali Kurlovich on 4.03.26.
//

extension ListNode: Equatable where T: Equatable {
    public static func == (lhs: ListNode<T>, rhs: ListNode<T>) -> Bool {
        if lhs === rhs {
            return true
        }

        if lhs.value != rhs.value {
            return false
        }

        var lcurrent = lhs
        var rcurrent = rhs

        while let lp = lcurrent.prev {
            lcurrent = lp
            guard let rp = rcurrent.prev else {
                return false
            }

            guard lp === rp || lp.value == rp.value else {
                return false
            }

            rcurrent = rp
        }

        guard rcurrent.prev == nil else {
            return false
        }

        lcurrent = lhs
        rcurrent = rhs

        while let ln = lcurrent.next {
            lcurrent = ln
            guard let rn = rcurrent.next else {
                return false
            }

            guard ln === rn || ln.value == rn.value else {
                return false
            }

            rcurrent = rn
        }

        guard rcurrent.next == nil else {
            return false
        }

        return true
    }
}

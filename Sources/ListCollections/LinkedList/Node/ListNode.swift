//
//  Created by Vitali Kurlovich on 2.03.26.
//

public final class ListNode<T> {
    public var value: T
    var _prev: ListNode<T>?
    var _next: ListNode<T>?

    public init(_ value: T) {
        self.value = value
    }
}

public extension ListNode {
    var next: ListNode<T>? {
        _next
    }

    var prev: ListNode<T>? {
        _prev
    }
}

public extension ListNode {
    var count: Int {
        var count = 1

        var current = self

        while let next = current.next {
            current = next
            count += 1
        }

        current = self

        while let prev = current.prev {
            current = prev
            count += 1
        }

        return count
    }
}

public extension ListNode {
    var first: ListNode<T> {
        var current = self

        while let prev = current.prev {
            current = prev
        }

        return current
    }

    var isFirst: Bool {
        prev == nil
    }
}

public extension ListNode {
    var last: ListNode<T> {
        var current = self

        while let next = current.next {
            current = next
        }

        return current
    }

    var isLast: Bool {
        next == nil
    }
}

public extension ListNode {
    func contains(_ node: ListNode<T>) -> Bool {
        var current = self

        if current === node {
            return true
        }

        while let next = current.next {
            current = next
            if current === node {
                return true
            }
        }

        current = self

        while let prev = current.prev {
            current = prev
            if current === node {
                return true
            }
        }

        return false
    }
}

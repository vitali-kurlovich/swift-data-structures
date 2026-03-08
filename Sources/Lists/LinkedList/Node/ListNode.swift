//
//  Created by Vitali Kurlovich on 2.03.26.
//

public final class ListNode<T> {
    public var value: T

    @usableFromInline
    var _next: ListNode<T>? = nil

    @usableFromInline
    unowned var _prev: ListNode<T>? = nil

    deinit {
        _next?._prev = nil
    }

    @inlinable init(_ value: T) {
        self.value = value
    }
}

public extension ListNode {
    @inlinable var next: ListNode<T>? {
        _next
    }

    @inlinable var prev: ListNode<T>? {
        _prev
    }
}

public extension ListNode {
    @inlinable var first: ListNode<T> {
        var current = self

        while let prev = current.prev {
            current = prev
        }

        return current
    }

    @inlinable var isFirst: Bool {
        prev == nil
    }
}

public extension ListNode {
    @inlinable var last: ListNode<T> {
        var current = self

        while let next = current.next {
            current = next
        }

        return current
    }

    @inlinable var isLast: Bool {
        next == nil
    }
}

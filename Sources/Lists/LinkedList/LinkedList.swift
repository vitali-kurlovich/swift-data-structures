//
//  Created by Vitali Kurlovich on 2.03.26.
//

public final class LinkedList<T> {
    @usableFromInline
    var _first: ListNode<T>?

    @usableFromInline
    var _last: ListNode<T>?

    @inlinable init(first: ListNode<T>? = nil, last: ListNode<T>? = nil) {
        _first = first
        _last = last
    }
}

public extension LinkedList {
    convenience init() {
        self.init(first: nil, last: nil)
    }

    convenience init(_ value: T) {
        let node = ListNode(value)
        self.init(first: node, last: node)
    }
}

public extension LinkedList {
    @inlinable var first: ListNode<T>? {
        _first
    }

    @inlinable var last: ListNode<T>? {
        _last
    }
}

public extension LinkedList {
    @inlinable var isEmpty: Bool {
        assert((first == nil && last == nil) || (first != nil && last != nil))
        return first == nil
    }
}

public extension LinkedList {
    @inlinable var count: Int {
        first?.count ?? 0
    }
}

public extension LinkedList {
    @inlinable func contains(_ node: ListNode<T>) -> Bool {
        first?.contains(node) ?? false
    }
}

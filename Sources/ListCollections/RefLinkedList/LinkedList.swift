//
//  Created by Vitali Kurlovich on 2.03.26.
//

public final class LinkedList<T> {
    var _first: ListNode<T>?
    var _last: ListNode<T>?

    deinit {
        removeAll()
    }

    init(first: ListNode<T>? = nil, last: ListNode<T>? = nil) {
        _first = first
        _last = last
    }
}

public extension LinkedList {
    convenience init() {
        self.init(first: nil, last: nil)
    }
}

public extension LinkedList {
    var first: ListNode<T>? {
        _first
    }

    var last: ListNode<T>? {
        _last
    }
}

public extension LinkedList {
    var isEmpty: Bool {
        assert((first == nil && last == nil) || (first != nil && last != nil))
        return first == nil
    }
}

public extension LinkedList {
    var count: Int {
        first?.count ?? 0
    }
}

public extension LinkedList {
    func contains(_ node: ListNode<T>) -> Bool {
        first?.contains(node) ?? false
    }
}

public extension LinkedList {
    func copy() -> LinkedList<T> {
        let first = first?.copy()
        return LinkedList<T>(first: first, last: first?.last)
    }
}

extension LinkedList: Equatable where T: Equatable {
    public static func == (lhs: LinkedList<T>, rhs: LinkedList<T>) -> Bool {
        return lhs === rhs || lhs.first == rhs.first
    }
}

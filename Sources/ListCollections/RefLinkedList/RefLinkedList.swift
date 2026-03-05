//
//  Created by Vitali Kurlovich on 2.03.26.
//

public final class RefLinkedList<T> {
    var _first: RefListNode<T>?
    var _last: RefListNode<T>?

    deinit {
        removeAll()
    }

    init(first: RefListNode<T>? = nil, last: RefListNode<T>? = nil) {
        _first = first
        _last = last
    }
}

public extension RefLinkedList {
    convenience init() {
        self.init(first: nil, last: nil)
    }
}

public extension RefLinkedList {
    var first: RefListNode<T>? {
        _first
    }

    var last: RefListNode<T>? {
        _last
    }
}

public extension RefLinkedList {
    var isEmpty: Bool {
        assert((first == nil && last == nil) || (first != nil && last != nil))
        return first == nil
    }
}

public extension RefLinkedList {
    var count: Int {
        first?.count ?? 0
    }
}

public extension RefLinkedList {
    func contains(_ node: RefListNode<T>) -> Bool {
        first?.contains(node) ?? false
    }
}

public extension RefLinkedList {
    func copy() -> RefLinkedList<T> {
        let first = first?.copy()
        return RefLinkedList<T>(first: first, last: first?.last)
    }
}

extension RefLinkedList: Equatable where T: Equatable {
    public static func == (lhs: RefLinkedList<T>, rhs: RefLinkedList<T>) -> Bool {
        return lhs === rhs || lhs.first == rhs.first
    }
}

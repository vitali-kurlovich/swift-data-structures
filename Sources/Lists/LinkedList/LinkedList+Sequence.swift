//
//  Created by Vitali Kurlovich on 7.03.26.
//

extension LinkedList: Sequence {
    public typealias Iterator = ListNodeIterator<T>

    public func makeIterator() -> ListNodeIterator<T> {
        Iterator(first)
    }
}

public extension LinkedList {
    convenience init<S>(_ s: S) where S: Sequence, S.Element == T {
        self.init()
        for value in s {
            append(value)
        }
    }
}

public struct ListNodeIterator<T>: IteratorProtocol {
    public typealias Element = T

    @usableFromInline
    var node: ListNode<T>?

    @inlinable public init(_ node: ListNode<T>?) {
        self.node = node
    }

    @inlinable public mutating func next() -> T? {
        defer {
            node = node?.next
        }
        return node?.value
    }
}

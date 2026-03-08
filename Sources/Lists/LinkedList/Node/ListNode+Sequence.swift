//
//  Created by Vitali Kurlovich on 6.03.26.
//

extension ListNode: Sequence {
    public typealias Iterator = ListNodeIterator<T>

    public func makeIterator() -> ListNodeIterator<T> {
        Iterator(self)
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

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

    var node: ListNode<T>?

    public init(_ node: ListNode<T>?) {
        self.node = node
    }

    public mutating func next() -> T? {
        defer {
            node = node?.next
        }
        return node?.value
    }
}

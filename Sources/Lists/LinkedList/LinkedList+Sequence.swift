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

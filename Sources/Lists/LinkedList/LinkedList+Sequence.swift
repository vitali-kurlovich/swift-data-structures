//
//  Created by Vitali Kurlovich on 7.03.26.
//

extension LinkedList: Sequence {
    public typealias Iterator = ListNodeIterator<T>

    public func makeIterator() -> ListNodeIterator<T> {
        Iterator(first)
    }
}

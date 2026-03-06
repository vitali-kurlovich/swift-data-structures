//
//  Created by Vitali Kurlovich on 6.03.26.
//

public extension LinkedList {
    func copy() -> LinkedList<T> {
        let first = first?.copy()
        return LinkedList<T>(first: first, last: first?.last)
    }
}

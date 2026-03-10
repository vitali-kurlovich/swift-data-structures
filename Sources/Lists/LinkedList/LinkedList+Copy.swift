//
//  Created by Vitali Kurlovich on 6.03.26.
//

public extension LinkedList {
    func copy() -> LinkedList<T> {
        guard let copy = first?.copy() else {
            return LinkedList<T>()
        }
        return LinkedList<T>(first: copy.first, last: copy.last)
    }
}

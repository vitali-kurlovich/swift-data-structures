//
//  Created by Vitali Kurlovich on 6.03.26.
//

extension LinkedList: Equatable where T: Equatable {
    public static func == (lhs: LinkedList<T>, rhs: LinkedList<T>) -> Bool {
        return lhs === rhs || lhs.first == rhs.first
    }
}

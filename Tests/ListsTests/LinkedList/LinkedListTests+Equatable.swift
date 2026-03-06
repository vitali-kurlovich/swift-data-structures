//
//  Created by Vitali Kurlovich on 5.03.26.
//

import Lists
import Testing

extension LinkedListTests {
    @Test("Equatable")
    func equal() throws {
        let left = LinkedList<Int>()
        let right = LinkedList<Int>()

        #expect(left == right)
        #expect(left !== right)

        left.append(5)
        #expect(left != right)

        right.append(5)
        #expect(left == right)

        left.prepend(6)
        #expect(left != right)

        right.prepend(6)

        #expect(left == right)
    }
}

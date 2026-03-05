//
//  Created by Vitali Kurlovich on 5.03.26.
//

@testable import ListCollections
import Testing

extension LinkedListTests {
    @Test("Copy")
    func copy() throws {
        let list = LinkedList<Int>()

        #expect(list.copy() == list)
        #expect(list.copy() !== list)

        list.append(4)
        list.prepend(5)

        list.append(6)
        list.prepend(7)

        #expect(list.copy() == list)
        #expect(list.copy() !== list)
    }
}

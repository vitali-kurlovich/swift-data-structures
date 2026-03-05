//
//  Created by Vitali Kurlovich on 5.03.26.
//

@testable import ListCollections
import Testing

extension RefLinkedListTests {
    @Test("Equatable")
    func equal() throws {
        let left = RefLinkedList<Int>()
        let right = RefLinkedList<Int>()

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

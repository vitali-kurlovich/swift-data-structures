//
//  Created by Vitali Kurlovich on 4.03.26.
//

@testable import ListCollections
import Testing

extension RefListNodeTests {
    @Test("Copy")
    func copy() throws {
        let node0 = RefListNode(0)
        #expect(node0.copy() !== node0)
        #expect(node0.copy().value == node0.value)

        let nodeR = RefListNode(1)
        let nodeL = RefListNode(2)

        node0.append(nodeR)
        node0.prepend(nodeL)

        let copy = node0.copy()

        #expect(node0 !== copy)
        #expect(node0.value == copy.value)

        #expect(node0.prev !== copy.prev)
        #expect(node0.prev!.value == copy.prev!.value)

        #expect(node0.next !== copy.next)
        #expect(node0.next!.value == copy.next!.value)
    }
}

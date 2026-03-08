//
//  Created by Vitali Kurlovich on 4.03.26.
//

@testable import Lists
import Testing

extension ListNodeTests {
    @Test("Copy", .disabled())
    func copy() throws {
        let node0 = ListNode(0)
        #expect(node0.copy() !== node0)
        #expect(node0.copy().value == node0.value)

        let nodeR = ListNode(1)
        let nodeL = ListNode(2)

        node0.append(nodeR)
        node0.prepend(nodeL)

        let copy = node0.copy()

        #expect(node0 !== copy)
        #expect(node0.value == copy.value)

        #expect(node0.prev !== copy.prev)
        #expect(node0.prev!.value == copy.prev!.value)

        #expect(node0.next !== copy.next)
        #expect(node0.next!.value == copy.next!.value)

        let first = node0.first
        let firstCopy = copy.first

        #expect(first !== firstCopy)
        #expect(first == firstCopy)

        // #expect(<#T##condition: Bool##Bool#>)
    }
}

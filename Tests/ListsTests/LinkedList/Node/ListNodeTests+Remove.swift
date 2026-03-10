//
//  Created by Vitali Kurlovich on 10.03.26.
//

@testable import Lists
import Testing

extension ListNodeTests {
    @Test("Remove")
    func remove() throws {
        let node0 = ListNode(0)
        // [node0]
        #expect(node0.prev == nil)
        #expect(node0.next == nil)

        // [node0]
        node0.remove()
        // [node0]
        #expect(node0.prev == nil)
        #expect(node0.next == nil)

        let node1 = ListNode(0)

        #expect(node1.prev == nil)
        #expect(node1.next == nil)

        // [node0]
        node0.setNext(node1)
        // [node0 <-> node1]
        #expect(node0.prev == nil)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next == nil)

        // [node0 <-> node1]
        node0.remove()
        // [node0] || [node1]

        #expect(node0.prev == nil)
        #expect(node0.next == nil)

        #expect(node1.prev == nil)
        #expect(node1.next == nil)

        // [node0]
        node0.setNext(node1)
        // [node0 <-> node1]

        #expect(node0.prev == nil)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next == nil)

        // [node0 <-> node1]
        node1.remove()
        // [node0] || [node1]

        #expect(node0.prev == nil)
        #expect(node0.next == nil)

        #expect(node1.prev == nil)
        #expect(node1.next == nil)

        // [node0] || [node1]
        let node2 = ListNode(2)

        node0.setNext(node1)
        node1.setNext(node2)

        // [node0 <-> node1 <-> node2]
        #expect(node0.prev == nil)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next === node2)

        #expect(node2.prev === node1)
        #expect(node2.next == nil)

        // [node0 <-> node1 <-> node2]
        node0.remove()
        // [node0] || [node1 <-> node2]

        #expect(node0.prev == nil)
        #expect(node0.next == nil)

        #expect(node1.prev == nil)
        #expect(node1.next === node2)

        #expect(node2.prev === node1)
        #expect(node2.next == nil)

        // [node0] || [node1 <-> node2]
        node0.setNext(node1)
        // [node0 <-> node1 <-> node2]

        #expect(node0.prev == nil)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next === node2)

        #expect(node2.prev === node1)
        #expect(node2.next == nil)

        // [node0 <-> node1 <-> node2]
        node1.remove()
        // [node1] [node0 <-> node2]

        #expect(node1.prev == nil)
        #expect(node1.next == nil)

        #expect(node0.prev == nil)
        #expect(node0.next === node2)

        #expect(node2.prev === node0)
        #expect(node2.next == nil)

        // [node1] [node0 <-> node2]
        node0.remove()
        // [node0] [node1] [node2]

        #expect(node0.prev == nil)
        #expect(node0.next == nil)

        #expect(node1.prev == nil)
        #expect(node1.next == nil)

        #expect(node2.prev == nil)
        #expect(node2.next == nil)

        // [node0] [node1] [node2]
        node0.setNext(node1)
        node1.setNext(node2)
        // [node0 <-> node1 <-> node2]
        #expect(node0.prev == nil)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next === node2)

        #expect(node2.prev === node1)
        #expect(node2.next == nil)

        // [node0 <-> node1 <-> node2]
        node2.remove()
        // [node0 <-> node1] [node2]

        #expect(node0.prev == nil)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next == nil)

        #expect(node2.prev == nil)
        #expect(node2.next == nil)
    }
}

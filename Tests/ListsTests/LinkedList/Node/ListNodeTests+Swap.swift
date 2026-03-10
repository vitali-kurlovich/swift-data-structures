//
//  Created by Vitali Kurlovich on 10.03.26.
//

@testable import Lists
import Testing

extension ListNodeTests {
    @Test("Swap")
    func swap() throws {
        let node0 = ListNode(0)
        // [node0]
        #expect(node0.prev == nil)
        #expect(node0.next == nil)

        node0.swap(with: node0)

        // [node0]
        #expect(node0.prev == nil)
        #expect(node0.next == nil)

        let node1 = ListNode(1)
        node0.append(node1)

        // [node0 <-> node1]
        #expect(node0.prev == nil)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next == nil)

        // [node0 <-> node1]
        node0.swap(with: node0)
        // [node0 <-> node1]
        #expect(node0.prev == nil)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next == nil)

        // [node0 <-> node1]
        node1.swap(with: node1)
        // [node0 <-> node1]

        #expect(node0.prev == nil)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next == nil)

        // [node0 <-> node1]
        node0.swap(with: node1)
        // [node1 <-> node0]

        #expect(node1.prev == nil)
        #expect(node1.next === node0)

        #expect(node0.prev === node1)
        #expect(node0.next == nil)

        // [node1 <-> node0]
        let node2 = ListNode(2)
        node1.prepend(node2)
        // [node2 <-> node1 <-> node0]

        #expect(node2.prev == nil)
        #expect(node2.next === node1)

        #expect(node1.prev === node2)
        #expect(node1.next === node0)

        #expect(node0.prev === node1)
        #expect(node0.next == nil)

        // [node2 <-> node1 <-> node0]
        node2.swap(with: node2)
        // [node2 <-> node1 <-> node0]

        #expect(node2.prev == nil)
        #expect(node2.next === node1)

        #expect(node1.prev === node2)
        #expect(node1.next === node0)

        #expect(node0.prev === node1)
        #expect(node0.next == nil)

        // [node2 <-> node1 <-> node0]
        node1.swap(with: node1)
        // [node2 <-> node1 <-> node0]

        #expect(node2.prev == nil)
        #expect(node2.next === node1)

        #expect(node1.prev === node2)
        #expect(node1.next === node0)

        #expect(node0.prev === node1)
        #expect(node0.next == nil)

        // [node2 <-> node1 <-> node0]
        node0.swap(with: node0)
        // [node2 <-> node1 <-> node0]

        #expect(node2.prev == nil)
        #expect(node2.next === node1)

        #expect(node1.prev === node2)
        #expect(node1.next === node0)

        #expect(node0.prev === node1)
        #expect(node0.next == nil)

        // [node2 <-> node1 <-> node0]
        node2.swap(with: node1)
        // [node1 <-> node2 <-> node0]

        #expect(node1.prev == nil)
        #expect(node1.next === node2)

        #expect(node2.prev === node1)
        #expect(node2.next === node0)

        #expect(node0.prev === node2)
        #expect(node0.next == nil)

        // [node1 <-> node2 <-> node0]
        node2.swap(with: node1)
        // [node2 <-> node1 <-> node0]

        #expect(node2.prev == nil)
        #expect(node2.next === node1)

        #expect(node1.prev === node2)
        #expect(node1.next === node0)

        #expect(node0.prev === node1)
        #expect(node0.next == nil)

        // [node2 <-> node1 <-> node0]
        node1.swap(with: node0)
        // [node2 <-> node0 <-> node1]

        #expect(node2.prev == nil)
        #expect(node2.next === node0)

        #expect(node0.prev === node2)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next == nil)

        // [node2 <-> node0 <-> node1]
        node1.swap(with: node0)
        // [node2 <-> node1 <-> node0]
        #expect(node2.prev == nil)
        #expect(node2.next === node1)

        #expect(node1.prev === node2)
        #expect(node1.next === node0)

        #expect(node0.prev === node1)
        #expect(node0.next == nil)

        // [node2 <-> node1 <-> node0]
        let first = ListNode(100)
        let last = ListNode(200)

        node2.prepend(first)
        node0.append(last)
        // [first <-> node2 <-> node1 <-> node0 <-> last]

        #expect(first.prev == nil)
        #expect(first.next === node2)

        #expect(node2.prev === first)
        #expect(node2.next === node1)

        #expect(node1.prev === node2)
        #expect(node1.next === node0)

        #expect(node0.prev === node1)
        #expect(node0.next === last)

        #expect(last.prev === node0)
        #expect(last.next == nil)

        // [first <-> node2 <-> node1 <-> node0 <-> last]
        node0.swap(with: node2)
        // [first <-> node0 <-> node1 <-> node2 <-> last]

        #expect(first.prev == nil)
        #expect(first.next === node0)

        #expect(node0.prev === first)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next === node2)

        #expect(node2.prev === node1)
        #expect(node2.next === last)

        #expect(last.prev === node2)
        #expect(last.next == nil)

        // [first <-> node0 <-> node1 <-> node2 <-> last]
        node0.swap(with: node2)
        // [first <-> node2 <-> node1 <-> node0 <-> last]
        #expect(first.prev == nil)
        #expect(first.next === node2)

        #expect(node2.prev === first)
        #expect(node2.next === node1)

        #expect(node1.prev === node2)
        #expect(node1.next === node0)

        #expect(node0.prev === node1)
        #expect(node0.next === last)

        #expect(last.prev === node0)
        #expect(last.next == nil)
    }
}

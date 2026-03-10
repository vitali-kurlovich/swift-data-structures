//
//  Created by Vitali Kurlovich on 3.03.26.
//

@testable import Lists
import Testing

extension LinkedListTests {
    @Test("Append")
    func append() throws {
        let list = LinkedList<Int>()
        // []

        #expect(list.isEmpty)
        #expect(list.count == 0)
        #expect(list.first == nil)
        #expect(list.last == nil)

        let node0 = list.append(42)
        // [node0]

        #expect(list.count == 1)
        #expect(list.first === node0)
        #expect(list.last === node0)

        #expect(node0.prev == nil)
        #expect(node0.next == nil)

        list.append(node: node0)

        #expect(list.count == 1)
        #expect(list.first === node0)
        #expect(list.last === node0)

        #expect(node0.prev == nil)
        #expect(node0.next == nil)

        let node1 = list.append(54)
        // [node0 <-> node1]

        #expect(list.count == 2)
        #expect(list.first === node0)
        #expect(list.last === node1)

        #expect(node0.prev == nil)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next == nil)

        // [node0 <-> node1]
        list.append(node: node1)
        // [node0 <-> node1]
        #expect(list.count == 2)
        #expect(list.first === node0)
        #expect(list.last === node1)

        #expect(node0.prev == nil)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next == nil)

        list.append(node: node1)
        // [node0 <-> node1]

        #expect(list.count == 2)
        #expect(list.first === node0)
        #expect(list.last === node1)

        #expect(node0.prev == nil)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next == nil)

        // [node0 <-> node1]
        list.append(node: node0)
        // [node1 <-> node0]
        #expect(list.count == 2)
        #expect(list.first === node1)
        #expect(list.last === node0)

        #expect(node1.prev == nil)
        #expect(node1.next === node0)

        #expect(node0.prev === node1)
        #expect(node0.next == nil)

        // [node1 <-> node0]
        list.append(node: node1)
        // [node0 <-> node1]

        #expect(list.count == 2)
        #expect(list.first === node0)
        #expect(list.last === node1)

        #expect(node0.prev == nil)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next == nil)

        // [node0 <-> node1]
        let node2 = list.append(3)
        // [node0 <-> node1 <-> node2]

        #expect(list.count == 3)
        #expect(list.first === node0)
        #expect(list.last === node2)

        #expect(node0.prev == nil)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next === node2)

        #expect(node2.prev === node1)
        #expect(node2.next == nil)

        // [node0 <-> node1 <-> node2]
        list.append(node: node1)
        // [node0 <-> node2 <-> node1]

        #expect(list.count == 3)
        #expect(list.first === node0)
        #expect(list.last === node1)

        #expect(node0.prev == nil)
        #expect(node0.next === node2)

        #expect(node2.prev === node0)
        #expect(node2.next === node1)

        #expect(node1.prev === node2)
        #expect(node1.next == nil)

        // [node0 <-> node2 <-> node1]
        list.append(node: node0)
        // [node2 <-> node1 <-> node0]

        #expect(list.count == 3)
        #expect(list.first === node2)
        #expect(list.last === node0)

        #expect(node2.prev == nil)
        #expect(node2.next === node1)

        #expect(node1.prev === node2)
        #expect(node1.next === node0)

        #expect(node0.prev === node1)
        #expect(node0.next == nil)

        let node3 = ListNode(61)
        let node4 = ListNode(62)
        let node5 = ListNode(63)
        let node6 = ListNode(64)

        node3.setNext(node4)
        node4.setNext(node5)
        node5.setNext(node6)

        // [node3 <-> node4 <-> node5 <-> node6]
        #expect(node3.prev == nil)
        #expect(node3.next === node4)

        #expect(node4.prev === node3)
        #expect(node4.next === node5)

        #expect(node5.prev === node4)
        #expect(node5.next === node6)

        #expect(node6.prev === node5)
        #expect(node6.next == nil)

        // [node2 <-> node1 <-> node0] || [node3 <-> node4 <-> node5 <-> node6]
        list.append(node: node3)
        // [node2 <-> node1 <-> node0 <-> node3] || [node4 <-> node5 <-> node6]

        //  [node4 <-> node5 <-> node6]

        #expect(node4.prev == nil)
        #expect(node4.next === node5)

        #expect(node5.prev === node4)
        #expect(node5.next === node6)

        #expect(node6.prev === node5)
        #expect(node6.next == nil)

        // [node2 <-> node1 <-> node0 <-> node3]

        #expect(list.count == 4)
        #expect(list.first === node2)
        #expect(list.last === node3)

        #expect(node2.prev == nil)
        #expect(node2.next === node1)

        #expect(node1.prev === node2)
        #expect(node1.next === node0)

        #expect(node0.prev === node1)
        #expect(node0.next === node3)

        #expect(node3.prev === node0)
        #expect(node3.next == nil)
    }
}

extension LinkedListTests {
    @Test("Prepend")
    func prepend() throws {
        let list = LinkedList<Int>()
        // []

        #expect(list.isEmpty)
        #expect(list.count == 0)
        #expect(list.first == nil)
        #expect(list.last == nil)

        let node0 = list.prepend(0)
        // [node0]

        #expect(list.count == 1)
        #expect(list.first === node0)
        #expect(list.last === node0)

        #expect(node0.prev == nil)
        #expect(node0.next == nil)

        // [node0]
        list.prepend(node: node0)
        // [node0]

        #expect(list.count == 1)
        #expect(list.first === node0)
        #expect(list.last === node0)

        #expect(node0.prev == nil)
        #expect(node0.next == nil)

        let node1 = list.prepend(1)
        // [ node1 <-> node0 ]

        #expect(list.count == 2)
        #expect(list.first === node1)
        #expect(list.last === node0)

        #expect(node1.prev == nil)
        #expect(node1.next === node0)

        #expect(node0.prev == node1)
        #expect(node0.next == nil)

        // [ node1 <-> node0 ]
        list.prepend(node: node1)
        // [ node1 <-> node0 ]

        #expect(list.count == 2)
        #expect(list.first === node1)
        #expect(list.last === node0)

        #expect(node1.prev == nil)
        #expect(node1.next === node0)

        #expect(node0.prev == node1)
        #expect(node0.next == nil)

        // [ node1 <-> node0]
        list.prepend(node: node0)
        // [ node0 <-> node1]

        #expect(list.count == 2)
        #expect(list.first === node0)
        #expect(list.last === node1)

        #expect(node0.prev == nil)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next == nil)

        // [ node0 <-> node1]
        let node2 = list.prepend(2)
        // [node2 <-> node0 <-> node1]

        #expect(list.count == 3)
        #expect(list.first === node2)
        #expect(list.last === node1)

        #expect(node2.prev == nil)
        #expect(node2.next === node0)

        #expect(node0.prev === node2)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next == nil)

        // [node2 <-> node0 <-> node1]
        list.prepend(node: node1)
        // [node1 <-> node2 <-> node0]

        #expect(list.count == 3)
        #expect(list.first === node1)
        #expect(list.last === node0)

        #expect(node1.prev == nil)
        #expect(node1.next === node2)

        #expect(node2.prev === node1)
        #expect(node2.next === node0)

        #expect(node0.prev === node2)
        #expect(node0.next == nil)

        // [node1 <-> node2 <-> node0]
        list.prepend(node: node2)
        // [node2 <-> node1 <-> node0]

        #expect(list.count == 3)
        #expect(list.first === node2)
        #expect(list.last === node0)

        #expect(node2.prev == nil)
        #expect(node2.next === node1)

        #expect(node1.prev === node2)
        #expect(node1.next === node0)

        #expect(node0.prev === node1)
        #expect(node0.next == nil)

        let node3 = ListNode(61)
        let node4 = ListNode(62)
        let node5 = ListNode(63)
        let node6 = ListNode(64)

        node3.setNext(node4)
        node4.setNext(node5)
        node5.setNext(node6)

        // [node3 <-> node4 <-> node5 <-> node6]
        #expect(node3.prev == nil)
        #expect(node3.next === node4)

        #expect(node4.prev === node3)
        #expect(node4.next === node5)

        #expect(node5.prev === node4)
        #expect(node5.next === node6)

        #expect(node6.prev === node5)
        #expect(node6.next == nil)

        // [node2 <-> node1 <-> node0] || [node3 <-> node4 <-> node5 <-> node6]
        list.prepend(node: node3)
        // [node3 <-> node2 <-> node1 <-> node0] || [node4 <-> node5 <-> node6]

        #expect(node4.prev == nil)
        #expect(node4.next === node5)

        #expect(node5.prev === node4)
        #expect(node5.next === node6)

        #expect(node6.prev === node5)
        #expect(node6.next == nil)

        #expect(list.count == 4)
        #expect(list.first === node3)
        #expect(list.last === node0)

        #expect(node3.prev == nil)
        #expect(node3.next === node2)

        #expect(node2.prev === node3)
        #expect(node2.next === node1)

        #expect(node1.prev === node2)
        #expect(node1.next === node0)

        #expect(node0.prev === node1)
        #expect(node0.next == nil)

        // [node3 <-> node2 <-> node1 <-> node0] || [node4 <-> node5 <-> node6]
        list.prepend(node: node5)
        // [node5 <-> node3 <-> node2 <-> node1 <-> node0] || [node4 <-> node6]

        #expect(node4.prev == nil)
        #expect(node4.next === node6)

        #expect(node6.prev === node4)
        #expect(node6.next == nil)

        #expect(list.count == 5)
        #expect(list.first === node5)
        #expect(list.last === node0)

        #expect(node5.prev == nil)
        #expect(node5.next === node3)

        #expect(node3.prev === node5)
        #expect(node3.next === node2)

        #expect(node2.prev === node3)
        #expect(node2.next === node1)

        #expect(node1.prev === node2)
        #expect(node1.next === node0)

        #expect(node0.prev === node1)
        #expect(node0.next == nil)
    }
}

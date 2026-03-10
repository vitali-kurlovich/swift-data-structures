//
//  Created by Vitali Kurlovich on 9.03.26.
//

@testable import Lists
import Testing

extension LinkedListTests {
    @Test("Insert After")
    func insertAfter() throws {
        let list = LinkedList<Int>()
        // []
        let node0 = list.append(0)
        // [node0]

        #expect(list.first === node0)
        #expect(list.last === node0)

        #expect(node0.prev === nil)
        #expect(node0.next === nil)

        let node1 = list.insert(1, after: node0)
        // [node0 <-> node1]

        #expect(list.first === node0)
        #expect(list.last === node1)

        #expect(node0.prev === nil)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next === nil)

        let node2 = list.insert(2, after: node0)
        // [node0 <-> node2 <-> node1]

        #expect(list.first === node0)
        #expect(list.last === node1)

        #expect(node0.prev === nil)
        #expect(node0.next === node2)

        #expect(node2.prev === node0)
        #expect(node2.next === node1)

        #expect(node1.prev === node2)
        #expect(node1.next === nil)

        let node3 = list.insert(3, after: node1)
        // [node0 <-> node2 <-> node1 <-> node3]

        #expect(list.first === node0)
        #expect(list.last === node3)

        #expect(node0.prev === nil)
        #expect(node0.next === node2)

        #expect(node2.prev === node0)
        #expect(node2.next === node1)

        #expect(node1.prev === node2)
        #expect(node1.next === node3)

        #expect(node3.prev === node1)
        #expect(node3.next === nil)

        list.removeAll()
        // []
        list.append(node: node0)
        list.append(node: node1)
        // [node0 <-> node1]

        #expect(list.count == 2)

        #expect(list.first === node0)
        #expect(list.last === node1)

        #expect(node0.prev === nil)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next == nil)

        let node_0 = ListNode(100)
        let node_1 = ListNode(200)
        let node_2 = ListNode(300)
        let node_3 = ListNode(400)
        let node_4 = ListNode(500)

        node_0.setNext(node_1)
        node_1.setNext(node_2)
        node_2.setNext(node_3)
        node_3.setNext(node_4)
        // [node_0 <-> node_1 <-> node_2 <-> node_3 <-> node_4]

        #expect(node_0.prev == nil)
        #expect(node_0.next === node_1)

        #expect(node_1.prev === node_0)
        #expect(node_1.next === node_2)

        #expect(node_2.prev === node_1)
        #expect(node_2.next === node_3)

        #expect(node_3.prev === node_2)
        #expect(node_3.next === node_4)

        #expect(node_4.prev === node_3)
        #expect(node_4.next == nil)

        list.insert(node: node_1, after: node0)
        // [node0 <-> node_1 <-> node1] || [node_0 <-> node_2 <-> node_3 <-> node_4]
        // [node_2 <-> node_3 <-> node_4]

        #expect(node_0.prev == nil)
        #expect(node_0.next === node_2)

        #expect(node_2.prev === node_0)
        #expect(node_2.next === node_3)

        #expect(node_3.prev === node_2)
        #expect(node_3.next === node_4)

        #expect(node_4.prev === node_3)
        #expect(node_4.next == nil)

        // [node0 <-> node_1 <-> node1]
        #expect(list.count == 3)

        #expect(list.first === node0)
        #expect(list.last === node1)

        #expect(node0.prev === nil)
        #expect(node0.next === node_1)

        #expect(node_1.prev === node0)
        #expect(node_1.next === node1)

        #expect(node1.prev === node_1)
        #expect(node1.next == nil)

        list.insert(node: node_1, after: node_1)

        #expect(list.count == 3)

        #expect(list.first === node0)
        #expect(list.last === node1)

        #expect(node0.prev === nil)
        #expect(node0.next === node_1)

        #expect(node_1.prev === node0)
        #expect(node_1.next === node1)

        #expect(node1.prev === node_1)
        #expect(node1.next == nil)

        list.insert(node: node_1, after: node1)
        // [node0 <-> node1 <-> node_1]

        #expect(list.count == 3)

        #expect(list.first === node0)
        #expect(list.last === node_1)

        #expect(node0.prev === nil)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next === node_1)

        #expect(node_1.prev === node1)
        #expect(node_1.next == nil)

        list.insert(node: node1, after: node0)
        // [node0 <-> node1 <-> node_1]
        #expect(list.count == 3)

        #expect(list.first === node0)
        #expect(list.last === node_1)

        #expect(node0.prev === nil)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next === node_1)

        #expect(node_1.prev === node1)
        #expect(node_1.next == nil)
    }

    @Test("Insert Before")
    func insertBefore() throws {
        let list = LinkedList<Int>()
        // []
        let node0 = list.append(0)
        // [node0]

        #expect(list.count == 1)
        #expect(list.first === node0)
        #expect(list.last === node0)

        #expect(node0.prev === nil)
        #expect(node0.next === nil)

        list.insert(node: node0, before: node0)

        #expect(list.count == 1)
        #expect(list.first === node0)
        #expect(list.last === node0)

        #expect(node0.prev === nil)
        #expect(node0.next === nil)

        let node1 = list.insert(1, before: node0)
        // [node1 <-> node0]

        #expect(list.count == 2)
        #expect(list.first === node1)
        #expect(list.last === node0)

        #expect(node1.prev == nil)
        #expect(node1.next === node0)

        #expect(node0.prev === node1)
        #expect(node0.next == nil)

        list.insert(node: node1, before: node0)
        // [node1 <-> node0]

        #expect(list.count == 2)
        #expect(list.first === node1)
        #expect(list.last === node0)

        #expect(node1.prev == nil)
        #expect(node1.next === node0)

        #expect(node0.prev === node1)
        #expect(node0.next == nil)

        list.insert(node: node0, before: node1)
        // [node0 <-> node1]

        #expect(list.count == 2)
        #expect(list.first === node0)
        #expect(list.last === node1)

        #expect(node0.prev == nil)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next == nil)

        let node2 = list.insert(2, before: node0)

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
        list.insert(node: node1, before: node2)
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
        list.insert(node: node0, before: node2)
        // [node1 <-> node0 <-> node2 ]
        list.insert(node: node0, before: node1)
        // [node0 <-> node1 <-> node2 ]

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
        let node3 = list.insert(3, before: node0)
        // [node3 <-> node0 <-> node1 <-> node2]

        #expect(list.count == 4)
        #expect(list.first === node3)
        #expect(list.last === node2)

        #expect(node3.prev == nil)
        #expect(node3.next === node0)

        #expect(node0.prev === node3)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next === node2)

        #expect(node2.prev === node1)
        #expect(node2.next == nil)

        list.removeAll()
        // []

        #expect(list.count == 0)
        #expect(list.first == nil)
        #expect(list.last == nil)

        list.append(node: node0)
        // [node0]
        #expect(list.count == 1)
        #expect(list.first === node0)
        #expect(list.last === node0)

        #expect(node0.prev == nil)
        #expect(node0.next == nil)

        list.insert(node: node1, before: node0)
        // [node1 <-> node0]

        #expect(list.count == 2)
        #expect(list.first === node1)
        #expect(list.last === node0)

        #expect(node1.prev == nil)
        #expect(node1.next === node0)

        #expect(node0.prev === node1)
        #expect(node0.next == nil)

        list.insert(node: node2, before: node0)
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

        let node_0 = ListNode(100)
        let node_1 = ListNode(200)
        let node_2 = ListNode(300)
        let node_3 = ListNode(400)
        let node_4 = ListNode(500)

        node_0.setNext(node_1)
        node_1.setNext(node_2)
        node_2.setNext(node_3)
        node_3.setNext(node_4)
        // [node_0 <-> node_1 <-> node_2 <-> node_3 <-> node_4]

        #expect(node_0.prev == nil)
        #expect(node_0.next === node_1)

        #expect(node_1.prev === node_0)
        #expect(node_1.next === node_2)

        #expect(node_2.prev === node_1)
        #expect(node_2.next === node_3)

        #expect(node_3.prev === node_2)
        #expect(node_3.next === node_4)

        #expect(node_4.prev === node_3)
        #expect(node_4.next == nil)

        list.insert(node: node_0, before: node0)
        // [node1 <-> node2 <-> node_0 <-> node0] || [ node_1 <-> node_2 <-> node_3 <-> node_4]

        // [ node_1 <-> node_2 <-> node_3 <-> node_4]
        #expect(node_1.prev == nil)
        #expect(node_1.next === node_2)

        #expect(node_2.prev === node_1)
        #expect(node_2.next === node_3)

        #expect(node_3.prev === node_2)
        #expect(node_3.next === node_4)

        #expect(node_4.prev === node_3)
        #expect(node_4.next == nil)

        // [node1 <-> node2 <-> node_0 <-> node0]

        #expect(list.count == 4)
        #expect(list.first === node1)
        #expect(list.last === node0)

        #expect(node1.prev == nil)
        #expect(node1.next === node2)

        #expect(node2.prev === node1)
        #expect(node2.next === node_0)

        #expect(node_0.prev === node2)
        #expect(node_0.next === node0)

        #expect(node0.prev === node_0)
        #expect(node0.next == nil)

        list.insert(node: node_4, before: node_0)
        // [node1 <-> node2 <-> node_4 <-> node_0 <-> node0] || [ node_1 <-> node_2 <-> node_3]
        // [ node_1 <-> node_2 <-> node_3]

        #expect(node_1.prev == nil)
        #expect(node_1.next === node_2)

        #expect(node_2.prev === node_1)
        #expect(node_2.next === node_3)

        #expect(node_3.prev === node_2)
        #expect(node_3.next == nil)

        // [node1 <-> node2 <-> node_4 <-> node_0 <-> node0]
        #expect(list.count == 5)
        #expect(list.first === node1)
        #expect(list.last === node0)

        #expect(node1.prev == nil)
        #expect(node1.next === node2)

        #expect(node2.prev === node1)
        #expect(node2.next === node_4)

        #expect(node_4.prev === node2)
        #expect(node_4.next === node_0)

        #expect(node_0.prev === node_4)
        #expect(node_0.next === node0)

        #expect(node0.prev === node_0)
        #expect(node0.next == nil)

        list.insert(node: node_2, before: node_4)
        // [node1 <-> node2 <-> node_2 <-> node_4 <-> node_0 <-> node0] || [node_1 <-> node_3]
        // [node_1 <-> node_3]
        #expect(node_1.prev == nil)
        #expect(node_1.next === node_3)

        #expect(node_3.prev === node_1)
        #expect(node_3.next == nil)

        // [node1 <-> node2 <-> node_2 <-> node_4 <-> node_0 <-> node0]
        #expect(list.count == 6)
        #expect(list.first === node1)
        #expect(list.last === node0)

        #expect(node1.prev == nil)
        #expect(node1.next === node2)

        #expect(node2.prev === node1)
        #expect(node2.next === node_2)

        #expect(node_2.prev === node2)
        #expect(node_2.next === node_4)

        #expect(node_4.prev === node_2)
        #expect(node_4.next === node_0)

        #expect(node_0.prev === node_4)
        #expect(node_0.next === node0)

        #expect(node0.prev === node_0)
        #expect(node0.next == nil)

        list.remove(node_2)
        list.remove(node_4)
        list.remove(node_0)
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

        list.insert(node: node0, before: node1)
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

        list.insert(node: node1, before: node1)
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
    }
}

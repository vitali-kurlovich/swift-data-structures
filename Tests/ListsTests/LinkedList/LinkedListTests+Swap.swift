//
//  Created by Vitali Kurlovich on 9.03.26.
//

@testable import Lists
import Testing

extension LinkedListTests {
    @Test("Swap")
    func swap() throws {
        let list = LinkedList<Int>()
        // []
        #expect(list.first == nil)
        #expect(list.last == nil)

        let node0 = list.append(0)
        // [node0]
        #expect(list.first === node0)
        #expect(list.last === node0)

        // [node0]
        list.swap(node0, with: node0)
        // [node0]
        #expect(list.first === node0)
        #expect(list.last === node0)

        let node1 = list.append(1)
        // [node0 <-> node1]

        #expect(list.first === node0)
        #expect(list.last === node1)

        #expect(node0.prev == nil)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next == nil)

        // [node0 <-> node1]
        list.swap(node0, with: node0)
        // [node0 <-> node1]

        #expect(list.first === node0)
        #expect(list.last === node1)

        #expect(node0.prev == nil)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next == nil)

        // [node0 <-> node1]
        list.swap(node0, with: node1)
        // [node1 <-> node0]

        #expect(list.first === node1)
        #expect(list.last === node0)

        #expect(node1.prev == nil)
        #expect(node1.next === node0)

        #expect(node0.prev === node1)
        #expect(node0.next == nil)

        list.swap(node0, with: node1)
        // node0 <-> node1

        #expect(list.first === node0)
        #expect(list.last === node1)

        #expect(node0.prev == nil)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next == nil)

        let node2 = list.append(2)
        let node3 = list.append(3)
        let node4 = list.append(4)

        // node0 <-> node1 <-> node2 <-> node3 <-> node4

        #expect(list.first === node0)
        #expect(list.last === node4)

        #expect(node0.prev == nil)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next === node2)

        #expect(node2.prev === node1)
        #expect(node2.next === node3)

        #expect(node3.prev === node2)
        #expect(node3.next === node4)

        #expect(node4.prev === node3)
        #expect(node4.next == nil)

        #expect(list.contains(node0))
        #expect(list.contains(node1))
        #expect(list.contains(node2))
        #expect(list.contains(node3))
        #expect(list.contains(node4))

        list.swap(node1, with: node2)
        // node0 <-> node2 <-> node1 <-> node3 <-> node4

        #expect(list.first === node0)
        #expect(list.last === node4)

        #expect(node0.prev == nil)
        #expect(node0.next === node2)

        #expect(node2.prev === node0)
        #expect(node2.next === node1)

        #expect(node1.prev === node2)
        #expect(node1.next === node3)

        #expect(node3.prev === node1)
        #expect(node3.next === node4)

        #expect(node4.prev === node3)
        #expect(node4.next == nil)

        list.swap(node1, with: node2)
        // node0 <-> node1 <-> node2 <-> node3 <-> node4

        #expect(list.first === node0)
        #expect(list.last === node4)

        #expect(node0.prev == nil)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next === node2)

        #expect(node2.prev === node1)
        #expect(node2.next === node3)

        #expect(node3.prev === node2)
        #expect(node3.next === node4)

        #expect(node4.prev === node3)
        #expect(node4.next == nil)

        list.swap(node1, with: node3)
        // node0 <-> node3 <-> node2 <-> node1 <-> node4

        #expect(list.first === node0)
        #expect(list.last === node4)

        #expect(node0.prev == nil)
        #expect(node0.next === node3)

        #expect(node3.prev === node0)
        #expect(node3.next === node2)

        #expect(node2.prev === node3)
        #expect(node2.next === node1)

        #expect(node1.prev === node2)
        #expect(node1.next === node4)

        #expect(node4.prev === node1)
        #expect(node4.next == nil)

        list.swap(node0, with: node3)
        list.swap(node4, with: node1)
        // node3 <-> node0 <-> node2 <-> node4 <-> node1

        #expect(list.first === node3)
        #expect(list.last === node1)

        #expect(node3.prev == nil)
        #expect(node3.next === node0)

        #expect(node0.prev === node3)
        #expect(node0.next === node2)

        #expect(node2.prev === node0)
        #expect(node2.next === node4)

        #expect(node4.prev === node2)
        #expect(node4.next === node1)

        #expect(node1.prev === node4)
        #expect(node1.next == nil)

        list.swap(node3, with: node1)
        // node1 <-> node0 <-> node2 <-> node4 <-> node3

        #expect(list.first === node1)
        #expect(list.last === node3)

        #expect(node1.prev == nil)
        #expect(node1.next === node0)

        #expect(node0.prev === node1)
        #expect(node0.next === node2)

        #expect(node2.prev === node0)
        #expect(node2.next === node4)

        #expect(node4.prev === node2)
        #expect(node4.next === node3)

        #expect(node3.prev === node4)
        #expect(node3.next == nil)
    }
}

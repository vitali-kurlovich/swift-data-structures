//
//  Created by Vitali Kurlovich on 3.03.26.
//

@testable import ListCollections
import Testing

extension LinkedListTests {
    @Test("Append")
    func append() throws {
        let list = LinkedList<Int>()
        let node0 = list.append(42)
        let node1 = list.append(54)

        let node2 = ListNode(60)
        let node3 = ListNode(61)
        let node4 = ListNode(62)
        let node5 = ListNode(63)

        node2.setNext(node3)
        node3.setNext(node4)
        node4.setNext(node5)

        list.append(node: node3)

        #expect(list.count == 6)

        #expect(list.first === node0)
        #expect(list.last === node5)

        #expect(node0.prev === nil)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next === node2)

        #expect(node2.prev === node1)
        #expect(node2.next === node3)

        #expect(node3.prev === node2)
        #expect(node3.next === node4)

        #expect(node4.prev === node3)
        #expect(node4.next === node5)

        #expect(node5.prev === node4)
        #expect(node5.next == nil)
    }
}

extension LinkedListTests {
    @Test("Prepend")
    func prepend() throws {
        let list = LinkedList<Int>()
        let node0 = list.prepend(42)

        #expect(list.first === node0)
        #expect(list.last === node0)

        let node1 = list.prepend(54)

        #expect(list.first === node1)
        #expect(list.last === node0)

        let node2 = ListNode(60)
        let node3 = ListNode(61)
        let node4 = ListNode(62)
        let node5 = ListNode(63)

        node2.setNext(node3)
        node3.setNext(node4)
        node4.setNext(node5)

        list.prepend(node: node3)

        #expect(list.count == 6)

        #expect(list.first === node2)
        #expect(list.last === node0)

        #expect(node2.prev === nil)
        #expect(node2.next === node3)

        #expect(node3.prev === node2)
        #expect(node3.next === node4)

        #expect(node4.prev === node3)
        #expect(node4.next === node5)

        #expect(node5.prev === node4)
        #expect(node5.next === node1)

        #expect(node1.prev === node5)
        #expect(node1.next === node0)

        #expect(node0.prev === node1)
        #expect(node0.next === nil)
    }
}

extension LinkedListTests {
    @Test("Remove")
    func remove() throws {
        let list = LinkedList<Int>()
        let node0 = list.append(42)

        list.remove(node0)

        #expect(node0.prev == nil)
        #expect(node0.next == nil)

        #expect(list.isEmpty)

        list.append(node: node0)
        let node1 = list.append(43)

        #expect(list.count == 2)

        let node = list.remove(node0)
        #expect(node === node0)

        #expect(node0.prev == nil)
        #expect(node0.next == nil)

        #expect(list.count == 1)

        #expect(list.first === node1)
        #expect(list.last === node1)

        #expect(node1.prev == nil)
        #expect(node1.next == nil)
    }

    @Test("Remove All")
    func removeAll() throws {
        let list = LinkedList<Int>()
        var node0 = list.append(0)
        var node1 = list.append(1)
        var node2 = list.append(2)

        #expect(isKnownUniquelyReferenced(&node0) == false)
        #expect(isKnownUniquelyReferenced(&node1) == false)
        #expect(isKnownUniquelyReferenced(&node2) == false)

        #expect(list.isEmpty == false)

        #expect(list.first === node0)
        #expect(list.last === node2)
        #expect(list.count == 3)

        #expect(node0.prev == nil)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next === node2)

        #expect(node2.prev === node1)
        #expect(node2.next == nil)

        list.removeAll()

        #expect(list.isEmpty)
        #expect(list.first == nil)
        #expect(list.last == nil)
        #expect(list.count == 0)

        #expect(node0.prev == nil)
        #expect(node0.next == nil)

        #expect(node1.prev == nil)
        #expect(node1.next == nil)

        #expect(node2.prev == nil)
        #expect(node2.next == nil)

        #expect(isKnownUniquelyReferenced(&node0))
        #expect(isKnownUniquelyReferenced(&node1))
        #expect(isKnownUniquelyReferenced(&node2))
    }
}

extension LinkedListTests {
    @Test("Insert After")
    func insertAfter() throws {
        let list = LinkedList<Int>()
        let node0 = list.append(0)

        #expect(list.first === node0)
        #expect(list.last === node0)

        #expect(node0.prev === nil)
        #expect(node0.next === nil)

        let node1 = list.insert(1, after: node0)

        #expect(list.first === node0)
        #expect(list.last === node1)

        #expect(node0.prev === nil)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next === nil)

        let node2 = list.insert(2, after: node0)

        #expect(list.first === node0)
        #expect(list.last === node1)

        #expect(node0.prev === nil)
        #expect(node0.next === node2)

        #expect(node2.prev === node0)
        #expect(node2.next === node1)

        #expect(node1.prev === node2)
        #expect(node1.next === nil)

        let node3 = list.insert(3, after: node1)

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
        list.append(node: node0)
        list.append(node: node1)

        node2.append(node3)

        list.insert(node: node2, after: node1)

        #expect(list.first === node0)
        #expect(list.last === node3)

        #expect(node0.prev === nil)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next === node2)

        #expect(node2.prev === node1)
        #expect(node2.next === node3)

        #expect(node3.prev === node2)
        #expect(node3.next === nil)

        list.removeAll()
        list.append(node: node0)
        list.append(node: node1)

        node2.append(node3)

        list.insert(node: node2, after: node0)

        #expect(list.first === node0)
        #expect(list.last === node1)

        #expect(node0.prev === nil)
        #expect(node0.next === node2)

        #expect(node2.prev === node0)
        #expect(node2.next === node3)

        #expect(node3.prev === node2)
        #expect(node3.next === node1)

        #expect(node1.prev === node3)
        #expect(node1.next === nil)
    }

    @Test("Insert Before")
    func insertBefore() throws {
        let list = LinkedList<Int>()
        let node0 = list.append(0)

        // node0

        #expect(list.first === node0)
        #expect(list.last === node0)

        #expect(node0.prev === nil)
        #expect(node0.next === nil)

        let node1 = list.insert(1, before: node0)

        // node1 <-> node0

        #expect(list.first === node1)
        #expect(list.last === node0)

        #expect(node1.prev == nil)
        #expect(node1.next === node0)

        #expect(node0.prev === node1)
        #expect(node0.next == nil)

        let node2 = list.insert(2, before: node0)

        // node1 <-> node2 <-> node0

        #expect(list.first === node1)
        #expect(list.last === node0)

        #expect(node1.prev == nil)
        #expect(node1.next === node2)

        #expect(node2.prev === node1)
        #expect(node2.next === node0)

        #expect(node0.prev === node2)
        #expect(node0.next == nil)

        let node3 = list.insert(3, before: node1)

        // node3 <-> node1 <-> node2 <-> node0

        #expect(list.first === node3)
        #expect(list.last === node0)

        #expect(node3.prev == nil)
        #expect(node3.next === node1)

        #expect(node1.prev === node3)
        #expect(node1.next === node2)

        #expect(node2.prev === node1)
        #expect(node2.next === node0)

        #expect(node0.prev === node2)
        #expect(node0.next == nil)

        list.removeAll()
        list.append(node: node0)
        list.append(node: node3)

        // node0 <-> node3

        node1.append(node2)

        // node1 <-> node2

        list.insert(node: node1, before: node0)

        //  node1 <-> node2 <-> node0 <-> node3

        #expect(list.first === node1)
        #expect(list.last === node3)

        #expect(node1.prev == nil)
        #expect(node1.next === node2)

        #expect(node2.prev === node1)
        #expect(node2.next === node0)

        #expect(node0.prev === node2)
        #expect(node0.next === node3)

        #expect(node3.prev === node0)
        #expect(node3.next == nil)
    }
}

extension LinkedListTests {
    @Test("Swap")
    func swap() throws {
        let list = LinkedList<Int>()

        let node0 = list.append(0)
        let node1 = list.append(1)

        // node0 <-> node1

        #expect(list.first === node0)
        #expect(list.last === node1)

        #expect(node0.prev == nil)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next == nil)

        list.swap(node0, with: node0)
        // node0 <-> node1

        #expect(list.first === node0)
        #expect(list.last === node1)

        #expect(node0.prev == nil)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next == nil)

        list.swap(node0, with: node1)
        // node1 <-> node0

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

extension LinkedListTests {
    @Test("Disconnect")
    func disconnect() throws {
        let list = LinkedList<Int>()
        let node0 = list.append(0)

        var result = list.disconnect(by: node0)
        // [node0] || []

        #expect(list.first === node0)
        #expect(list.last === node0)

        #expect(node0.prev == nil)
        #expect(node0.next == nil)

        #expect(result.isEmpty)
        #expect(result.first == nil)
        #expect(result.last == nil)

        let node1 = list.append(1)
        // [ node0 <-> node1 ]
        #expect(list.first === node0)
        #expect(list.last === node1)

        #expect(node0.prev == nil)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next == nil)

        result = list.disconnect(by: node1)
        // [ node0 <-> node1 ] || []

        #expect(list.first === node0)
        #expect(list.last === node1)

        #expect(node0.prev == nil)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next == nil)

        #expect(result.isEmpty)
        #expect(result.first == nil)
        #expect(result.last == nil)

        result = list.disconnect(by: node0)
        // [ node0 ] || [ node1 ]

        #expect(list.first === node0)
        #expect(list.last === node0)

        #expect(node0.prev == nil)
        #expect(node0.next == nil)

        #expect(result.first === node1)
        #expect(result.last === node1)

        #expect(node1.prev == nil)
        #expect(node1.next == nil)

        result = LinkedList()

        list.append(node: node1)
        let node2 = list.append(2)

        //  [node0 <-> node1 <-> node2]
        #expect(list.first === node0)
        #expect(list.last === node2)

        #expect(node0.prev == nil)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next === node2)

        #expect(node2.prev === node1)
        #expect(node2.next == nil)

        result = list.disconnect(by: node2)
        //  [node0 <-> node1 <-> node2] || []

        #expect(list.first === node0)
        #expect(list.last === node2)

        #expect(node0.prev == nil)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next === node2)

        #expect(node2.prev === node1)
        #expect(node2.next == nil)

        #expect(result.isEmpty)
        #expect(result.first == nil)
        #expect(result.last == nil)

        result = list.disconnect(by: node1)
        //  [node0 <-> node1] || [node2]

        #expect(list.first === node0)
        #expect(list.last === node1)

        #expect(node0.prev == nil)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next == nil)

        #expect(result.first == node2)
        #expect(result.last == node2)

        #expect(node2.prev == nil)
        #expect(node2.next == nil)

        result = .init()

        list.append(node: node2)
        let node3 = list.append(3)

        // [node0 <-> node1 <-> node2 <-> node3]

        #expect(list.first === node0)
        #expect(list.last === node3)

        #expect(node0.prev == nil)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next === node2)

        #expect(node2.prev === node1)
        #expect(node2.next === node3)

        #expect(node3.prev === node2)
        #expect(node3.next == nil)

        result = list.disconnect(by: node1)
        // [node0 <-> node1] || [node2 <-> node3]

        #expect(list.first === node0)
        #expect(list.last === node1)

        #expect(node0.prev == nil)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next == nil)

        #expect(result.first === node2)
        #expect(result.last === node3)

        #expect(node2.prev == nil)
        #expect(node2.next === node3)

        #expect(node3.prev === node2)
        #expect(node3.next == nil)
    }
}

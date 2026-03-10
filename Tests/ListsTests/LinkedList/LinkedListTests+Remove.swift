//
//  Created by Vitali Kurlovich on 9.03.26.
//

@testable import Lists
import Testing

extension LinkedListTests {
    @Test("Remove")
    func remove() throws {
        let list = LinkedList<Int>()
        // []

        let node0 = list.append(42)
        // [node0]

        list.remove(node0)
        // []

        #expect(node0.prev == nil)
        #expect(node0.next == nil)

        #expect(list.isEmpty)

        list.append(node: node0)
        // [node0]
        let node1 = list.append(43)
        // [node0 <-> node1]

        #expect(list.count == 2)

        let node = list.remove(node0)
        // [node1]
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
        // []
        var node0 = list.append(0)
        // [node0]
        var node1 = list.append(1)
        // [node0 <-> node1]
        var node2 = list.append(2)
        // [node0 <-> node1 <-> node2]

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
        // []

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

//
//  Created by Vitali Kurlovich on 9.03.26.
//

@testable import Lists
import Testing

extension LinkedListTests {
    @Test("Drop First")
    func dropFirst() throws {
        let list = LinkedList<Int>()

        #expect(list.isEmpty)
        #expect(list.count == 0)
        #expect(list.first == nil)
        #expect(list.last == nil)

        #expect(list.dropFirst() == nil)

        let node0 = list.append(0)

        #expect(list.isEmpty == false)
        #expect(list.count == 1)
        #expect(list.first === node0)
        #expect(list.last === node0)

        #expect(node0.prev == nil)
        #expect(node0.next == nil)

        #expect(list.dropFirst() === node0)

        #expect(list.isEmpty)
        #expect(list.count == 0)
        #expect(list.first == nil)
        #expect(list.last == nil)

        #expect(node0.prev == nil)
        #expect(node0.next == nil)

        list.append(node: node0)
        let node1 = list.append(1)
        let node2 = list.append(2)

        #expect(list.isEmpty == false)
        #expect(list.count == 3)
        #expect(list.first === node0)
        #expect(list.last === node2)

        #expect(node0.prev == nil)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next === node2)

        #expect(node2.prev === node1)
        #expect(node2.next == nil)

        #expect(list.dropFirst() === node0)

        #expect(list.isEmpty == false)
        #expect(list.count == 2)
        #expect(list.first === node1)
        #expect(list.last === node2)

        #expect(node1.prev == nil)
        #expect(node1.next === node2)

        #expect(node2.prev === node1)
        #expect(node2.next == nil)

        #expect(list.dropFirst() === node1)

        #expect(list.isEmpty == false)
        #expect(list.count == 1)
        #expect(list.first === node2)
        #expect(list.last === node2)

        #expect(node2.prev == nil)
        #expect(node2.next === nil)

        #expect(list.dropFirst() === node2)

        #expect(list.isEmpty)
        #expect(list.count == 0)
        #expect(list.first == nil)
        #expect(list.last == nil)

        #expect(node2.prev == nil)
        #expect(node2.next === nil)

        #expect(list.dropFirst() == nil)

        #expect(list.isEmpty)
        #expect(list.count == 0)
        #expect(list.first == nil)
        #expect(list.last == nil)
    }

    @Test("Drop Last")
    func dropLast() throws {
        let list = LinkedList<Int>()

        #expect(list.isEmpty)
        #expect(list.count == 0)
        #expect(list.first == nil)
        #expect(list.last == nil)

        #expect(list.dropLast() == nil)

        let node0 = list.append(0)

        #expect(list.isEmpty == false)
        #expect(list.count == 1)
        #expect(list.first === node0)
        #expect(list.last === node0)

        #expect(node0.prev == nil)
        #expect(node0.next == nil)

        #expect(list.dropLast() === node0)

        #expect(list.isEmpty)
        #expect(list.count == 0)
        #expect(list.first == nil)
        #expect(list.last == nil)

        #expect(node0.prev == nil)
        #expect(node0.next == nil)

        list.append(node: node0)
        let node1 = list.append(1)
        let node2 = list.append(2)

        #expect(list.isEmpty == false)
        #expect(list.count == 3)
        #expect(list.first === node0)
        #expect(list.last === node2)

        #expect(node0.prev == nil)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next === node2)

        #expect(node2.prev === node1)
        #expect(node2.next == nil)

        #expect(list.dropLast() === node2)

        #expect(list.isEmpty == false)
        #expect(list.count == 2)
        #expect(list.first === node0)
        #expect(list.last === node1)

        #expect(node0.prev == nil)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next == nil)

        #expect(list.dropLast() === node1)

        #expect(list.isEmpty == false)
        #expect(list.count == 1)
        #expect(list.first === node0)
        #expect(list.last === node0)

        #expect(node0.prev == nil)
        #expect(node0.next === nil)

        #expect(list.dropLast() === node0)

        #expect(list.isEmpty)
        #expect(list.count == 0)
        #expect(list.first == nil)
        #expect(list.last == nil)

        #expect(node2.prev == nil)
        #expect(node2.next === nil)

        #expect(list.dropLast() == nil)

        #expect(list.isEmpty)
        #expect(list.count == 0)
        #expect(list.first == nil)
        #expect(list.last == nil)
    }
}

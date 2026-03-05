//
//  Created by Vitali Kurlovich on 2.03.26.
//

@testable import ListCollections
import Testing

@Suite("LinkedList")
struct LinkedListTests {}

extension LinkedListTests {
    @Test("Empty")
    func empty() throws {
        let list = LinkedList<Int>()

        #expect(list.isEmpty)

        let node = ListNode(42)
        list.append(node: node)
        #expect(list.isEmpty == false)
    }
}

extension LinkedListTests {
    @Test("Count")
    func count() throws {
        let list = LinkedList<Int>()

        #expect(list.count == 0)

        let node = ListNode(42)
        list.append(node: node)
        #expect(list.count == 1)

        let first = ListNode(10)
        let second = ListNode(20)
        first.setNext(second)

        list.append(node: first)
        #expect(list.count == 3)
    }
}

extension LinkedListTests {
    @Test("Contains")
    func contains() throws {
        let list = LinkedList<Int>()

        let node0 = ListNode(42)
        #expect(list.contains(node0) == false)

        list.append(node: node0)

        let node1 = ListNode(42)

        #expect(list.contains(node0))
        #expect(list.contains(node1) == false)

        list.append(node: node1)

        #expect(list.contains(node0))
        #expect(list.contains(node1))

        let node2 = list.append(64)

        #expect(list.contains(node0))
        #expect(list.contains(node1))
        #expect(list.contains(node2))

        let node3 = list.prepend(65)

        #expect(list.contains(node3))

        let node4 = ListNode(66)

        node3.prepend(node4)

        #expect(list.contains(node4))
    }
}

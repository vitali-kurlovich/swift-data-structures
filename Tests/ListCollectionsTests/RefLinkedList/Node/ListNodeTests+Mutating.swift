//
//  Created by Vitali Kurlovich on 3.03.26.
//

@testable import ListCollections
import Testing

extension ListNodeTests {
    @Test("Remove")
    func remove() throws {
        let first = ListNode(10)
        let second = ListNode(10)
        let last = ListNode(30)

        first.append(second)
        second.append(last)

        #expect(first.contains(second))
        #expect(first.contains(last))

        #expect(second.contains(first))
        #expect(second.contains(last))

        #expect(last.contains(first))
        #expect(last.contains(second))

        first.remove()

        #expect(first.prev == nil)
        #expect(first.next == nil)

        #expect(first.contains(second) == false)
        #expect(first.contains(last) == false)

        #expect(second.contains(first) == false)
        #expect(second.contains(last))

        #expect(last.contains(first) == false)
        #expect(last.contains(second))

        first.append(second)

        #expect(first.contains(second))
        #expect(first.contains(last))

        #expect(second.contains(first))
        #expect(second.contains(last))

        #expect(last.contains(first))
        #expect(last.contains(second))

        second.remove()

        #expect(second.prev == nil)
        #expect(second.next == nil)

        #expect(first.contains(second) == false)
        #expect(first.contains(last))

        #expect(second.contains(first) == false)
        #expect(second.contains(last) == false)

        #expect(last.contains(first))
        #expect(last.contains(second) == false)

        first.setNext(second)
        second.setNext(last)

        #expect(first.contains(second))
        #expect(first.contains(last))

        #expect(second.contains(first))
        #expect(second.contains(last))

        #expect(last.contains(first))
        #expect(last.contains(second))

        last.remove()

        #expect(last.prev == nil)
        #expect(last.next == nil)

        #expect(first.contains(second))
        #expect(first.contains(last) == false)

        #expect(second.contains(first))
        #expect(second.contains(last) == false)

        #expect(last.contains(first) == false)
        #expect(last.contains(second) == false)
    }
}

extension ListNodeTests {
    @Test("Append")
    func append() throws {
        let node0 = ListNode(10)
        let node1 = ListNode(10)
        let node2 = ListNode(30)

        node0.append(node1)

        #expect(node0.prev == nil)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next == nil)

        node0.append(node2)

        #expect(node0.prev == nil)
        #expect(node0.next === node2)

        #expect(node2.prev === node0)
        #expect(node2.next === node1)

        #expect(node1.prev === node2)
        #expect(node1.next == nil)

        node0.remove()
        node1.remove()
        node2.remove()

        node0.append(node1)
        node1.append(node2)

        let begin = ListNode(100)
        let end = ListNode(200)

        begin.append(end)

        #expect(begin.prev == nil)
        #expect(begin.next === end)

        #expect(end.prev === begin)
        #expect(end.next == nil)

        begin.append(node1)

        #expect(begin.prev == nil)
        #expect(begin.next === node0)

        #expect(node0.prev === begin)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next === node2)

        #expect(node2.prev === node1)
        #expect(node2.next === end)

        #expect(end.prev === node2)
        #expect(end.next == nil)
    }

    @Test("Prepend")
    func prepend() throws {
        let node0 = ListNode(10)
        let node1 = ListNode(10)
        let node2 = ListNode(30)

        node2.prepend(node1)

        #expect(node2.prev === node1)
        #expect(node2.next == nil)

        #expect(node1.prev == nil)
        #expect(node1.next === node2)

        node2.prepend(node0)

        #expect(node2.prev === node0)
        #expect(node2.next == nil)

        #expect(node0.prev === node1)
        #expect(node0.next === node2)

        #expect(node1.prev == nil)
        #expect(node1.next === node0)

        node0.remove()
        node1.remove()
        node2.remove()

        node0.append(node1)
        node1.append(node2)

        let begin = ListNode(100)
        let end = ListNode(200)

        end.prepend(begin)

        #expect(begin.prev == nil)
        #expect(begin.next === end)

        #expect(end.prev === begin)
        #expect(end.next == nil)

        end.prepend(node1)

        #expect(begin.prev == nil)
        #expect(begin.next === node0)

        #expect(node0.prev === begin)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next === node2)

        #expect(node2.prev === node1)
        #expect(node2.next === end)

        #expect(end.prev === node2)
        #expect(end.next == nil)
    }
}

extension ListNodeTests {
    @Test("Swap")
    func swap() throws {
        let node0 = ListNode(0)
        let node1 = ListNode(1)
        let node2 = ListNode(2)

        node0.swap(with: node0)

        #expect(node0.prev == nil)
        #expect(node0.next == nil)

        node0.append(node1)
        node1.append(node2)

        #expect(node0.prev == nil)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next === node2)

        #expect(node2.prev === node1)
        #expect(node2.next == nil)

        node0.swap(with: node2)

        #expect(node2.prev == nil)
        #expect(node2.next === node1)

        #expect(node1.prev === node2)
        #expect(node1.next === node0)

        #expect(node0.prev === node1)
        #expect(node0.next == nil)

        let node3 = ListNode(3)
        node0.remove()
        node1.remove()
        node2.remove()

        node0.append(node1)
        node1.append(node2)
        node2.append(node3)

        #expect(node0.prev == nil)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next === node2)

        #expect(node2.prev === node1)
        #expect(node2.next === node3)

        #expect(node3.prev === node2)
        #expect(node3.next == nil)

        node1.swap(with: node2)

        #expect(node0.prev == nil)
        #expect(node0.next === node2)

        #expect(node2.prev === node0)
        #expect(node2.next === node1)

        #expect(node1.prev === node2)
        #expect(node1.next === node3)

        #expect(node3.prev === node1)
        #expect(node3.next == nil)

        node1.swap(with: node2)

        #expect(node0.prev == nil)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next === node2)

        #expect(node2.prev === node1)
        #expect(node2.next === node3)

        #expect(node3.prev === node2)
        #expect(node3.next == nil)

        let node4 = ListNode(4)

        node3.append(node4)

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

        node1.swap(with: node3)

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
    }
}

extension ListNodeTests {
    @Test("Disconnect")
    func disconnect() throws {
        let node0 = ListNode(0)
        let node1 = ListNode(1)
        let node2 = ListNode(2)

        var result = node0.disconnect()
        //  node0 || nil
        #expect(node0.prev == nil)
        #expect(node0.next == nil)
        #expect(result == nil)

        node0.append(node1)
        // node0 <-> node1
        #expect(node0.prev == nil)
        #expect(node0.next == node1)

        #expect(node1.prev == node0)
        #expect(node1.next == nil)

        result = node0.disconnect()
        //  node0 || node1

        #expect(result === node1)

        #expect(node0.prev == nil)
        #expect(node0.next == nil)
        #expect(node1.prev == nil)
        #expect(node1.next == nil)

        node0.append(node1)
        // node0 <-> node1
        #expect(node0.prev == nil)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next == nil)

        result = node1.disconnect()
        // node0 <-> node1 || nil

        #expect(result == nil)

        #expect(node0.prev == nil)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next == nil)

        node1.append(node2)
        // node0 <-> node1 <-> node2

        #expect(node0.prev == nil)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next === node2)

        #expect(node2.prev === node1)
        #expect(node2.next == nil)

        result = node0.disconnect()
        // node0 || node1 <-> node2

        #expect(result === node1)
        #expect(node0.prev == nil)
        #expect(node0.next == nil)

        #expect(node1.prev == nil)
        #expect(node1.next === node2)

        #expect(node2.prev === node1)
        #expect(node2.next == nil)

        node0.append(node1)
        // node0 <-> node1 <-> node2

        #expect(node0.prev == nil)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next === node2)

        #expect(node2.prev === node1)
        #expect(node2.next == nil)

        result = node1.disconnect()
        // node0 <-> node1 || node2

        #expect(result === node2)

        #expect(node0.prev == nil)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next == nil)

        #expect(node2.prev == nil)
        #expect(node2.next == nil)
    }
}

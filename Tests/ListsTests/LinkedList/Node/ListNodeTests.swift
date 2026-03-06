//
//  Created by Vitali Kurlovich on 2.03.26.
//

@testable import Lists
import Testing

@Suite("ListNode")
struct ListNodeTests {}

extension ListNodeTests {
    @Test("Cycles")
    func isCyclic() throws {
        let first = ListNode(10)

        first._next = first

        #expect(ListNode.isCyclic(node: first))

        let second = ListNode(20)
        let last = ListNode(30)

        first._next = second
        second._prev = first

        first._prev = second

        #expect(ListNode.isCyclic(node: first))

        first._next = second
        second._prev = first

        second._next = last
        last._prev = second

        last._next = first
        first._prev = last

        #expect(ListNode.isCyclic(node: first))
        #expect(ListNode.isCyclic(node: second))
        #expect(ListNode.isCyclic(node: last))
    }
}

extension ListNodeTests {
    @Test("Count")
    func count() throws {
        let first = ListNode(10)
        #expect(first.count == 1)

        let second = ListNode(20)
        first.setNext(second)

        #expect(first.count == 2)
        #expect(second.count == 2)

        let last = ListNode(30)
        last.setPrev(second)

        #expect(first.count == 3)
        #expect(second.count == 3)
        #expect(last.count == 3)
    }
}

extension ListNodeTests {
    @Test("First")
    func first() throws {
        let first = ListNode(10)
        #expect(first.first === first)
        #expect(first.isFirst)

        let second = ListNode(20)
        first.setNext(second)
        #expect(first.first === first)
        #expect(second.first === first)
        #expect(first.isFirst)
        #expect(second.isFirst == false)

        let last = ListNode(30)
        last.setPrev(second)

        #expect(first.first === first)
        #expect(second.first === first)
        #expect(last.first === first)

        #expect(first.isFirst)
        #expect(second.isFirst == false)
        #expect(last.isFirst == false)
    }

    @Test("Last")
    func last() throws {
        let first = ListNode(10)
        #expect(first.last === first)
        #expect(first.isLast)

        let second = ListNode(20)
        first.setNext(second)
        #expect(first.last === second)
        #expect(second.last === second)

        #expect(first.isLast == false)
        #expect(second.isLast)

        let last = ListNode(30)
        last.setPrev(second)

        #expect(first.last === last)
        #expect(second.last === last)
        #expect(last.last === last)

        #expect(first.isLast == false)
        #expect(second.isLast == false)
        #expect(last.isLast)
    }
}

extension ListNodeTests {
    @Test("Contains")
    func contains() throws {
        let first = ListNode(10)
        #expect(first.contains(first))

        let second = ListNode(10)

        #expect(first.contains(second) == false)

        first.setNext(second)

        #expect(first.contains(second))
        #expect(second.contains(first))

        let last = ListNode(30)

        #expect(first.contains(last) == false)
        #expect(second.contains(last) == false)
        #expect(last.contains(first) == false)
        #expect(last.contains(second) == false)

        second.setNext(last)

        #expect(first.contains(last))
        #expect(second.contains(last))
        #expect(last.contains(last))

        #expect(last.contains(first))
        #expect(last.contains(second))
    }
}

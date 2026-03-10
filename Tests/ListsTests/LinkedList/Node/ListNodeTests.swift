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

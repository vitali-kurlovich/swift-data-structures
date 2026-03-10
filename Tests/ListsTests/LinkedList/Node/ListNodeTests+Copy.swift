//
//  Created by Vitali Kurlovich on 4.03.26.
//

@testable import Lists
import Testing

extension ListNodeTests {
    @Test("Copy")
    func copy() throws {
        let node0 = ListNode(0)
        var result = node0.copy()

        var copy0 = result.copy

        #expect(node0 !== copy0)
        #expect(node0.value == copy0.value)

        #expect(node0.prev == nil)
        #expect(node0.next == nil)

        #expect(copy0.prev == nil)
        #expect(copy0.next == nil)

        let node1 = ListNode(1)
        node0.setNext(node1)

        result = node0.copy()

        copy0 = result.copy

        var copy1 = try #require(copy0.next)

        #expect(node0 !== copy0)
        #expect(node0.value == copy0.value)

        #expect(node1 !== copy1)
        #expect(node1.value == copy1.value)

        // ---

        #expect(node0.prev == nil)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next == nil)

        // ---
        #expect(copy0.prev == nil)
        #expect(copy0.next === copy1)

        #expect(copy1.prev === copy0)
        #expect(copy1.next == nil)

        result = node1.copy()

        copy1 = result.copy
        copy0 = try #require(copy1.prev)

        #expect(node0 !== copy0)
        #expect(node0.value == copy0.value)

        #expect(node1 !== copy1)
        #expect(node1.value == copy1.value)

        // ---

        #expect(node0.prev == nil)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next == nil)

        // ---
        #expect(copy0.prev == nil)
        #expect(copy0.next === copy1)

        #expect(copy1.prev === copy0)
        #expect(copy1.next == nil)

        let node2 = ListNode(2)
        node1.setNext(node2)

        result = node0.copy()

        copy0 = result.copy
        copy1 = try #require(copy0.next)
        var copy2 = try #require(copy1.next)

        #expect(node0 !== copy0)
        #expect(node0.value == copy0.value)

        #expect(node1 !== copy1)
        #expect(node1.value == copy1.value)

        #expect(node2 !== copy2)
        #expect(node2.value == copy2.value)
        // ---

        #expect(node0.prev == nil)
        #expect(node0.next === node1)

        #expect(node1.prev === node0)
        #expect(node1.next === node2)

        #expect(node2.prev === node1)
        #expect(node2.next == nil)
        // ---

        #expect(copy0.prev == nil)
        #expect(copy0.next === copy1)

        #expect(copy1.prev === copy0)
        #expect(copy1.next === copy2)

        #expect(copy2.prev === copy1)
        #expect(copy2.next == nil)

        result = node1.copy()

        copy1 = result.copy
        copy0 = try #require(copy1.prev)
        copy2 = try #require(copy1.next)

        #expect(node0 !== copy0)
        #expect(node0.value == copy0.value)

        #expect(node1 !== copy1)
        #expect(node1.value == copy1.value)

        #expect(node2 !== copy2)
        #expect(node2.value == copy2.value)
        // ---

        #expect(copy0.prev == nil)
        #expect(copy0.next === copy1)

        #expect(copy1.prev === copy0)
        #expect(copy1.next === copy2)

        #expect(copy2.prev === copy1)
        #expect(copy2.next == nil)

        // ---
        result = node2.copy()
        copy2 = result.copy
        copy1 = try #require(copy2.prev)
        copy0 = try #require(copy1.prev)

        // ---
        #expect(node0 !== copy0)
        #expect(node0.value == copy0.value)

        #expect(node1 !== copy1)
        #expect(node1.value == copy1.value)

        #expect(node2 !== copy2)
        #expect(node2.value == copy2.value)
        // ---

        #expect(copy0.prev == nil)
        #expect(copy0.next === copy1)

        #expect(copy1.prev === copy0)
        #expect(copy1.next === copy2)

        #expect(copy2.prev === copy1)
        #expect(copy2.next == nil)

        #expect(result.first === copy0)
        #expect(result.last === copy2)
    }
}

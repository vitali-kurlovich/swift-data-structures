//
//  Created by Vitali Kurlovich on 6.03.26.
//

@testable import Lists
import Testing

extension ListNodeTests {
    @Test("Sequence")
    func sequence() throws {
        let node0 = ListNode(10)
        let node1 = ListNode(20)
        let node2 = ListNode(30)

        #expect(node0.map { $0 } == [10])

        node0.append(node1)

        #expect(node0.map { $0 } == [10, 20])
        #expect(node1.map { $0 } == [20])

        node1.append(node2)

        #expect(node0.map { $0 } == [10, 20, 30])
        #expect(node1.map { $0 } == [20, 30])
        #expect(node2.map { $0 } == [30])

        node1.remove()

        #expect(node0.map { $0 } == [10, 30])
        #expect(node1.map { $0 } == [20])
        #expect(node2.map { $0 } == [30])
    }
}

//
//  Created by Vitali Kurlovich on 5.03.26.
//

@testable import Lists
import Testing

extension ListNodeTests {
    @Test("Equatable")
    func equal() throws {
        let l0 = ListNode(0)
        #expect(l0 == l0)

        let r0 = ListNode(0)
        #expect(l0 == r0)
        #expect(l0 !== r0)

        let l1 = ListNode(1)
        let r1 = ListNode(1)

        #expect(l0 != l1)

        l0._next = l1
        r0._next = l1

        l0._prev = r1
        r0._prev = r1

        #expect(l0 == l0)
    }

    @Test("Equatable deep")
    func deep_equal() throws {
        let l0 = ListNode(0)
        let l1 = ListNode(1)
        let l2 = ListNode(2)

        l0.append(l1)
        l1.append(l2)

        let r0 = ListNode(0)
        let r1 = ListNode(1)
        let r2 = ListNode(2)

        r0.append(r1)
        r1.append(r2)

        #expect(l0 == r0)

        let r3 = ListNode(3)
        r2.append(r3)

        #expect(l0 != r0)
        l2._next = r3

        #expect(l0 == r0)

        let l3 = ListNode(3)
        l2._next = nil
        l2.append(l3)

        #expect(l0 == r0)

        l3.value = 0
        #expect(l0 != r0)
        l3.value = 3

        let l4 = ListNode(4)

        l3.append(l4)
        #expect(l0 != r0)

        let r4 = ListNode(4)
        r3.append(r4)

        #expect(l0 == r0)

        #expect(l1 == r1)
        #expect(l2 == r2)
        #expect(l1 != r2)
        #expect(l0 != r2)

        let l5 = ListNode(5)

        l0.prepend(l5)

        #expect(l0 != r0)
        r0._prev = l5

        #expect(l0 == r0)
        r0._prev = nil

        let r5 = ListNode(5)
        r0.prepend(r5)

        #expect(l0 == r0)

        let r6 = ListNode(6)
        r5.prepend(r6)

        #expect(l0 != r0)

        l5._prev = r6

        #expect(l0 == r0)

        l5._prev = nil
        let l6 = ListNode(6)
        l5.prepend(l6)
        #expect(l0 == r0)

        l6.value = 0
        #expect(l0 != r0)
    }
}

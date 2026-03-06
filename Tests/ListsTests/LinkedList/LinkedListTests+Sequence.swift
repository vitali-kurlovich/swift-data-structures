//
//  Created by Vitali Kurlovich on 7.03.26.
//

@testable import Lists
import Testing

extension LinkedListTests {
    @Test("Sequence")
    func sequence() throws {
        let list = LinkedList<Int>()
        #expect(list.map { $0 } == [])

        list.append(10)
        #expect(list.map { $0 } == [10])

        let node1 = list.append(20)
        #expect(list.map { $0 } == [10, 20])

        list.append(30)

        #expect(list.map { $0 } == [10, 20, 30])

        list.remove(node1)

        #expect(list.map { $0 } == [10, 30])

        list.dropFirst()
        #expect(list.map { $0 } == [30])

        list.append(40)

        #expect(list.map { $0 } == [30, 40])
        list.dropLast()

        #expect(list.map { $0 } == [30])

        list.removeAll()

        #expect(list.map { $0 } == [])
    }

    @Test("Init with Sequence")
    func initWithSequence() throws {
        let list = LinkedList<Int>([0, 2, 4])

        #expect(list.map { $0 } == [0, 2, 4])

        #expect(list.first?.value == 0)
        #expect(list.last?.value == 4)
    }
}

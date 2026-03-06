//
//  Created by Vitali Kurlovich on 7.03.26.
//

import Foundation
import Lists
import Testing

extension LinkedListTests {
    @Test("Codable")
    func codable() throws {
        let encoder = JSONEncoder()

        let list = LinkedList(0)
        list.append(10)
        list.append(20)

        let data = try encoder.encode(list)

        let decoder = JSONDecoder()
        let result = try decoder.decode(LinkedList<Int>.self, from: data)

        #expect(list !== result)
        #expect(list == result)
        #expect(list.map { $0 } == [0, 10, 20])
    }
}

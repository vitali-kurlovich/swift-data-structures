//
//  Created by Vitali Kurlovich on 7.03.26.
//

extension LinkedList: Decodable where T: Decodable {
    public convenience init(from decoder: any Decoder) throws {
        self.init()
        var container = try decoder.unkeyedContainer()

        while !container.isAtEnd {
            let value = try container.decode(T.self)
            append(value)
        }
    }
}

extension LinkedList: Encodable where T: Encodable {
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.unkeyedContainer()
        try container.encode(contentsOf: self)
    }
}

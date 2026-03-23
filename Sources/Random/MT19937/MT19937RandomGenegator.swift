//
//  Created by Vitali Kurlovich on 4.04.25.
//

import struct Foundation.UUID

public struct MT19937RandomGenegator: RandomNumberGenerator {
    @usableFromInline var state: MT19937x64

    @inlinable
    public mutating func next() -> UInt64 {
        state.random()
    }
}

public extension MT19937RandomGenegator {
    init(seed: UInt64) {
        self.init(state: .init(seed: seed))
    }

    @inlinable init(uuid: UUID = UUID()) {
        self.init(seed: uuid.seed)
    }
}

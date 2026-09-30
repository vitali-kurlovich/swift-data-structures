//
//  Created by Kurlovich Vitali on 9/30/26.
//

public protocol PersistentKeyValueStorage {
    associatedtype Key
    associatedtype Value
    associatedtype PersistentOutput: Sequence<(key: Key, value: Value)>

    func load() throws -> PersistentOutput
    func save(_ cachedData: any Sequence<(key: Key, value: Value)>) throws
}

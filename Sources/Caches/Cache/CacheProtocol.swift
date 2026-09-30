//
//  Created by Kurlovich Vitali on 9/30/26.
//

public protocol CacheProtocol: AnyObject {
    associatedtype Key: Hashable
    associatedtype Value
    func pull(key: Key) -> Value?
    func push(key: Key, value: Value, cost: Int)
    func push(key: Key, value: Value)

    func remove(for key: Key)

    subscript(_: Key) -> Value? { get set }
}

public extension CacheProtocol {
    func push(key: Key, value: Value) {
        push(key: key, value: value, cost: 0)
    }

    subscript(_ key: Key) -> Value? {
        get {
            pull(key: key)
        }
        set {
            if let newValue {
                push(key: key, value: newValue)
            } else {
                remove(for: key)
            }
        }
    }
}

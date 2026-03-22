//
//  BloomFilter.swift
//  swift-data-structures
//
//  Created by Vitali Kurlovich on 21.03.26.
//

import Collections

public protocol BloomFilterConfiguration {
    static var size: UInt { get }
}

public struct BloomFilter<Configuration: BloomFilterConfiguration, Item: Hashable> {
    var storage: BitArray

    public init() {
        storage = BitArray(repeating: false, count: Int(Configuration.size))
    }
}

public extension BloomFilter {
    mutating func insert(_ item: Item) {
        var hasher = Hasher()
        item.hash(into: &hasher)
        let hash = UInt(bitPattern: hasher.finalize())

        let offset = BitArray.Index(hash % Configuration.size)

        storage[offset] = true
    }

    func contains(_ item: Item) -> Bool {
        var hasher = Hasher()
        item.hash(into: &hasher)
        let hash = UInt(bitPattern: hasher.finalize())

        let offset = BitArray.Index(hash % Configuration.size)

        return storage[offset]
    }
    
    
}

public extension BloomFilter {
    mutating func removeAll() {
        storage.fill(with: false)
    }
}

public enum Size128: BloomFilterConfiguration {
    @inlinable
    public static var size: UInt { 128 }
}

public enum Size256: BloomFilterConfiguration {
    @inlinable
    public static var size: UInt { 256 }
}

public enum Size512: BloomFilterConfiguration {
    @inlinable
    public static var size: UInt { 512 }
}

public enum Size1024: BloomFilterConfiguration {
    @inlinable
    public static var size: UInt { 1024 }
}

public enum Size2048: BloomFilterConfiguration {
    @inlinable
    public static var size: UInt { 2048 }
}

public enum Size4096: BloomFilterConfiguration {
    @inlinable
    public static var size: UInt { 4096 }
}

public enum Size8192: BloomFilterConfiguration {
    @inlinable
    public static var size: UInt { 8192 }
}

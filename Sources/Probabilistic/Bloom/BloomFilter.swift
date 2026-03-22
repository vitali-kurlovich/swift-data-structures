//
//  Created by Vitali Kurlovich on 21.03.26.
//

import BitCollections
import Collections

public protocol BloomFilterConfiguration {
    /// Bloom filter size (number of bits)
    static var size: UInt { get }
}

/// A Bloom filter is a space-efficient probabilistic data structure that is used to test whether an element is a member of a set.
///
/// [wiki Bloom filter](https://en.wikipedia.org/wiki/Bloom_filter)
public struct BloomFilter<Configuration: BloomFilterConfiguration, Element: Hashable> {
    @usableFromInline
    var storage: BitArray

    @inlinable
    public init() {
        storage = BitArray(repeating: false, count: Int(Configuration.size))
    }
}

public extension BloomFilter {
    /// Insert element to the filter
    ///
    /// - Parameter element: inseted element
    ///
    /// - Complexity: O(1)
    @inlinable
    mutating func insert(_ element: Element) {
        var hasher = Hasher()
        element.hash(into: &hasher)
        let hash = UInt(bitPattern: hasher.finalize())

        let offset = BitArray.Index(hash % Configuration.size)

        storage[offset] = true
    }

    /// Checking if an element might exist in the filter
    ///
    /// - Parameter element:the element for the checking
    ///
    /// - Returns: If false, guarantees the absence of an element in the filter; if true, the filter possibly contains the element, but it can be a false positive result. [more info](https://en.wikipedia.org/wiki/Bloom_filter#Probability_of_false_positives)
    ///
    /// - Complexity: O(1)
    @inlinable
    func contains(_ element: Element) -> Bool {
        var hasher = Hasher()
        element.hash(into: &hasher)
        let hash = UInt(bitPattern: hasher.finalize())

        let offset = BitArray.Index(hash % Configuration.size)
        return storage[offset]
    }
}

public extension BloomFilter {
    /// Reset the filter, all elements set to false
    @inlinable
    mutating func removeAll() {
        storage.fill(with: false)
    }
}

/// Configuration for a 128-bit Bloom filter
public enum Size128: BloomFilterConfiguration {
    @inlinable
    public static var size: UInt { 128 }
}

/// Configuration for a 256-bit Bloom filter
public enum Size256: BloomFilterConfiguration {
    @inlinable
    public static var size: UInt { 256 }
}

/// Configuration for a 512-bit Bloom filter
public enum Size512: BloomFilterConfiguration {
    @inlinable
    public static var size: UInt { 512 }
}

/// Configuration for a 1024-bit Bloom filter
public enum Size1024: BloomFilterConfiguration {
    @inlinable
    public static var size: UInt { 1024 }
}

/// Configuration for a 2048-bit Bloom filter
public enum Size2048: BloomFilterConfiguration {
    @inlinable
    public static var size: UInt { 2048 }
}

/// Configuration for a 4096-bit Bloom filter
public enum Size4096: BloomFilterConfiguration {
    @inlinable
    public static var size: UInt { 4096 }
}

/// Configuration for a 8192-bit Bloom filter
public enum Size8192: BloomFilterConfiguration {
    @inlinable
    public static var size: UInt { 8192 }
}

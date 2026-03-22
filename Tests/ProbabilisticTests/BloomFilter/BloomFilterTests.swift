
@testable import Probabilistic
import Testing

@Suite("BloomFilter")
struct BloomFilterTests {}

extension BloomFilterTests {
    @Test("Mutations")
    func mutations() throws {
        mutation(type: Size128.self, range: stride(from: 1, to: 2000, by: 4))
        mutation(type: Size256.self, range: stride(from: 1, to: 2000, by: 4))
        mutation(type: Size512.self, range: stride(from: 1, to: 20000, by: 10))
        mutation(type: Size1024.self, range: stride(from: 1, to: 20000, by: 10))
        mutation(type: Size2048.self, range: stride(from: 1, to: 20000, by: 10))
        mutation(type: Size4096.self, range: stride(from: 1, to: 20000, by: 10))
        mutation(type: Size8192.self, range: stride(from: 1, to: 20000, by: 10))
    }

    func mutation<Configuration>(type _: Configuration.Type, range: StrideTo<Int>) where Configuration: BloomFilterConfiguration {
        var bloom = BloomFilter<Configuration, Int>()

        for item in range.min()! ..< range.max()! {
            #expect(bloom.contains(item) == false)
        }

        for item in range {
            bloom.insert(item)
        }

        for item in range {
            #expect(bloom.contains(item))
        }

        for item in range.min()! ..< range.max()! {
            if bloom.contains(item) == false {
                #expect(range.contains(item) == false)
            }
        }

        bloom.removeAll()

        for item in range.min()! ..< range.max()! {
            #expect(bloom.contains(item) == false)
        }
    }
}

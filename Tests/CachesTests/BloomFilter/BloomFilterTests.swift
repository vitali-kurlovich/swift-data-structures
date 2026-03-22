
@testable import Caches
import Testing

@Suite("BloomFilter")
struct BloomFilterTests {}

extension BloomFilterTests {
    @Test("Mutations")
    func mutations() throws {
        var bloom = BloomFilter<Size256, Int>()

        let range = stride(from: 1, to: 2000, by: 4)
        
        for item in 1 ..< 2000 {
            #expect(bloom.contains(item) == false)
        }

        for item in range {
            bloom.insert(item)
        }

       
        
        
        for item in range {
            #expect(bloom.contains(item))
        }
        
        for item in 1 ..< 2000 {
           
            
            if bloom.contains(item) == false {
                #expect(range.contains(item) == false)
            }
            
        }
        
        
        bloom.removeAll()
        
        for item in 1 ..< 2000 {
            #expect(bloom.contains(item) == false)
        }
    }
}

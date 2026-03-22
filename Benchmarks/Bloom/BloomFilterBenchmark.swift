//
//  Created by Vitali Kurlovich on 22.03.26.
//

import Benchmarks
import Probabilistic

struct BloomFlilterBenchmark<Configuration: BloomFilterConfiguration> {
    let insertions: Int

    var name: String {
        "BloomFlilter<\(Configuration.size), Int> insertions:\(insertions.formatted())"
    }

    func run() {
        var bloom = BloomFilter<Configuration, Int>()

        for item in stride(from: 0, to: insertions * 10, by: 10) {
            bloom.insert(item)

            _ = bloom.contains(item - 1)
        }

        blackHole(bloom)
    }
}

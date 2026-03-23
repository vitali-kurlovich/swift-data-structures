//
//  Created by Vitali Kurlovich on 6.03.26.
//

import Benchmarks
import Random

extension BenchmarkCLI {
    func runRandomGeneratorBenchmark() {
        let benchmark = BenchmarkExecuter(name: "RandomNumberGenerator", repeatCount: self.repeat)

        let count = 10_000_000

        let mt19937Benshmark = RandomGeneratorBenchmark(count: count, MT19937RandomGenegator())

        benchmark(name: mt19937Benshmark.description) {
            mt19937Benshmark.run()
        }

        benchmark(name: "SwiftRandomGenegator") {
            for _ in 0 ..< count {
                _ = UInt64.random(in: UInt64.min ... UInt64.max)
            }

            blackHole(UInt64.random(in: UInt64.min ... UInt64.max))
        }

        benchmark.start()
    }
}

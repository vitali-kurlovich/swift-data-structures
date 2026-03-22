//
//  Created by Vitali Kurlovich on 22.03.26.
//

import Benchmarks
import Probabilistic

extension BenchmarkCLI {
    @available(macOS 13.0, iOS 16.0, watchOS 9.0, tvOS 16.0, *)
    func runBloomFilterBenchmark() {
        runBloomFilterBenchmark(insertions: 1_000_000)
        runBloomFilterBenchmark(insertions: 10_000_000)
    }
}

extension BenchmarkCLI {
    @available(macOS 13.0, iOS 16.0, watchOS 9.0, tvOS 16.0, *)
    private func runBloomFilterBenchmark(insertions: Int) {
        let benchmark = BenchmarkExecuter(repeatCount: self.repeat, warmingDuration: .zero)

        let count = insertions
        let bloomFlilter128 = BloomFlilterBenchmark<Size128>(insertions: count)
        let bloomFlilter256 = BloomFlilterBenchmark<Size256>(insertions: count)
        let bloomFlilter512 = BloomFlilterBenchmark<Size512>(insertions: count)
        let bloomFlilter1024 = BloomFlilterBenchmark<Size1024>(insertions: count)
        let bloomFlilter2048 = BloomFlilterBenchmark<Size2048>(insertions: count)

        benchmark(name: bloomFlilter128.name) {
            bloomFlilter128.run()
        }

        benchmark(name: bloomFlilter256.name) {
            bloomFlilter256.run()
        }

        benchmark(name: bloomFlilter512.name) {
            bloomFlilter512.run()
        }

        benchmark(name: bloomFlilter1024.name) {
            bloomFlilter1024.run()
        }

        benchmark(name: bloomFlilter2048.name) {
            bloomFlilter2048.run()
        }

        benchmark.start()
    }
}

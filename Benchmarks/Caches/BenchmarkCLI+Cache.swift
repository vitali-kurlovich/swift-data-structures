//
//  Created by Vitali Kurlovich on 8.03.26.
//

import Benchmarks
import Caches

extension BenchmarkCLI {
    @available(macOS 13.0, iOS 16.0, watchOS 9.0, tvOS 16.0, *)
    func runCacheBenchmark() {
        runCacheIntBenchmark()
        // runCacheStrigBenchmark()
    }
}

extension BenchmarkCLI {
    @available(macOS 13.0, iOS 16.0, watchOS 9.0, tvOS 16.0, *)
    func runCacheIntBenchmark() {
        let benchmark = BenchmarkExecuter(repeatCount: self.repeat, warmingDuration: .zero)

        let count = 1_000_000

        let cacheTotalCount = CacheTotalCountBenchmark(count: count, countLimit: 100)
        let nsCacheTotalCount = NSCacheTotalCountBenchmark(count: count, countLimit: 100)

        benchmark(name: cacheTotalCount.name) {
            cacheTotalCount.run()
        }

        benchmark(name: nsCacheTotalCount.name) {
            nsCacheTotalCount.run()
        }

        let cacheTotalCount_2 = CacheTotalCountBenchmark(count: count, countLimit: 10000)
        let nsCacheTotalCount_2 = NSCacheTotalCountBenchmark(count: count, countLimit: 10000)

        benchmark(name: cacheTotalCount_2.name) {
            cacheTotalCount_2.run()
        }

        benchmark(name: nsCacheTotalCount_2.name) {
            nsCacheTotalCount_2.run()
        }
        benchmark.start()
    }

    @available(macOS 13.0, iOS 16.0, watchOS 9.0, tvOS 16.0, *)
    func runCacheStrigBenchmark() {
        let benchmark = BenchmarkExecuter(repeatCount: self.repeat, warmingDuration: .zero)

        let count = 1_000_000

        let cacheStrTotalCount = CacheStringTotalCountBenchmark(count: count, countLimit: 100)
        let nsCacheStrTotalCount = NSCacheStringTotalCountBenchmark(count: count, countLimit: 100)

        benchmark(name: cacheStrTotalCount.name) {
            cacheStrTotalCount.run()
        }

        benchmark(name: nsCacheStrTotalCount.name) {
            nsCacheStrTotalCount.run()
        }

        let nsCacheStrTotalCount_2 = NSCacheStringTotalCountBenchmark(count: count, countLimit: 10000)
        let cacheStrTotalCount_2 = CacheStringTotalCountBenchmark(count: count, countLimit: 10000)

        benchmark(name: cacheStrTotalCount_2.name) {
            cacheStrTotalCount_2.run()
        }

        benchmark(name: nsCacheStrTotalCount_2.name) {
            nsCacheStrTotalCount_2.run()
        }

        benchmark.start()
    }
}

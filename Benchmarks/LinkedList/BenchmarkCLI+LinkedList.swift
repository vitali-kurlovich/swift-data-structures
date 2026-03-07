//
//  Created by Vitali Kurlovich on 8.03.26.
//

import Benchmarks
import Lists

extension BenchmarkCLI {
    @available(macOS 13.0, iOS 16.0, watchOS 9.0, tvOS 16.0, *)
    func runLinkedListBenchmark() {
        let benchmark = BenchmarkExecuter(repeatCount: self.repeat, warmingDuration: .zero)

        let count = 1_000_000

        let linkedList = LinkedListAppendBenchmark(count: count)

        benchmark(name: linkedList.name) {
            linkedList.run()
        }

        let array = ArrayAppendBenchmark(count: count)

        benchmark(name: array.name) {
            array.run()
        }

        benchmark.start()
    }
}

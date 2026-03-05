//
//  Created by Vitali Kurlovich on 5.03.26.
//

import ArgumentParser
import Benchmarks

@main
struct BenchmarkCLI: ParsableCommand {
    @Argument(help: "The phrase to repeat.")
    var `repeat`: Int = 5

    mutating func run() throws {
        if #available(macOS 13.0, iOS 16.0, watchOS 9.0, tvOS 16.0, *) {
            runBenchmark()
        } else {
            print("Cannot be run on this os version.")
        }
    }
}

extension BenchmarkCLI {
    @available(macOS 13.0, iOS 16.0, watchOS 9.0, tvOS 16.0, *)
    func runBenchmark() {
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

//
//  Created by Vitali Kurlovich on 6.03.26.
//
import Benchmarks
import Random

extension BenchmarkCLI {
    func runShuffleBenchmark() {
        let benchmark = BenchmarkExecuter(name: "Shuffle", repeatCount: self.repeat)

        let count = 100_000

        let mt19937_10 = ShuffleBenchmark(count: count, arraySize: 10, generator: MT19937RandomGenegator(), algorithm: .default)

        benchmark(name: mt19937_10.description) {
            mt19937_10.run()
        }

        let configuration = FaroShuffleConfiguration(count: 10, middleShiftRange: -3 ... 3, stuckCardsRange: 1 ... 3)

        let mt19937_faro_10 = ShuffleBenchmark(count: count, arraySize: 10, generator: MT19937RandomGenegator(), algorithm: .faro(configuration))

        benchmark(name: mt19937_faro_10.description) {
            mt19937_faro_10.run()
        }

        let mt19937_100 = ShuffleBenchmark(count: count, arraySize: 100, generator: MT19937RandomGenegator(), algorithm: .default)

        benchmark(name: mt19937_100.description) {
            mt19937_100.run()
        }

        let mt19937_faro_100 = ShuffleBenchmark(count: count, arraySize: 100, generator: MT19937RandomGenegator(), algorithm: .faro(configuration))

        benchmark(name: mt19937_faro_100.description) {
            mt19937_faro_100.run()
        }

        benchmark.start()
    }
}

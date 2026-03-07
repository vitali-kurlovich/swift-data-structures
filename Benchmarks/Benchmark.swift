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
            // runLinkedListBenchmark()
            runCacheBenchmark()
        } else {
            print("Cannot be run on this os version.")
        }
    }
}

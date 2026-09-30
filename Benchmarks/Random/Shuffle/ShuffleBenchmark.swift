//
//  Created by Vitali Kurlovich on 6.03.26.
//

import Benchmarks
import Random

struct ShuffleBenchmark<R: RandomNumberGenerator>: CustomStringConvertible {
    let count: Int
    let arraySize: Int

    let generator: R

    let algorithm: ShuffleAlgorithm

    private let _description: String

    var description: String {
        _description.isEmpty ? "\(algorithm.description) \(String(describing: R.self)) (\(arraySize))" : _description
    }

    init(count: Int = 100_000, arraySize: Int, generator: R, algorithm: ShuffleAlgorithm, description: String = "") {
        self.count = count
        self.arraySize = arraySize
        self.generator = generator
        self.algorithm = algorithm
        _description = description
    }

    func run() {
        assert(arraySize > 0)

        var generator = generator
        var array = (1 ... arraySize).map(\.self)

        for _ in 0 ..< count {
            array.shuffle(algorithm: algorithm, using: &generator)
        }

        blackHole(array.first)
    }
}

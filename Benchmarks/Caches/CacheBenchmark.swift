//
//  Created by Vitali Kurlovich on 8.03.26.
//

import Benchmarks
import Caches
import Foundation

struct CacheTotalCountBenchmark {
    let count: Int
    let countLimit: Int

    var name: String {
        "Cache<Int, Int> \(count.formatted()) limit:\(countLimit.formatted())"
    }

    func run() {
        let cache = Cache<Int, Int>(countLimit: countLimit)

        for value in 0 ..< count {
            cache[value] = value

            let prev = cache[value - 1]
            blackHole(prev)
        }

        blackHole(cache[0])
    }
}

struct CacheStringTotalCountBenchmark {
    let count: Int
    let countLimit: Int

    var name: String {
        "Cache<Str, Str> \(count.formatted()) limit:\(countLimit.formatted())"
    }

    func run() {
        let cache = Cache<String, String>(countLimit: countLimit)

        for value in 0 ..< count {
            let string = String(value)
            cache[string] = string

            let prev = cache[string]
            blackHole(prev)
        }

        blackHole(cache["1"])
    }
}

struct NSCacheTotalCountBenchmark {
    let count: Int
    let countLimit: Int

    var name: String {
        "NSCache<Num, Num> \(count.formatted()) limit:\(countLimit.formatted())"
    }

    func run() {
        let cache = NSCache<NSNumber, NSNumber>()
        cache.countLimit = countLimit
        for value in 0 ..< count {
            let number = NSNumber(value: value)
            cache.setObject(number, forKey: number)

            let prev = cache.object(forKey: NSNumber(value: value - 1))
            blackHole(prev)
        }

        blackHole(cache.object(forKey: NSNumber(value: 0)))
    }
}

struct NSCacheStringTotalCountBenchmark {
    let count: Int
    let countLimit: Int

    var name: String {
        "NSCache<Str, Str> \(count.formatted()) limit:\(countLimit.formatted())"
    }

    func run() {
        let cache = NSCache<NSString, NSString>()
        cache.countLimit = countLimit

        for value in 0 ..< count {
            let number = NSNumber(value: value)
            let string = number.stringValue as NSString
            cache.setObject(string, forKey: string)

            let prev = cache.object(forKey: string)
            blackHole(prev)
        }

        blackHole(cache.object(forKey: "1"))
    }
}

//
//  Created by Kurlovich Vitali on 9/30/26.
//

import Foundation

public protocol FileStorage {
    var fileUrl: URL { get }

    /**
     Save file to fileUrl
     */
    func saveFile(_ data: Data) throws

    /**
     Load file from fileUrl
     */
    func loadFile() throws -> Data
    /**
     Remove file at fileUrl
     */
    func removeFile() throws
}

public extension FileStorage {
    func removeFile() throws {
        try FileManager.default.removeItem(at: fileUrl)
    }

    func saveFile(_ data: Data) throws {
        try data.write(to: fileUrl, options: .atomic)
    }

    func loadFile() throws -> Data {
        try Data(contentsOf: fileUrl)
    }
}

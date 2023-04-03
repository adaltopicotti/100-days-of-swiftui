//
//  FileManager-DocumentsDirectory.swift
//  ConsolidationVI
//
//  Created by Adalto Picotti Junior on 27/03/23.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

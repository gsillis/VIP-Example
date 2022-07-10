//
//  Bundle+Extensions.swift
//  ScoopsAndScones
//
//  Created by Gabriela Sillis on 10/07/22.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(_ type: T.Type, from file: String) -> T {
        guard let bundleUrl = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failled to locate \(file) in bundle.")
        }
         
        guard let data = try? Data(contentsOf: bundleUrl) else {
            fatalError("Failed to load \(file) from bundle")
        }
        
        let decoder = JSONDecoder()
        guard let loaded = try? decoder.decode(type.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle")
        }
        return loaded
    }
}

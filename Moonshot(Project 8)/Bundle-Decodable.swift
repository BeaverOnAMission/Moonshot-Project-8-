//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Paul Hudson on 09/11/2021.
//
//

import Foundation

extension Bundle {
    func decode <T: Codable>(_ file:String)-> T {
        guard let url = self.url(forResource: file, withExtension: nil)
        else {
            fatalError("failed to find \(file)")
        }
        guard let data = try? Data(contentsOf: url)
        else{
            fatalError("failed to load \(file)")
        }
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        guard let loaded = try? decoder.decode(T.self, from: data)
        else{
            fatalError("failed to decode \(file)")
        }
        return loaded
    }
}


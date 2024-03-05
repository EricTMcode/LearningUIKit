//
//  Utils.swift
//  LearningUIKit
//
//  Created by Eric on 05/03/2024.
//

import Foundation

let apiKey = "11c5611fd9b625d18ecf5e2ea326b6cb"

let jsonDecoder: JSONDecoder = {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    return decoder
}()

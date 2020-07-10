//
//  TranslationData.swift
//  Le Baluchon
//
//  Created by rochdi ben abdeljelil on 28.05.2020.
//  Copyright © 2020 rochdi ben abdeljelil. All rights reserved.
//

import Foundation

struct TranslateData: Decodable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Decodable {
    let translations: [Translation]
}

// MARK: - Translation
struct Translation: Decodable {
    let translatedText: String
}

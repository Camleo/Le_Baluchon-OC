//
//  TranslationData.swift
//  Le Baluchon
//
//  Created by rochdi ben abdeljelil on 28.05.2020.
//  Copyright © 2020 rochdi ben abdeljelil. All rights reserved.
//

import Foundation
import UIKit

struct TranslateResult: Decodable {
    var result: String
}
struct LanguageOrigin: Decodable {
    var data : TranslationData
}
struct TranslationData: Decodable {
    let translations: [TranslationText]
}

struct TranslationText: Decodable {
    let translatedText: String
}
struct Translate {
    let source: Language
    let target: Language
    let text: String
    let format = "text"

    init(source: Language, text: String) {
        self.source = source
        self.target = (source == .fr) ? .en : .fr
        self.text = text
    }
}
enum Language: String {
    case fr
    case en
}

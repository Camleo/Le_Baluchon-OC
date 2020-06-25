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

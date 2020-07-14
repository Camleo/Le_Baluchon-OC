//
//  Translate.swift
//  Le_Baluchon OC
//
//  Created by rochdi ben abdeljelil on 10.07.2020.
//  Copyright © 2020 rochdi ben abdeljelil. All rights reserved.
//

import Foundation

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

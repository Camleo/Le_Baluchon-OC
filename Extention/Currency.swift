//
//  Currency.swift
//  Le Baluchon
//
//  Created by rochdi ben abdeljelil on 02.06.2020.
//  Copyright © 2020 rochdi ben abdeljelil. All rights reserved.
//

import Foundation

struct Currency: Decodable {
    let rates: [String: Double]
}

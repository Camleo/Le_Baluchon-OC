//
//  UIView.swift
//  Le Baluchon
//
//  Created by rochdi ben abdeljelil on 28.05.2020.
//  Copyright © 2020 rochdi ben abdeljelil. All rights reserved.
//

import UIKit
extension UIView {
    
    func rotateIt() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: { () -> Void in
            self.transform = CGAffineTransform(rotationAngle: .pi)
        })
        self.transform = CGAffineTransform.identity
    }
}

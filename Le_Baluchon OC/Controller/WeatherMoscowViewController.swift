//
//  WeatherMoscowViewController.swift
//  Le_Baluchon OC
//
//  Created by rochdi ben abdeljelil on 24.06.2020.
//  Copyright © 2020 rochdi ben abdeljelil. All rights reserved.
//

import UIKit

class WeatherMoscowViewController: UIViewController {
    var imageView: UIImageView = {
           let imageView = UIImageView(frame: .zero)
           imageView.image = UIImage(named: "Moscow")
           imageView.contentMode = .scaleToFill
           imageView.translatesAutoresizingMaskIntoConstraints = false
           return imageView
       }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.insertSubview(imageView, at: 0)
               NSLayoutConstraint.activate([
                   imageView.topAnchor.constraint(equalTo: view.topAnchor),
                   imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                   imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                   imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
               ])
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
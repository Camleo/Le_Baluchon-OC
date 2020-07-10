//
//  WeatherViewController.swift
//  Le_Baluchon OC
//
//  Created by rochdi ben abdeljelil on 24.06.2020.
//  Copyright © 2020 rochdi ben abdeljelil. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "temps")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var openWeatherMapService = OpenWeatherMapService()
    var weathersData = [WeatherData]()
    
    @IBOutlet  var temperatureLabel: [UILabel]!
    @IBOutlet  var cityLabel: [UILabel]!
    @IBOutlet  var conditionIcon: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
                view.insertSubview(imageView, at: 0)
                NSLayoutConstraint.activate([
                    imageView.topAnchor.constraint(equalTo: view.topAnchor),
                    imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
                ])
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupLocationManager()
    }
    
    func setupLocationManager() {
        openWeatherMapService.getWeather { result  in
            switch result {
            case.success(let data):
                DispatchQueue.main.async {
                    self.update(cities: data)
                }
            case.failure(let error):
                print(error)
            }
        }
    }
    func setupViews() {
        for i in 0...1{
            conditionIcon[i].image = UIImage(named: "Cloud-Refresh")
            temperatureLabel[i].text = "--℃"
            cityLabel[i].text = "Uptading..."
        }
    }
    private func update(cities: [WeatherData]) {
        for i in 0...1 {
            cityLabel[i].text = cities[i].cityName
            temperatureLabel[i].text = cities[i].temperatureString
            conditionIcon[i].image = UIImage(named: cities[i].updateWeatherIcon(to: cities[i].conditionId))
        }
        
    }
}

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
           imageView.image = UIImage(named: "New York")
           imageView.contentMode = .scaleToFill
           imageView.translatesAutoresizingMaskIntoConstraints = false
           return imageView
       }()
    
     private let services: Services = Services()
    
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var conditionIcon: UIImageView!
    
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
    
    @IBAction func nextScreenTapped(_ sender: UIButton) {
         performSegue(withIdentifier: "goToMoscow", sender: self)
    }
    func setupLocationManager() {
       guard let url = URL(string: "http://api.openweathermap.org/data/2.5/group?") else { return }
       services.request(baseUrl: url, parameters: [("appid, id, units", "8d0fa7235e4cdb66eb8396aac54230, 5128581,524901, metric")]) { [unowned self] (result : Result<WeatherJSON, NetWorkError>) in
               switch result {
               case .success(let data):
                   DispatchQueue.main.async {
                    //self.update(weather: data)
                    print(data)
                  }
               case.failure(let error):
                   print(error)
               }
           }
       }
    
//    func readJSON(_ weatherDataModel: Data) -> WeatherDataModel? {
//           let decoder = JSONDecoder()
//           do {
//               let decoderData = try decoder.decode(WeatherJSON.self, from: weatherDataModel)
//
//               let id = decoderData.list[0].weather[0].id
//               let temp = decoderData.list[0].main.temp
//               let name = decoderData.list[0].name
//
//               let idMoscow = decoderData.list[1].weather[0].id
//               let tempMoscow = decoderData.list[1].main.temp
//               let nameMoscow = decoderData.list[1].name
//
//               let weather = WeatherDataModel(temperature: temp, condition: id, cityName: name, temperatureMoscow: tempMoscow, cityMoscow: nameMoscow, conditionMoscow: idMoscow)
//
//               return weather
//           }catch {
//               print(error)
//               return nil
//           }
//       }
    
    private func update(weather: WeatherDataModel) {
           cityLabel.text = weather.cityName
           tempLabel.text = weather.temperatureString
           conditionIcon.image = UIImage(imageLiteralResourceName: weather.conditionName)
       }
    
}

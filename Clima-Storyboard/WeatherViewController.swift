//
//  ViewController.swift
//  Clima-Storyboard
//
//  Created by iOS - Developer on 03.08.2023.
//

import UIKit

final class WeatherViewController: UIViewController, UITextFieldDelegate, WeatherManagerDelegate {
  
    @IBOutlet var conditionImageView: UIImageView!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var searchTextFiled: UITextField!
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherManager.delegate = self
        searchTextFiled.delegate = self
    }

    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextFiled.endEditing(true)
        print(searchTextFiled.text!)
    }
    
    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextFiled.endEditing(true)
        print(searchTextFiled.text!)
        return true
    }
    
    internal func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            searchTextFiled.placeholder = "Type something"
            return false
        }
    }
    
    internal func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTextFiled.text {
            weatherManager.fetchWeather(cityName: city)
        }
        searchTextFiled.text = ""
    }
    
    func didUpdateWether(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            self.cityLabel.text = weather.cityName
        }
    }
    func didFailWithError(error: Error) {
        print(error)
    }
}


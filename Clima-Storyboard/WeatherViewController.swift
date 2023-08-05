//
//  ViewController.swift
//  Clima-Storyboard
//
//  Created by iOS - Developer on 03.08.2023.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var conditionImageView: UIImageView!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var searchTextFiled: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        searchTextFiled.text = ""
    }
}


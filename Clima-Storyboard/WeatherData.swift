//
//  WeatherData.swift
//  Clima-Storyboard
//
//  Created by iOS - Developer on 06.08.2023.
//

import Foundation

struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
    let clouds: Clouds
}

struct Main: Decodable {
    let temp: Double
}

struct Weather: Decodable {
    let description: String
}

struct Clouds: Decodable {
    let all: Int
}

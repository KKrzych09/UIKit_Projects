//
//  WeatherData.swift
//  Clima
//
//  Created by Kamil Krzych on 21/10/2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
    let feels_like: Double
}

struct Weather: Codable {
    let description: String
    let id: Int
}

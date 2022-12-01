//
//  ForecastData.swift
//  Clima
//
//  Created by Kamil Krzych on 25/11/2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct ForecastData: Codable {
    let list: [List]
}

struct List: Codable {
    let dt: Int
    let main: ForecastMain
    let weather: [ForecastWeather]
}

struct ForecastMain: Codable {
    let temp: Double
}

struct ForecastWeather: Codable {
    let id: Int
}

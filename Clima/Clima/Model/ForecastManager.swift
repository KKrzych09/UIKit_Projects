//
//  ForecastManager.swift
//  Clima
//
//  Created by Kamil Krzych on 25/11/2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

protocol ForecastManagerDelegate {
    func didUpdateForecast(_ forecastManager: ForecastManager, forecast: ForecastModel)
    func didFailWithError(error: Error)
}

struct ForecastManager {
    let forecastURL = "https://api.openweathermap.org/data/2.5/forecast?appid=2e4cf59d25d649195f98c011815eb934&units=metric"
    
    var delegate: ForecastManagerDelegate?
    
    func fetchForecast(cityName: String) {
        let urlString = "\(forecastURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func fetchForecast(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "\(forecastURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        // 1. Create a URL
        if let url = URL(string: urlString) {
            
            // 2. Create a URLSession
            let session = URLSession(configuration: .default)
            
            // 3. Give the session a task
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let forecast = self.parseJSON(safeData) {
                        self.delegate?.didUpdateForecast(self, forecast: forecast)
                    }
                }
            }
            
            // 4. Start the task
            task.resume()
        }
    }
    
    func parseJSON(_ forecastData: Data) -> ForecastModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(ForecastData.self, from: forecastData)
            let id = decodedData.list[0].weather[0].id
            let temp = decodedData.list[0].main[0].temp
            let dt = decodedData.list[0].dt
            
            let forecast = ForecastModel(conditionId: id, temperature: temp, dateTime: dt)
            return forecast
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}

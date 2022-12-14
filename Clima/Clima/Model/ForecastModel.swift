//
//  ForecastModel.swift
//  Clima
//
//  Created by Kamil Krzych on 25/11/2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation


struct ForecastModel: Equatable {
    let conditionId: Int
    let temperature: Double
    let dateTime: Double
    let dateTxt: String
    
    var dateTimeString: String {
        let date = Date(timeIntervalSince1970: dateTime)
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "MMM d, yyyy"
        
        return dateFormatter.string(from: date)
    }
    
    var dayTimeString: String {
        let date = Date(timeIntervalSince1970: dateTime)
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "EEEE"
        
        return dateFormatter.string(from: date)
    }
    
    var hourTimeString: String {
        let date = dateTxt
        let dateEndIndex = date.endIndex
        let dateStartIndex = date.index(dateEndIndex, offsetBy: -8)
        let range = Range(uncheckedBounds: (lower: dateStartIndex, upper: dateEndIndex))
        
        let result = String(date[range])
        
        return result
    }
    
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
    var conditionName: String {
        switch conditionId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
}

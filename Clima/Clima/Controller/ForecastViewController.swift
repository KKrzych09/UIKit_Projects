//
//  ForecastViewController.swift
//  Clima
//
//  Created by Kamil Krzych on 23/11/2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

class ForecastViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var forecasts = [ForecastModel]()
    
    var forecastManager = ForecastManager()
    let locationManager = CLLocationManager()
    
    var receivedCity = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        forecastManager.delegate = self
        
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "ForecastCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
       
    }
}

//MARK: - Forecast TableViewDataSource

extension ForecastViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! ForecastCell
        
        cell.dayLabel.text = forecasts[indexPath.row].dayTimeString
        cell.dateLabel.text = forecasts[indexPath.row].dateTimeString
        cell.tempLabel.text = forecasts[indexPath.row].temperatureString
        cell.cellConditionImage.image = UIImage(systemName: forecasts[indexPath.row].conditionName)
        return cell
    }
}


//MARK: - ForecastManagerDelegate

extension ForecastViewController: ForecastManagerDelegate {
    func didUpdateForecast(_ forecastManager: ForecastManager, forecast: [ForecastModel]) {
        
        self.forecasts = forecast
//        print(self.forecasts)
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    func didFailWithError(error: Error) {
        print(error)
    }
}



//MARK: - CLLocationManagerDelegate

extension ForecastViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            if self.receivedCity != "" {
                forecastManager.fetchForecast(cityName: self.receivedCity)
                self.receivedCity = ""
            } else {
                forecastManager.fetchForecast(latitude: lat, longitude: lon)
            }
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

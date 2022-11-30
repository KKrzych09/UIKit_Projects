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
    
    var forecasts = [ForecastModel(conditionId: 313, temperature: 13.59, dateTime: 123123)]
    
    var forecastManager = ForecastManager()
    let locationManager = CLLocationManager()
    
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
        
        cell.dayLabel.text = String(forecasts[indexPath.row].dateTime)
        cell.dateLabel.text = String(forecasts[indexPath.row].dateTime)
        cell.tempLabel.text = forecasts[indexPath.row].temperatureString
        cell.cellConditionImage.image = UIImage(systemName: forecasts[indexPath.row].conditionName)
        return cell
    }
}


//MARK: - ForecastManagerDelegate

extension ForecastViewController: ForecastManagerDelegate {
    func didUpdateForecast(_ forecastManager: ForecastManager, forecast: ForecastModel) {
        DispatchQueue.main.async {
            //how to populate reusable cell with API data?
        }
    }

    func didFailWithError(error: Error) {
        print(error)
    }
}



MARK: - CLLocationManagerDelegate

extension ForecastViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            forecastManager.fetchForecast(latitude: lat, longitude: lon)
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

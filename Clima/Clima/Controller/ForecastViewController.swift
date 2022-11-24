//
//  ForecastViewController.swift
//  Clima
//
//  Created by Kamil Krzych on 23/11/2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation
import UIKit

class ForecastViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var forecast: [WeatherModel] = [
        WeatherModel(conditionId: 212, cityName: "Tokyo", temperature: 13.69, feelsLikeTemp: 12.69),
        WeatherModel(conditionId: 313, cityName: "Tokyo", temperature: 11.69, feelsLikeTemp: 10.69),
        WeatherModel(conditionId: 515, cityName: "Tokyo", temperature: 14.69, feelsLikeTemp: 13.69)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
       
    }
}

extension ForecastViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecast.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath)
        
        cell.textLabel?.text = forecast[indexPath.row].temperatureString
        return cell
    }
}

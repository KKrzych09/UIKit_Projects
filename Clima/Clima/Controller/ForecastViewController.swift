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
    
    var forecast: [ForecastModel] = [
        ForecastModel(conditionId: 313, temperature: 13.69, dayTime: 1669366800),
        ForecastModel(conditionId: 515, temperature: 14.69, dayTime: 1669377600),
        ForecastModel(conditionId: 616, temperature: 15.79, dayTime: 1669388400)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "ForecastCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
       
    }
}

extension ForecastViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecast.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! ForecastCell
        
        cell.dayLabel.text = String(forecast[indexPath.row].dayTime)
        cell.dateLabel.text = String(forecast[indexPath.row].dayTime)
        cell.tempLabel.text = forecast[indexPath.row].temperatureString
        return cell
    }
}

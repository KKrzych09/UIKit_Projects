//
//  ViewController.swift
//  musicBuddy
//
//  Created by Kamil Krzych on 21/03/2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    let dataModels: [DataModel] = [
        DataModel(title: "Item 1", subtitle: "Subtitle 1"),
        DataModel(title: "Item 2", subtitle: "Subtitle 2"),
        DataModel(title: "Item 3", subtitle: "Subtitle 3"),
        DataModel(title: "Item 4", subtitle: "Subtitle 4"),
        DataModel(title: "Item 5", subtitle: "Subtitle 5"),
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        let dataModel = dataModels[indexPath.row]
        cell.titleLabel.text = dataModel.title
        cell.subtitleLabel.text = dataModel.subtitle
        return cell
    }

}



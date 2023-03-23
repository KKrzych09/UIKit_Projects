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
    
    @IBAction func showTableView(_ sender: UIButton) {
        tableView.isHidden.toggle()
        
        // fetch data and reload table view
        //fetchData()
        tableView.reloadData()
    }
    
    
    @IBOutlet weak var showTableViewButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.isHidden = true
        
        tableView.dataSource = self
        
        // Button
        showTableViewButton.setTitle("Show/Hide Table View", for: .normal)
        
        // Add button to the view
        view.addSubview(showTableViewButton)
        
        // Add Auto Layout constraints to center button horizontally
        showTableViewButton.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            showTableViewButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showTableViewButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            showTableViewButton.heightAnchor.constraint(equalToConstant: 50),
            showTableViewButton.widthAnchor.constraint(equalToConstant: 200)
        ]

        NSLayoutConstraint.activate(constraints)
        
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



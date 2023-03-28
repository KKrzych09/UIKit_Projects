//
//  ViewController.swift
//  Personali
//
//  Created by Kamil Krzych on 24/03/2023.
//

import UIKit

class PeopleViewController: UIViewController {
    
    private lazy var personVw: PersonView = {
        
        let vw = PersonView { [weak self] in
            self?.sayHello()
        }
        return vw
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
    }


}

private extension PeopleViewController {
    func setup() {
        self.view.backgroundColor = .white
        
        //Actually adding subscribeBtn to the screen
        self.view.addSubview(personVw)
        
        
        //AutoLayout managing my views
         
        // AutoLayout properties to manage location of my views
        NSLayoutConstraint.activate([
            personVw.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            // Setting width to the whole screen
                
                // Pushing 8 from the leading and trailing edge (like padding)
            personVw.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            personVw.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),

        ])
    }
    
    func sayHello() {
        print("Hiya")
    }
}


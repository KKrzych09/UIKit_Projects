//
//  PersonView.swift
//  Personali
//
//  Created by Kamil Krzych on 28/03/2023.
//

import UIKit

class PersonView: UIView {

    private lazy var subscribeBtn: UIButton = {
       
        var config = UIButton.Configuration.filled()
        config.title = "Subscribe".uppercased()
        config.baseBackgroundColor = .red
        config.baseForegroundColor = .white
        config.buttonSize = .large
        config.cornerStyle = .medium
        
        // Now with my config I need to create a button and return it within this closure
        let btn = UIButton(configuration: config)
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        // Adding an action to my button
        btn.addTarget(self, action: #selector(didTapSubscribe), for: .touchUpInside)
        return btn
    }()
    
    private lazy var nameLbl: UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Billy Joe"
        lbl.font = .systemFont(ofSize: 24, weight: .bold)
        return lbl
    }()
    
    private lazy var emailLbl: UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "billy.joe@gmail.com"
        lbl.font = .systemFont(ofSize: 15, weight: .regular)
        return lbl
    }()
    
    private lazy var personStackVw: UIStackView = {
        
        let vw = UIStackView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.axis = .vertical
        vw.spacing = 8
        return vw
    }()
    
    private var action: () -> ()
    
    init(action: @escaping () -> ()) {
        self.action = action
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(name: String, email: String) {
        nameLbl.text = name
        emailLbl.text = email
    }
    
}

private extension PersonView {
    
    func setup() {
        self.layer.cornerRadius = 10
        self.backgroundColor = UIColor.gray.withAlphaComponent(0.1)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(personStackVw)
        
        // Adding view inside stack view
        personStackVw.addArrangedSubview(nameLbl)
        personStackVw.addArrangedSubview(emailLbl)
        personStackVw.addArrangedSubview(subscribeBtn)
        
        //AutoLayout managing my views
         
        // AutoLayout properties to manage location of my views
        NSLayoutConstraint.activate([
            // Pinning personStackVw to all the sides of the container
            personStackVw.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            personStackVw.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            personStackVw.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            personStackVw.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8)
        ])
    }
    
    // Action of my button
    @objc func didTapSubscribe(sender: UIButton) {
        action()
    }
}

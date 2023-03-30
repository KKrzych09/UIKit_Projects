//
//  PersonCollectionViewCell.swift
//  Personali
//
//  Created by Kamil Krzych on 29/03/2023.
//

import UIKit

class PersonCollectionViewCell: UICollectionViewCell {
    
    private var vw: PersonView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension PersonCollectionViewCell {
    
    // Making sure that the view doesn't get created multiple times and added onto screen
    func setup() {
        guard vw == nil else { return }
        
        vw = PersonView {
            
        }
        
        self.contentView.addSubview(vw!)
        
        NSLayoutConstraint.activate([
            vw!.topAnchor.constraint(equalTo: contentView.topAnchor),
            vw!.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            vw!.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            vw!.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])
    }
}

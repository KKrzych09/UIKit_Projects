//
//  ForecastCell2.swift
//  Clima
//
//  Created by Kamil Krzych on 16/12/2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import UIKit

class ForecastCell: UITableViewCell {
    
    
    @IBOutlet weak var forecastCell: UIView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var cellConditionImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        forecastCell.layer.cornerRadius = forecastCell.frame.size.height / 3
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

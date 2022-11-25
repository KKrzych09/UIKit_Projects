//
//  ForecastCell2.swift
//  Clima
//
//  Created by Kamil Krzych on 25/11/2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import UIKit

class ForecastCell: UITableViewCell {

    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var cellConditionImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

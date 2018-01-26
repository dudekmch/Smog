//
//  StationTableViewCell.swift
//  SmogInfo
//
//  Created by Pawel Dudek on 26.01.2018.
//  Copyright © 2018 cookieIT. All rights reserved.
//

import UIKit

class StationTableViewCell: UITableViewCell {
    
    static let identifier = "StationTableViewCell"
    
    let pinFileName = "station_cell_pin"
    
    @IBOutlet weak var stationNameLabel: UILabel!
    @IBOutlet weak var pinImageView: UIImageView!
    
    func setStationName(name: String){
        stationNameLabel.text = name
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        pinImageView.image = UIImage(named: pinFileName)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


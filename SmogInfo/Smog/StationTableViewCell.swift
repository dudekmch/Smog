//
//  CityTableViewCell.swift
//  SmogInfo
//
//  Created by Pawel Dudek on 26.01.2018.
//  Copyright © 2018 cookieIT. All rights reserved.
//

import UIKit

class StationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    
    static let identifier = "CityTableViewCell"
    
    var id : Int?
    var name : String?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
}

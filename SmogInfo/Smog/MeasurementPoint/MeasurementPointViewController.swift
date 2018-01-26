//
//  MeasurementPointViewController.swift
//  SmogInfo
//
//  Created by Pawel Dudek on 26.01.2018.
//  Copyright © 2018 cookieIT. All rights reserved.
//

import UIKit

class MeasurementPointViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var stationId = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(stationId)

        // Do any additional setup after loading the view.
    }


    
}

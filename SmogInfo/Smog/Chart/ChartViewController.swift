//
//  ChartViewController.swift
//  SmogInfo
//
//  Created by Pawel Dudek on 30.01.2018.
//  Copyright © 2018 cookieIT. All rights reserved.
//

import UIKit
import Charts

class ChartViewController: UIViewController {

    var dataForChart = [ValueDataDTO]()
    
    @IBOutlet weak var chartView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    func setDataForChart(data: [ValueDataDTO]){
        dataForChart = data
    }
  
}

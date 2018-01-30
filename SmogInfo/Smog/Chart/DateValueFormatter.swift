//
//  DateValueFormatter.swift
//  SmogInfo
//
//  Created by Pawel Dudek on 30.01.2018.
//  Copyright © 2018 cookieIT. All rights reserved.
//

import Foundation
import Charts

class DateValueFormatter: NSObject, IAxisValueFormatter {

    private let dateFormatter = DateFormatter()

    override init() {
        super.init()
        dateFormatter.dateFormat = "HH:mm"
    }

    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return dateFormatter.string(from: Date(timeIntervalSince1970: value))
    }
}

//
//  SmogInfoTests.swift
//  SmogInfoTests
//
//  Created by Pawel Dudek on 30.01.2018.
//  Copyright © 2018 cookieIT. All rights reserved.
//

import XCTest
@testable import SmogInfo

class SmogInfoTests: XCTestCase {

    let correctValue1 = ValueDataDTO(date: "2017-01-30 01:00:00", value: 1)
    let correctValue2 = ValueDataDTO(date: "2018-01-15 20:00:00", value: 2)
    let correctValue3 = ValueDataDTO(date: "2017-01-30 01:00:00", value: 3)
    let incorrectValue1 = ValueDataDTO(date: "2018-01-30 20:00:00", value: nil)
    let incorrectValue2 = ValueDataDTO(date: "2015-06-30 20:00:00", value: nil)
    var valuesList = [ValueDataDTO]()
    var sensorData: SensorDataDTO?
    let controller = MeasurementPointViewController()


    override func setUp() {
        super.setUp()
        valuesList = [correctValue1, correctValue2, correctValue3, incorrectValue1, incorrectValue2]
        sensorData = SensorDataDTO(key: "CO", values: valuesList)

    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testRemoveEmptyValues() {
//        controller.removeEmptyValueFrom()
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    fileprivate func convertDateToString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        return dateFormatter.string(from: date)
    }

}

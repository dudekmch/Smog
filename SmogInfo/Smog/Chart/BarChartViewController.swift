//
//  BarChartViewController.swift
//  SmogInfo
//
//  Created by Pawel Dudek on 30.01.2018.
//  Copyright © 2018 cookieIT. All rights reserved.
//

import UIKit
import Charts

class BarChartViewController: UIViewController {

    @IBOutlet weak var barChartView: BarChartView!

    var dataForChart = [ValueDataDTO]()
    var dataEntries: [BarChartDataEntry] = []
    let noDataText = "Brak danych do wyświetlenia"

    override func viewDidLoad() {
        super.viewDidLoad()
        setChart(dateList: getDatesFromData(list: dataForChart), values: getValuesFromData(list: dataForChart))
        // Do any additional setup after loading the view.
    }

    func getDatesFromData(list: [ValueDataDTO]) -> [String] {
        var dateList = [String]()
        for valueData in list {
            dateList.append(valueData.date)
        }
        return dateList
    }

    func getValuesFromData(list: [ValueDataDTO]) -> [Double] {
        var valueList = [Double]()
        for valueData in list {
            valueList.append(valueData.value!)
        }
        return valueList
    }

    func setDataForChart(data: [ValueDataDTO]) {
        dataForChart = data
    }

    func setChart(dateList: [String], values: [Double]) {
        barChartView.noDataText = noDataText
        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        let xAxis = barChartView.xAxis
        xAxis.valueFormatter = DateValueFormatter()
        xAxis.granularity = 3600
        xAxis.labelPosition = .bottom
        xAxis.drawGridLinesEnabled = false
        
        
        barChartView.rightAxis.granularity = 1.0
        barChartView.rightAxis.axisMinimum = 0.0
        barChartView.leftAxis.axisMinimum = 0.0
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"

        for i in 0..<6 {
            let date = dateFormatter.date(from: dateList[i])
            let dataEntry = BarChartDataEntry(x: Double((date?.timeIntervalSince1970)!), y: values[i])
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "Units Sold")
        chartDataSet.colors = ChartColorTemplates.colorful()
        let chartData = BarChartData(dataSet: chartDataSet)
        barChartView.data = chartData
    }

}

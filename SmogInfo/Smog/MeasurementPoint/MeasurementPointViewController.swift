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

    var airQuality = String()
    var stationNameHeaderText = String()
    var stationId = Int()
    var measurementPointDTOs = [MeasurementPointDTO]()
    var valuesFromMeasurementPointSensors = [Int: SensorDataDTO]()
    let smogRequest = SmogRequest()
    let countOfSection = 1
    let constantPartTextFooter = "Wskaźnik jakości powietrza: "
    let valueFromSensorFormatter = "%.1f"
    let coSensorKey = "CO"
    let coValueUnit = "ug/m3"
    let generalValueUnit = "mg/m3"

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        registerNib()
        smogRequest.getMeasurementPointsForStationWith(id: stationId, success: { data in self.prepareMeasurementPointDtoListFrom(data) }, failure: { (error) in print(error!) })
        smogRequest.getSmogLevelForStationWith(id: stationId, success: { data in self.prepareSmogLevelDtoFrom(data) }, failure: { (error) in print(error!) })
    }

    fileprivate func getDataFromMeasurementPoints() {
        for point in measurementPointDTOs {
            smogRequest.getDataFromMeasurementPointWith(id: point.id, success: { data in self.prepareSensorDataDtoFrom(data, forMeasurementPointWithId: point.id) }, failure: { (error) in print(error!) })
        }
    }

    fileprivate func prepareSensorDataDtoFrom(_ data: Data, forMeasurementPointWithId id: Int) {
        do {
            var sensorData = (try JSONDecoder().decode(SensorDataDTO.self, from: data))
            sensorData = removeEmptyValueFrom(data: sensorData)
            valuesFromMeasurementPointSensors[id] = sensorData
            self.tableView.reloadData()
        } catch {
            print(error)
        }

    }

    fileprivate func prepareSmogLevelDtoFrom(_ data: Data) {
        do {
            self.airQuality = (try JSONDecoder().decode(SmogLevelDTO.self, from: data)).stIndexLevel.indexLevelName
            self.tableView.reloadData()
        } catch {
            print(error)
        }
    }

    fileprivate func prepareMeasurementPointDtoListFrom(_ data: Data) {
        do {
            self.measurementPointDTOs = (try JSONDecoder().decode([MeasurementPointDTO].self, from: data))
            sortMeasurementPointASCList()
            self.tableView.reloadData()
            getDataFromMeasurementPoints()
        } catch {
            print(error)
        }
    }

    fileprivate func sortMeasurementPointASCList() {
        self.measurementPointDTOs = self.measurementPointDTOs.sorted(by: { (this: MeasurementPointDTO, that: MeasurementPointDTO) -> Bool in
            return (that.param.paramName > this.param.paramName)
        })
    }

    fileprivate func setSmogLevelTextFooter(level: String) -> String {
        return constantPartTextFooter + level
    }

    fileprivate func removeEmptyValueFrom(data: SensorDataDTO) -> SensorDataDTO {
        var filtredValues = [SensorDataDTO.ValueDTO]()
        if var valuesForPoint = data.values {
            filtredValues = valuesForPoint.filter({ (pointValue) -> Bool in
                pointValue.value != nil
            })
        }
        return (SensorDataDTO(key: data.key, values: filtredValues))
    }

    fileprivate func prepareValue(value: SensorDataDTO) -> String {
        //TODO: wtf !! value.values![0].value!
        var formattedValue = String(format: valueFromSensorFormatter, value.values![0].value!)
        if value.key == coSensorKey {
            formattedValue = formattedValue + " " + coValueUnit
            return formattedValue
        } else {
            formattedValue = formattedValue + " " + generalValueUnit
            return formattedValue
        }
    }

}

//MARK: - UIViewControllerDelegate methods
extension MeasurementPointViewController: UITableViewDataSource, UITableViewDelegate {

    fileprivate func registerNib() {
        let nib = UINib(nibName: MeasurementPointTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: MeasurementPointTableViewCell.identifier)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return measurementPointDTOs.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return stationNameHeaderText
    }

    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return setSmogLevelTextFooter(level: airQuality)
    }


    func numberOfSections(in tableView: UITableView) -> Int {
        return countOfSection
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MeasurementPointTableViewCell.identifier) as! MeasurementPointTableViewCell

        if let data = valuesFromMeasurementPointSensors[measurementPointDTOs[indexPath.row].id] {
            prepareCellWithValue(cell, indexPath, data)
        } else {
            prepareCellWithOutValue(cell, indexPath)
        }

        return cell
    }

    fileprivate func prepareCellWithValue(_ cell: MeasurementPointTableViewCell, _ indexPath: IndexPath, _ data: SensorDataDTO) {
        cell.setDataMeasurementPoint(with: measurementPointDTOs[indexPath.row].id, name: measurementPointDTOs[indexPath.row].param.paramName, formula: measurementPointDTOs[indexPath.row].param.paramFormula, value: prepareValue(value: data))
    }

    fileprivate func prepareCellWithOutValue(_ cell: MeasurementPointTableViewCell, _ indexPath: IndexPath) {
        cell.setDataMeasurementPoint(with: measurementPointDTOs[indexPath.row].id, name: measurementPointDTOs[indexPath.row].param.paramName, formula: measurementPointDTOs[indexPath.row].param.paramFormula)
    }

}

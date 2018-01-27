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
    
    var stationNameHeaderText = String()
    var stationId = Int()
    var measurementPointDTOs = [MeasurementPointDTO]()
    let smogRequest = SmogRequest()
    let countOfSection = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        registerNib()
        smogRequest.getMeasurementPointsForStation(with: stationId ,success: { data in self.prepareMeasurementPointDtoListFrom(data: data) }, failure: { (error) in print(error!) })
    }
    
    fileprivate func prepareMeasurementPointDtoListFrom(data: Data) {
        do {
            self.measurementPointDTOs = (try JSONDecoder().decode([MeasurementPointDTO].self, from: data))
            sortASCList()
            self.tableView.reloadData()
        } catch {
            print(error)
        }
    }
    
    fileprivate func sortASCList() {
        self.measurementPointDTOs = self.measurementPointDTOs.sorted(by: { (this: MeasurementPointDTO, that: MeasurementPointDTO) -> Bool in
            return (that.param.paramName > this.param.paramName)
        })
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
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return countOfSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MeasurementPointTableViewCell.identifier) as! MeasurementPointTableViewCell
        cell.setDataMeasurementPoint(with: measurementPointDTOs[indexPath.row].id, name: measurementPointDTOs[indexPath.row].param.paramName, formula: measurementPointDTOs[indexPath.row].param.paramFormula)
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: measurementPointSegueIdentifier, sender: self)
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == measurementPointSegueIdentifier,
//            let destination = segue.destination as? MeasurementPointViewController,
//            let stationIndex = tableView.indexPathForSelectedRow
//        {
//            destination.stationId = (tableView.cellForRow(at: stationIndex) as! StationTableViewCell).stationId
//        }
//    }
    
}

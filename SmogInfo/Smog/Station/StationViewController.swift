//
//  ViewController.swift
//  SmogInfo
//
//  Created by Pawel Dudek on 22.01.2018.
//  Copyright © 2018 cookieIT. All rights reserved.
//

import UIKit

class StationViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let smogRequest = SmogRequest()

    let countOfSection = 1
    let sectionHeaderText = "Stations"
    let measurementPointSegueIdentifier = "ShowMeasurementPointsSegue"
    var stationDTOs = [StationDTO]()


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        smogRequest.getAllStation(success: { data in self.prepareStationDtoListFrom(data: data) }, failure: { (error) in print(error!) })
        registerNib()
    }

    fileprivate func prepareStationDtoListFrom(data: Data) {
        do {
            self.stationDTOs = (try JSONDecoder().decode([StationDTO].self, from: data))
            sortASCStationList()
            self.tableView.reloadData()
        } catch {
            print(error)
        }
    }

    fileprivate func sortASCStationList() {
        self.stationDTOs = self.stationDTOs.sorted(by: { (this: StationDTO, that: StationDTO) -> Bool in
            return (that.stationName > this.stationName)
        })
    }

}

//MARK: - UIViewControllerDelegate methods
extension StationViewController: UITableViewDataSource, UITableViewDelegate {

    fileprivate func registerNib() {
        let nib = UINib(nibName: StationTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: StationTableViewCell.identifier)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stationDTOs.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionHeaderText
    }


    func numberOfSections(in tableView: UITableView) -> Int {
        return countOfSection
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StationTableViewCell.identifier) as! StationTableViewCell
        cell.setTextInStationNameLabel(name: stationDTOs[indexPath.row].stationName)
        cell.stationId = stationDTOs[indexPath.row].id
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: measurementPointSegueIdentifier, sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == measurementPointSegueIdentifier,
            let destination = segue.destination as? MeasurementPointViewController,
            let stationIndex = tableView.indexPathForSelectedRow
            {
            destination.stationId = (tableView.cellForRow(at: stationIndex) as! StationTableViewCell).stationId
        }
    }

}



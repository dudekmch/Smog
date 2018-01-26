//
//  ViewController.swift
//  SmogInfo
//
//  Created by Pawel Dudek on 22.01.2018.
//  Copyright © 2018 cookieIT. All rights reserved.
//

import UIKit

class CitiesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let smogRequest = SmogRequest()

    let countOfSection = 1
    let sectionHeaderText = "Cities"
    var stationDTOs = [StationDTO]()


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        smogRequest.getAllStation(success: { data in do {
            self.stationDTOs = (try JSONDecoder().decode([StationDTO].self, from: data))
            self.tableView.reloadData()
        } catch {
            print(error)
            } })
        { (error) in
            print(error)
        }
    }

}

extension CitiesViewController: UITableViewDataSource, UITableViewDelegate {

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

        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath) as! UITableViewCell
        cell.textLabel?.text = stationDTOs[indexPath.row].stationName
        return cell
    }

}


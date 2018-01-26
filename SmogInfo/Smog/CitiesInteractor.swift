//
//  CitiesInteractor.swift
//  SmogInfo
//
//  Created by Pawel Dudek on 22.01.2018.
//  Copyright © 2018 cookieIT. All rights reserved.
//

import Foundation
import UIKit

class CitiesInteractor {

    let smogRequest = SmogRequest()

    var stationDTOs = [StationDTO]()

    func getAllStation(view: UITableView, count: Int = 8) -> [StationDTO] {
      
        return stationDTOs
    }

}

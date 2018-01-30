//
//  SensorDataDTO.swift
//  SmogInfo
//
//  Created by Pawel Dudek on 29.01.2018.
//  Copyright © 2018 cookieIT. All rights reserved.
//

import Foundation

struct SensorDataDTO: Decodable {
    let key : String
    let values : [ValueDataDTO]?
    
}

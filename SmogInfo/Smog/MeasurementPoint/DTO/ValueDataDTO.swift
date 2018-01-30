//
//  ValueDataDTO.swift
//  SmogInfo
//
//  Created by Pawel Dudek on 30.01.2018.
//  Copyright © 2018 cookieIT. All rights reserved.
//

import Foundation

struct ValueDataDTO: Decodable {
    let date : String
    let value: Double?
}

//
//  MeasurementPointDTO.swift
//  SmogInfo
//
//  Created by Pawel Dudek on 27.01.2018.
//  Copyright © 2018 cookieIT. All rights reserved.
//

import Foundation

struct MeasurementPointDTO: IdentifiableDTO {
    var id: Int
    let param: ParamDTO
}

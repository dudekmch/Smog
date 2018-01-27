//
//  ParamDTO.swift
//  SmogInfo
//
//  Created by Pawel Dudek on 27.01.2018.
//  Copyright © 2018 cookieIT. All rights reserved.
//

import Foundation

struct ParamDTO: Decodable{
    var idParam: Int
    let paramName: String
    let paramFormula: String
}

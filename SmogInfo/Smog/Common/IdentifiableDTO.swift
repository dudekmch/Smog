//
//  IdentifiableDTO.swift
//  SmogInfo
//
//  Created by Pawel Dudek on 27.01.2018.
//  Copyright © 2018 cookieIT. All rights reserved.
//

import Foundation

protocol IdentifiableDTO: Decodable {
    var id: Int {get}
}

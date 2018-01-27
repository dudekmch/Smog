//
//  SmogRequest.swift
//  SmogInfo
//
//  Created by Pawel Dudek on 22.01.2018.
//  Copyright © 2018 cookieIT. All rights reserved.
//

import Foundation
import Alamofire

class SmogRequest {

    func getAllStation(success: @escaping (_ response: Data) -> Void, failure: @escaping (_ error: NSError?) -> Void)
    {
        Alamofire.request("http://api.gios.gov.pl/pjp-api/rest/station/findAll").responseJSON { response in
            switch response.result
            {
            case .success:
                success(response.data!)
            case .failure(let error):
                failure(error as NSError)
            }
        }
    }

    func getMeasurementPointsForStation(with id: Int, success: @escaping (_ response: Data) -> Void, failure: @escaping (_ error: NSError?) -> Void)
    {
        Alamofire.request("http://api.gios.gov.pl/pjp-api/rest/station/sensors/\(id)").responseJSON { response in
            switch response.result
            {
            case .success:
                success(response.data!)
            case .failure(let error):
                failure(error as NSError)
            }
        }
    }

}

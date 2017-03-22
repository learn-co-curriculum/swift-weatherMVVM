//
//  WeatherAPIClient.swift
//  WeatherMVVM
//
//  Created by Johann Kerr on 3/9/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class WeatherAPIClient {
    
    class func getForecast(completion:@escaping (JSON) -> ()) {
        Alamofire.request("https://api.darksky.net/forecast/71f1892a6d625cc526c7ff7fec9d6973/37.8267,-122.4233").responseJSON { (response) in
            guard let data = response.data else { return }
            let json = JSON(data: data)
            completion(json)

        }
    }
    
    
    
    
}

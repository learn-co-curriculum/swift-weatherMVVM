//
//  ForecastDataStore.swift
//  WeatherMVVM
//
//  Created by Johann Kerr on 3/9/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import Foundation

class ForecastDataStore {
    static let sharedInstance = ForecastDataStore()
    fileprivate init() {}
    
    var forecast: Forecast?
    
    func forecastWeather(completion: @escaping () -> ()) {
        WeatherAPIClient.getForecast { (json) in
            self.forecast = Forecast(json)
            completion()
        }
    }
}

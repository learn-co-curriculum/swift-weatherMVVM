//
//  ForecastViewModel.swift
//  WeatherMVVM
//
//  Created by Johann Kerr on 3/9/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import Foundation

typealias RefreshFunction = () -> ()





class ForecastViewModel {
    var forecast: Forecast?
    let store = ForecastDataStore.sharedInstance
    
    
    var currentTemperature: String {

        let temperature = store.forecast?.currentForecast.temperature
        let temperatureInt = Int(temperature!)
        let tempString = String(temperatureInt)
        return tempString
    }
    
    var todayLowTemperature: String {
        return String(Int(store.forecast?.weekForecast.dayForecast.first?.apparentTemperatureMin ?? 0.0))
    }
    
    var todayHighTemperature: String {
        return String(Int(store.forecast?.weekForecast.dayForecast.first?.apparentTemperatureMax ?? 0.0))
    }
    
    var currentSummary: String {
        return store.forecast?.currentForecast.summary ?? ""
    }
    
    
    
    
    init(task: @escaping RefreshFunction) {
        if self.store.forecast != nil {
            self.forecast = self.store.forecast
            task()
        } else {
            self.store.forecastWeather {
                if let forecast = self.store.forecast {
                    self.forecast = forecast
                    task()
                }
            }
        }
    }
    

    
    func numberOfRowsFor(_ type: ForecastType) -> Int {
        guard let forecast = self.store.forecast else { return 0 }
        switch type {
        case .day:
            return forecast.dayForecast.hourForecast.count
        case .week:
            return forecast.weekForecast.dayForecast.count
        case .hour:
            return forecast.hourForecast.minuteForecast.count
        }
    }
    
    func tempFor(_ type: ForecastType, at index: Int) -> String {
        guard let forecast = self.store.forecast else { return "" }
        switch type {
        case .day:
            return String(forecast.dayForecast.hourForecast[index].apparentTemp)
        case .week:
            return String(forecast.weekForecast.dayForecast[index].apparentTemp)
        case .hour:
            return ""
        }
    }
    
    

    
    
    
}

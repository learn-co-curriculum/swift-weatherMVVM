//
//  Forecast.swift
//  
//
//  Created by Johann Kerr on 3/9/17.
//
//

import Foundation
import SwiftyJSON

enum ForecastType {
    case day, week, hour
}

struct Forecast {
    
    let currentForecast: CurrentForecast
    let hourForecast: HourForecast
    let dayForecast: DayForecast
    let weekForecast: WeekForecast
    
    init(_ data: JSON) {
        self.currentForecast = CurrentForecast(data["currently"])
        self.hourForecast = HourForecast(data["minutely"])
        self.dayForecast = DayForecast(data["hourly"])
        self.weekForecast = WeekForecast(data["daily"])
    }
    
}

struct CurrentForecast {
    let summary: String
    let icon: String
    let precipIntensity: Double
    let precipProbability: Double
    let temperature: Double
    let apparentTemp: Double
    let dewPoint: Double
    let humidity: Double
    let windSpeed: Double
    let windBearing: Double
    let visibility: Double
    let cloudCover: Double
    let pressure: Double
    let ozone: Double
    let nearestStormDistance: Double
    let nearestStormBearing: Double
    
    init(_ data: JSON) {
        self.summary = data["summary"].stringValue
        self.icon = data["icon"].stringValue
        self.precipIntensity = data["precipIntensity"].doubleValue
        self.precipProbability = data["precipProbability"].doubleValue
        self.temperature = data["temperature"].doubleValue
        self.apparentTemp = data["apparentTemperature"].doubleValue
        self.dewPoint = data["dewPoint"].doubleValue
        self.humidity = data["humidity"].doubleValue
        self.windSpeed = data["windSpeed"].doubleValue
        self.windBearing = data["windBearing"].doubleValue
        self.visibility = data["visibility"].doubleValue
        self.cloudCover = data["cloudCover"].doubleValue
        self.pressure = data["pressure"].doubleValue
        self.ozone = data["pressure"].doubleValue
        self.nearestStormDistance = data["nearestStormDistance"].doubleValue
        self.nearestStormBearing = data["nearestStormBearing"].doubleValue
    }
    
}

struct HourForecast {
    let summary: String
    let icon: String
    let minuteForecast: [Minute]
    
    init(_ data: JSON) {
        self.summary = data["summary"].stringValue
        self.icon = data["icon"].stringValue
        self.minuteForecast = data["data"].arrayValue.map{Minute($0)}
    }
}

struct DayForecast {
    let summary: String
    let icon: String
    let hourForecast: [Hour]
    
    init(_ data: JSON) {
        self.summary = data["summary"].stringValue
        self.icon = data["icon"].stringValue
        self.hourForecast = data["data"].arrayValue.map {Hour($0)}
    }
}

struct WeekForecast {
    let summary: String
    let icon: String
    let dayForecast: [Day]
    
    init(_ data: JSON) {
        self.summary = data["summary"].stringValue
        self.icon = data["icon"].stringValue
        self.dayForecast = data["data"].arrayValue.map{Day($0)}
    }
    
}

struct Minute {
    let time: Double
    let precipIntensity: Double
    let precipProbability: Double
    
    init(_ data: JSON) {
        self.time = data["time"].doubleValue
        let timeValue = Date(timeIntervalSince1970: self.time)
        self.precipIntensity = data["precipIntensity"].doubleValue
        self.precipProbability = data["precipProbability"].doubleValue
    }
}


struct Hour {
    let time: Double
    let summary: String
    let icon: String
    let precipIntensity: Double
    let precipProbability: Double
    let temperature: Double
    let apparentTemp: Double
    let dewPoint: Double
    let humidity: Double
    let windSpeed: Double
    let windBearing: Double
    let visibility: Double
    let cloudCover: Double
    let pressure: Double
    let ozone: Double
    
    init(_ data:JSON) {
        self.time = data["time"].doubleValue
        self.summary = data["summary"].stringValue
        self.icon = data["icon"].stringValue
        self.precipIntensity = data["precipIntensity"].doubleValue
        self.precipProbability = data["precipProbability"].doubleValue
        self.temperature = data["temperature"].doubleValue
        self.apparentTemp = data["apparentTemperature"].doubleValue
        self.dewPoint = data["dewPoint"].doubleValue
        self.humidity = data["humidity"].doubleValue
        self.windSpeed = data["windSpeed"].doubleValue
        self.windBearing = data["windBearing"].doubleValue
        self.visibility = data["visibility"].doubleValue
        self.cloudCover = data["cloudCover"].doubleValue
        self.pressure = data["pressure"].doubleValue
        self.ozone = data["ozone"].doubleValue
    }

}


struct Day {
    let time: Double
    let summary: String
    let icon: String
    let precipIntensity: Double
    let precipProbability: Double
    let temperature: Double
    let apparentTemp: Double
    let dewPoint: Double
    let humidity: Double
    let windSpeed: Double
    let windBearing: Double
    let visibility: Double
    let cloudCover: Double
    let pressure: Double
    let ozone: Double
    let sunriseTime: Double
    let sunsetTime: Double
    let moonPhase: Double
    let precipIntensityMax: Double
    let temperatureMin: Double
    let temperatureMinTime: Double
    let temperatureMax: Double
    let temperatureMaxTime: Double
    let apparentTemperatureMin: Double
    let apparentTemperatureMinTime: Double
    let apparentTemperatureMax: Double
    let apparentTemperatureMaxTime: Double
    
    init(_ data:JSON) {
        self.time = data["time"].doubleValue
        self.summary = data["summary"].stringValue
        self.icon = data["icon"].stringValue
        self.precipIntensity = data["precipIntensity"].doubleValue
        self.precipProbability = data["precipProbability"].doubleValue
        self.temperature = data["temperature"].doubleValue
        self.apparentTemp = data["apparentTemperature"].doubleValue
        self.dewPoint = data["dewPoint"].doubleValue
        self.humidity = data["humidity"].doubleValue
        self.windSpeed = data["windSpeed"].doubleValue
        self.windBearing = data["windBearing"].doubleValue
        self.visibility = data["visibility"].doubleValue
        self.cloudCover = data["cloudCover"].doubleValue
        self.pressure = data["pressure"].doubleValue
        self.ozone = data["ozone"].doubleValue
        self.sunriseTime = data["sunriseTime"].doubleValue
        self.sunsetTime = data["sunsetTime"].doubleValue
        self.moonPhase = data["moonPhase"].doubleValue
        self.precipIntensityMax = data["precipIntensityMax"].doubleValue
        self.temperatureMin = data["temperatureMin"].doubleValue
        self.temperatureMinTime = data["temperatureMinTime"].doubleValue
        self.temperatureMax = data["temperatureMax"].doubleValue
        self.temperatureMaxTime = data["temperatureMaxTime"].doubleValue
        self.apparentTemperatureMin = data["apparentTemperatureMin"].doubleValue
        self.apparentTemperatureMinTime = data["apparentTemperatureMinTime"].doubleValue
        self.apparentTemperatureMax = data["apparentTemperatureMax"].doubleValue
        self.apparentTemperatureMaxTime = data["apparentTemperatureMaxTime"].doubleValue

    }
    
    
}




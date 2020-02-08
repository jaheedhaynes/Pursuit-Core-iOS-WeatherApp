//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Jaheed Haynes on 2/5/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation

struct Weather: Codable {
    let latitude:Double
    let longitude: Double
    let timezone: String
    let currently: Currently
    let daily: Daily
}

struct Currently: Codable {
    let summary: String
    let icon: String
}

struct Daily: Codable {
    let data: [WeatherData]
}

struct WeatherData: Codable {
    let summary: String?
    let time: Double
    let icon: String
    let sunriseTime: Double
    let sunsetTime: Double
    let precipProbability: Double
    let precipType: String?
    let temperatureHigh: Double
    let temperatureLow: Double
    let windSpeed: Double
}

//// MARK: - Weather
//
//struct Weather: Codable {
//    let latitude: Double
//    let longitude: Double
//    let timezone: String
//    let currently: Currently
//    let minutely: Minutely
//    let hourly: Hourly
//    let daily: Daily
//    let alerts: [Alert]
//    let flags: Flags
//    let offset: Int
//}
//
//// MARK: - Alert
//
//struct Alert: Codable {
//    let title: String
//    let regions: [String]
//    let severity: String
//    let time, expires: Int
//    let alertDescription: String
//    let uri: String
//
//    enum CodingKeys: String, CodingKey {
//        case title, regions, severity, time, expires
//        case alertDescription = "description"
//        case uri
//    }
//}
//
//// MARK: - Currently
//
//struct Currently: Codable {
//    let summary: Summary
//    let icon: Icon
//    let precipType: PrecipType?
//    let time: Int
//    let nearestStormDistance: Int?
//    let nearestStormBearing: Int?
//    let precipIntensity: Double
//    let precipProbability: Double
//    let temperature: Double
//    let apparentTemperature: Double
//    let dewPoint, humidity, pressure, windSpeed: Double
//    let windGust: Double
//    let windBearing: Int
//    let cloudCover: Double
//    let uvIndex: Int
//    let visibility, ozone: Double
//
//}
//
//enum Icon: String, Codable {
//    case clearDay = "clear-day"
//    case clearNight = "clear-night"
//    case cloudy = "cloudy"
//    case partlyCloudyDay = "partly-cloudy-day"
//    case partlyCloudyNight = "partly-cloudy-night"
//}
//
//enum PrecipType: String, Codable {
//    case rain = "rain"
//}
//
//enum Summary: String, Codable {
//    case clear = "Clear"
//    case mostlyCloudy = "Mostly Cloudy"
//    case overcast = "Overcast"
//    case partlyCloudy = "Partly Cloudy"
//}
//
//// MARK: - Daily
//struct Daily: Codable {
//    let summary: String
//    let icon: Icon
//    let data: [DailyDatum]
//}
//
//// MARK: - DailyDatum
//struct DailyDatum: Codable {
//    let precipType: PrecipType?
//    let icon: Icon
//    let time: Int
//    let summary: String
//    let sunriseTime: Int
//    let sunsetTime: Int
//    let moonPhase: Double
//    let precipIntensity: Double
//    let precipIntensityMax: Double
//    let precipIntensityMaxTime: Int
//    let precipProbability: Double
//    let temperatureHigh: Double
//    let temperatureHighTime: Int
//    let temperatureLow: Double
//    let temperatureLowTime: Int
//    let apparentTemperatureHigh: Double
//    let apparentTemperatureHighTime: Int
//    let apparentTemperatureLow: Double
//    let apparentTemperatureLowTime: Int
//    let dewPoint: Double
//    let humidity: Double
//    let pressure: Double
//    let windSpeed: Double
//    let windGust: Double
//    let windGustTime: Int
//    let windBearing: Int
//    let cloudCover: Double
//    let uvIndex: Int
//    let uvIndexTime: Int
//    let visibility: Double
//    let ozone: Double
//    let temperatureMin: Double
//    let temperatureMinTime: Int
//    let temperatureMax: Double
//    let temperatureMaxTime: Int
//    let apparentTemperatureMin: Double
//    let apparentTemperatureMinTime: Int
//    let apparentTemperatureMax: Double
//    let apparentTemperatureMaxTime: Int
//}
//
//// MARK: - Flags
//struct Flags: Codable {
//    let sources: [String]
//    let nearestStation: Double
//    let units: String
//
//    enum CodingKeys: String, CodingKey {
//        case sources
//        case nearestStation = "nearest-station"
//        case units
//    }
//}
//
//// MARK: - Hourly
//struct Hourly: Codable {
//    let summary: String
//    let icon: Icon
//    let data: [Currently]
//}
//
//// MARK: - Minutely
//struct Minutely: Codable {
//    let summary: String
//    let icon: Icon
//    let data: [MinutelyDatum]
//}
//
//// MARK: - MinutelyDatum
//struct MinutelyDatum: Codable {
//    let time, precipIntensity, precipProbability: Int
//}



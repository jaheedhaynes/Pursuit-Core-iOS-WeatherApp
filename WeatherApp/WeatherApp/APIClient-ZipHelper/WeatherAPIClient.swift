//
//  WeatherAPIClient.swift
//  WeatherApp
//
//  Created by Jaheed Haynes on 2/5/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation
import NetworkHelper

struct WeatherAPI {
    static func getLatLong(lat: Double, long: Double, completionHandler: @escaping (Result<Weather, AppError>) -> ()) {
               
        let endpointURL = "https://api.darksky.net/forecast/ad34a31743a4ff28cafc686c25e89787/\(lat),\(long)"
        
        guard let url = URL(string: endpointURL) else {
            completionHandler(.failure(.badURL(endpointURL)))
            return
        }
        
        let request = URLRequest(url: url)
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
                completionHandler(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let weatherData = try JSONDecoder().decode(Weather.self, from: data)
                    completionHandler(.success(weatherData))
                } catch {
                    completionHandler(.failure(.decodingError(error)))
                }
            }
        }
    }
}

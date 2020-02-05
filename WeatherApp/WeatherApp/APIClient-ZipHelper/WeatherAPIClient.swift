//
//  WeatherAPIClient.swift
//  WeatherApp
//
//  Created by Jaheed Haynes on 2/5/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation
import NetworkHelper

struct WeatherAPIClient {
    static func getWeather(latLong: String, completion: @escaping (Result <[DailyDatum], AppError>) -> ()) {
        
        let endpointURLString = "https://api.darksky.net/forecast/\(weatherKey)/\(latLong)"
        
        guard let url = URL(string: endpointURLString) else {
            completion(.failure(.badURL(endpointURLString)))
            return
        }
        
        let request = URLRequest(url:url)
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do{
                    let weather = try JSONDecoder().decode(Weather.self, from: data)
                    completion(.success(weather.daily.data))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
}

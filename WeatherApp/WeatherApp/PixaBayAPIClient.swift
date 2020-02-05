//
//  PixaBayAPIClient.swift
//  WeatherApp
//
//  Created by Jaheed Haynes on 2/5/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation
import NetworkHelper

struct ImagesAPIClient {
    
    static func getImages(with searchQuery: String, completion: @escaping (Result<[Image],AppError>) -> () ) {
        
        let searchQuery = searchQuery.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        
        let imagesEndpoint = "https://pixabay.com/api/?key=\(pixabayKey)q=\(searchQuery ?? "new york")"
        
        guard let url = URL(string: imagesEndpoint) else {
            completion(.failure(.badURL(imagesEndpoint)))
            return
        }
        
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let imageData):
                
                do {
                    let imageInfo = try JSONDecoder().decode(PixabayImage.self, from: imageData)
                    
                    completion(.success(imageInfo.hits))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
}

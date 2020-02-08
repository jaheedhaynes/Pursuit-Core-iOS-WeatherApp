//
//  PixaBayModel.swift
//  WeatherApp
//
//  Created by Jaheed Haynes on 2/5/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation

struct Pixabay: Codable {
    let hits: [Image]
}

struct Image: Codable, Equatable {
    let largeImageURL: String
    let likes: Int
    let views: Int
    let pageURL: String
    let downloads: Int
    let tags: String?
}

//struct PixabayImage: Codable {
//    let hits: [Image]
//    let totalHits: Int?
//    let total: Int?
//}
//
//struct Image: Codable {
//
//    let largeImageURL: String?
//    let pageURL: String?
//    let webformatURL: String?
//    let userImageURL: String?
//    let previewURL: String?
//    let tags: String?
//    let user: String?
//    let webformatHeight: Int?
//    let webformatWidth: Int?
//    let likes: Int?
//    let imageWidth: Int?
//    let id: Int?
//    let views: Int?
//    let comments: Int?
//    let imageHeight: Int?
//    let previewHeight: Int?
//    let downloads: Int?
//    let favorites: Int?
//    let imageSize: Int?
//    let previewWidth: Int?
//
//}



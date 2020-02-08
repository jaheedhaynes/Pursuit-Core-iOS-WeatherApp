//
//  Persistence.swift
//  WeatherApp
//
//  Created by Jaheed Haynes on 2/7/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation

enum DataPersistenceError: Error {
    case savingError(Error) 
    case fileDoesNotExist(String)
    case noData
    case decodingError(Error)
    case deletingError(Error)
}


class PersistenceHelper {
    
    private var photos = [Image]()
    private var filename: String
    
    init(filename: String) {
        self.filename = filename
    }
    
    private func save() throws {
        do {
            let url = FileManager.pathToDocumentsDirectory(with: filename)
            print(url)
            let data = try PropertyListEncoder().encode(photos)
            
            try data.write(to: url, options: .atomic)
        } catch {
            throw DataPersistenceError.savingError(error)
        }
    }
    
    public func reorder(photos: [Image]) {
        self.photos = photos
        try? save()
    }
    
    public func save(photo: Image) throws {
        photos.append(photo)
        
        do {
            try save()
        } catch {
            throw DataPersistenceError.savingError(error)
        }
    }
    
    public func loadPhotos() throws -> [Image] {
        let url = FileManager.pathToDocumentsDirectory(with: filename)
        
        if FileManager.default.fileExists(atPath: url.path) {
            if let data = FileManager.default.contents(atPath: url.path) {
                do {
                    photos = try PropertyListDecoder().decode([Image].self, from: data)
                } catch {
                    throw DataPersistenceError.decodingError(error)
                }
            } else {
                throw DataPersistenceError.noData
            }
        }
        else {
            throw DataPersistenceError.fileDoesNotExist(filename)
        }
        return photos
    }
    
    public func delete(photo index: Int) throws {
        photos.remove(at: index)
        do {
            try save()
        } catch {
            throw DataPersistenceError.deletingError(error)
        }
    }
}

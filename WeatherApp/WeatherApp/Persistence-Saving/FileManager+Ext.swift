//
//  FileManager+Ext.swift
//  WeatherApp
//
//  Created by Jaheed Haynes on 2/6/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation

extension FileManager {
    
    // getting the specific document directory for the user
    // it will allows be indexed at [0] bc there is ONLY ONE doc directory
    // Very similar to macbook that only has one Documents section
    static func getDocumentsDirectory() -> URL {
       
       return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
  
    // this func appends the filename to the document directory to go to specific folder
    // this does not create a plist, rather it creates a path to .plist if it exists
    
    static func pathToDocumentsDirectory(with filname: String) -> URL {
        return getDocumentsDirectory().appendingPathComponent(filname)
    }
}

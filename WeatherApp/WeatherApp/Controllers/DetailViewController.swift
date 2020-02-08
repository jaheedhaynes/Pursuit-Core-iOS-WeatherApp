//
//  DetailViewController.swift
//  WeatherApp
//
//  Created by Jaheed Haynes on 2/8/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    public var dataPersistence: PersistenceHelper!
    
    public var detailView = DetailView()
    
    public var photo: Image?
    
    
    //-------------------------------------------------------------------------------------

    override func loadView() {
        
        view = detailView
        
    }
    
    //-------------------------------------------------------------------------------------

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: #selector(saveToFavorite(sender:)))
        
        view.backgroundColor = .systemBackground
    }
    
    //-------------------------------------------------------------------------------------

    
    @objc
    private func saveToFavorite(sender: UIBarButtonItem) {
        guard let photo = photo else {
            fatalError("could not save")
        }
        
        do {
            try dataPersistence.save(photo: photo)
            showAlert(title: "OK", message: "Photo saved")
        } catch {
            showAlert(title: "Failed", message: "Couldnt save photo")
        }
    }
}

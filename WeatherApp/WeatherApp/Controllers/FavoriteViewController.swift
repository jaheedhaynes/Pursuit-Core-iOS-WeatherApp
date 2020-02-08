//
//  FavoriteViewController.swift
//  WeatherApp
//
//  Created by Jaheed Haynes on 2/8/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {
    
     public var dataPersistence: PersistenceHelper!
    
    public var favView = FavoriteView()
    
  
    
    public var favorites = [Image]() {
        didSet {
            DispatchQueue.main.async {
                self.favView.favoriteCollectionView.reloadData()
            }
        }
    }
    
   //-------------------------------------------------------------------------------------

    
    override func loadView() {
          view = favView
      }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        favView.favoriteCollectionView.register(FavoriteCell.self, forCellWithReuseIdentifier: "favCell")
        favView.favoriteCollectionView.dataSource = self
        favView.favoriteCollectionView.delegate = self
        tabBarController?.navigationItem.title = "Favorite City Images"
        loadFavorites()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        loadFavorites()
    }
    
    //-------------------------------------------------------------------------------------

    
    func loadFavorites() {
        do {
            favorites = try dataPersistence.loadPhotos()
            favorites = favorites.reversed()
        } catch {
            showAlert(title: "OK", message: "There are no Favorites")
            print("no favoties, check loadFavorites method")
        }
    }
}

//-------------------------------------------------------------------------------------
// MARK: EXTENSIONs

extension FavoriteViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "favCell", for: indexPath) as? FavoriteCell else {
            fatalError()
        }
        let aFav = favorites[indexPath.row]
        cell.updateUI(photo: aFav)
        cell.backgroundColor = .systemBackground
        return cell
    }
}

extension FavoriteViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let maxSize = UIScreen.main.bounds.size
        let itemWidth: CGFloat = maxSize.width
        return CGSize(width: itemWidth, height: 264)
    }
}

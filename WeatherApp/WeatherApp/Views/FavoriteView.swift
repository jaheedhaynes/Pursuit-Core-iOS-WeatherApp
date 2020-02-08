//
//  FavoriteView.swift
//  WeatherApp
//
//  Created by Jaheed Haynes on 2/8/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class FavoriteView: UIView {
    
    public lazy var favoriteCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 200, height: 200)
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.backgroundColor = .systemBackground
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        favoritesCollectionViewConstrints()
    }
    
    private func favoritesCollectionViewConstrints() {
        addSubview(favoriteCollectionView)
        favoriteCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            favoriteCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            favoriteCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            favoriteCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            favoriteCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
    
}


//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Jaheed Haynes on 2/8/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class WeatherView: UIView {

    public lazy var weatherLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Weather"
        return label
    }()
    
    public lazy var weatherColectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 200, height: 200)
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.backgroundColor = .systemBackground
        return cv
    }()
    
    public lazy var textField: UITextField = {
        let textfield = UITextField()
        textfield.backgroundColor = .systemGray3
        textfield.keyboardType = .numbersAndPunctuation
        return textfield
    }()
    
    public lazy var zipMessageLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Enter valid zipcode"
        return label
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
        weatherLabelConstraints()
        weatherCollectionViewConstrains()
        textFieldConstraints()
        zipLabelConstraints()
    }

    
    private func weatherLabelConstraints() {
        addSubview(weatherLabel)
        weatherLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weatherLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            weatherLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            weatherLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -100)
        ])
    }
    
    private func weatherCollectionViewConstrains() {
        addSubview(weatherColectionView)
        weatherColectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weatherColectionView.topAnchor.constraint(equalTo: weatherLabel.bottomAnchor, constant: 20),
            weatherColectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            weatherColectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            weatherColectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -400)
        ])
    }
    
    private func textFieldConstraints() {
        addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: weatherColectionView.bottomAnchor, constant: 25),
            textField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 150),
            textField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -150)
        ])
    }
    
    private func zipLabelConstraints() {
        addSubview(zipMessageLabel)
        zipMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            zipMessageLabel.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 50),
            zipMessageLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 40),
            zipMessageLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -40)
        ])
    }
}

//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Jaheed Haynes on 2/8/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    private var weatherView = WeatherView()
        
        override func loadView() {
            view = weatherView
        }
        
        var picture = [Image]()
        
        var dataPersistence: PersistenceHelper!
        
        var allWeather = [WeatherData]() {
            didSet {
                DispatchQueue.main.async {
                    self.weatherView.weatherColectionView.reloadData()
                }
            }
        }
        
        var selectedZipcode = "11217" {
            didSet {
                getZipcode(zip: selectedZipcode)
            }
        }
    
    //-------------------------------------------------------------------------------------


        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .systemBackground
            tabBarController?.navigationItem.title = "Weekly Forecast"
            weatherView.weatherColectionView.register(WeatherCell.self, forCellWithReuseIdentifier: "weatherCell")
            weatherView.weatherColectionView.dataSource = self
            weatherView.weatherColectionView.delegate = self
            weatherView.textField.delegate = self
            getZipcode(zip: selectedZipcode)
            
        }
    
    //-------------------------------------------------------------------------------------

      
        private func getWeather(lat: Double, long: Double, placename: String) {
            WeatherAPI.getLatLong(lat: lat, long: long) { [weak self] (result) in
                switch result {
                case .failure(let appError):
                    print("\(appError)")
                case .success(let weatherData):
                    self?.allWeather = weatherData.daily.data
                }
            }
        }
    
        
        private func getPhotos(city: String) {
            PhotoAPI.getPhotos(search: city) { [weak self] (result) in
                switch result {
                case .failure(let appError):
                    print("\(appError)")
                case .success(let images):
                    DispatchQueue.main.async {
                        self?.picture = images
                    }
                }
            }
        }
    
        
        private func getZipcode(zip: String) {
            ZipCodeHelper.getLatLong(fromZipCode: zip) { [weak self] (result) in
                switch result {
                case .failure(let error):
                    print("\(error)")
                case .success(let coordinates):
                    self?.getWeather(lat: coordinates.lat, long: coordinates.long, placename: coordinates.placeName)
                    self?.getPhotos(city: coordinates.placeName)
                    self?.weatherView.weatherLabel.text = "Weather for \(coordinates.placeName)"
                    DispatchQueue.main.async {
                       self?.getPhotos(city: coordinates.placeName)
                    }
                }
            }
        }
    }



//-------------------------------------------------------------------------------------
// MARK: EXTENSIONs

    extension WeatherViewController: UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return allWeather.count - 1
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "weatherCell", for: indexPath) as? WeatherCell else {
                fatalError()
            }
            let oneWeather = allWeather[indexPath.row]
            cell.configureCell(weather: oneWeather)
            return cell
        }
    }

    extension WeatherViewController: UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let maxSize = UIScreen.main.bounds.size
            let itemWidth: CGFloat = maxSize.width * 0.48
            return CGSize(width: itemWidth, height: 264)
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let date = allWeather[indexPath.row]
            
            let detailVC = DetailViewController()
            
            detailVC.detailView.detailImage =  picture[indexPath.row]
            detailVC.photo =  picture[indexPath.row]
            detailVC.dataPersistence = dataPersistence
            detailVC.detailView.updateUI(weather: date)
            
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }

    extension WeatherViewController: UITextFieldDelegate {
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            selectedZipcode = textField.text!
            textField.resignFirstResponder()
            return true
        }
    }

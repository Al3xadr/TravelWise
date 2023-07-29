//
//  InfoViewModel.swift
//  TravelWise
//
//  Created by apple on 29.07.2023.
//

import UIKit


final class InfoViewModel {
    private let networkService = NetworkCityData()
    private var wikipediaResponse: WikipediaResponse?
    
    func fetchDataCountry(latitude: Double, longitude: Double, completion: @escaping (Error?) -> Void) {
        networkService.fetchCountryData(latitude: latitude, longitude: longitude) { [weak self] result in
            switch result {
            case .success(let response):
                self?.wikipediaResponse = response
                print(response)
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        }
    }
    
    func numberOfPages() -> Int {
        return wikipediaResponse?.query.pages.count ?? 0
    }
    
    func page(at index: Int) -> Page? {
        guard let pages = wikipediaResponse?.query.pages else {
            return nil
        }
        return pages.values.sorted { $0.index < $1.index }[index]
    }
}



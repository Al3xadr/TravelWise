//
//  RecommendationViewModel.swift
//  TravelWise
//
//  Created by apple on 27.07.2023.
//

import Foundation

class RecommendationViewModel {
    private let networkService = CountryAPIService()
    
    func fetchDataForCountry(countryName: String) {

        networkService.fetchCountryData(for: countryName) { result in
            switch result {
            case .success(let countryData):
                print("Country Name: \(countryData.name.common)")
                print("Official Name: \(countryData.name.official)")
                // ...
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}

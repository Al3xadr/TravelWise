//
//  RecommendationViewModel.swift
//  TravelWise
//
//  Created by apple on 27.07.2023.
//

import Foundation

class RecommendationViewModel {
    private let networkService = CountryAPIService()
    private var countryData: CountryResponse?
    
    func fetchDataForCountry(countryName: String, completion: @escaping (Error?) -> Void) {
        networkService.fetchCountryData(for: countryName) { [weak self] result in
            switch result {
            case .success(let countryData):
                self?.countryData = countryData
                print(countryData)
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        }
    }
    
    func getCountryData() -> CountryResponse? {
        return countryData
    }
    func updateUIWithCountryData(completion: @escaping (CountryResponseData?) -> Void) {
        if let countryData = getCountryData() {
            let recommendedCountry = "Your country: \(countryData.name.common)"
            let officialName = "official: \(countryData.name.official)"
            let capital = "Capital: \(countryData.capital?.first ?? "-")"
            let region = "Region: \(countryData.region)"
            
            var flagText = "NA"
            if let flag = countryData.flags.alt {
                flagText = " \(flag)"
            }

            var subregionText = "NA"
            if let subregion = countryData.subregion {
                subregionText = "Sub region: \(subregion)"
            }
            var languagesText = ""
            if let languages = countryData.languages {
                let languageList = languages.map { (key, value) in
                    return "\(key): \(value)"
                }
                languagesText = "Language " + languageList.joined(separator: ", ").replacingOccurrences(of: "\n", with: "")
            }
            let population = "Population: \(countryData.population)"
            guard let flagImageURL = URL(string: countryData.flags.png) else {
                completion(nil)
                return
            }
            let countryResponse = CountryResponseData(recommendedCountry: recommendedCountry,
                                                      officialName: officialName,
                                                      capital: capital,
                                                      flag: flagText,
                                                      region: region,
                                                      subregion: subregionText,
                                                      languages: languagesText,
                                                      population: population, flagImageURL: flagImageURL)
            completion(countryResponse)
        } else {
            completion(nil)
        }
    }
}

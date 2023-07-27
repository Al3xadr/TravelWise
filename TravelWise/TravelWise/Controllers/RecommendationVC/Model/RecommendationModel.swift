//
//  RecommendationModel.swift
//  TravelWise
//
//  Created by apple on 27.07.2023.
//

import Foundation
struct CountryResponseData: Codable {
    let recommendedCountry: String
    let officialName: String
    let capital: String
    let flag: String
    let region: String
    let subregion: String
    let languages: String
    let population: String
    let flagImageURL: URL
}

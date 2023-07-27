//
//  HomeViewModelML.swift
//  TravelWise
//
//  Created by apple on 26.07.2023.
//

import CoreML

class HomeViewModelML {
    func collectUserData(interests: String, budget: Double, preferredHousing: String, rating: Double) -> String {
        do {
            let config = MLModelConfiguration()
            let model = try MyTabularClassifier(configuration: config)
            let predict = try model.prediction(interests: interests, budget: budget, preferredHousing: preferredHousing, rating: rating)
            return predict.recommendedCountry
        } catch {
            print("Error while making prediction: \(error)")
            return "error"
        }
    }
}

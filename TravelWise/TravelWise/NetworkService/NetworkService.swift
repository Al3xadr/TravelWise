//
//  NetworkService.swift
//  TravelWise
//
//  Created by apple on 27.07.2023.
//

import Foundation
class CountryAPIService {
    func fetchCountryData(for countryName: String, completion: @escaping (Result<CountryResponse, Error>) -> Void) {
        let baseURLString = "https://restcountries.com/v3.1/name/"
        let url = baseURLString + "\(countryName.lowercased())"
        
        guard let url = URL(string: baseURLString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let countryData = try decoder.decode([CountryResponse].self, from: data)
                
                switch countryData.first {
                case .some(let country):
                    completion(.success(country))
                case .none:
                    completion(.failure(NSError(domain: "Country not found", code: 0, userInfo: nil)))
                }
            } catch let error {
                completion(.failure(error))
                print("\(error)")
            }
        }
        
        task.resume()
    }

}


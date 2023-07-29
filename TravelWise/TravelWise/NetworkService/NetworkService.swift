//
//  NetworkService.swift
//  TravelWise
//
//  Created by apple on 27.07.2023.
// API key: 5ae2e3f221c38a28845f05b6e570c73987e20bffab61fd81315fd648


import Foundation
final class CountryAPIService {
    func fetchCountryData(for countryName: String, completion: @escaping (Result<CountryResponse, Error>) -> Void) {
        let baseURLString = APIEndpoints.countryByName
        let url = baseURLString + "\(countryName.lowercased())"
        
        guard let url = URL(string: url) else {
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


//
//  NetworkCityData.swift
//  TravelWise
//
//  Created by apple on 28.07.2023.
//

import Foundation

final class NetworkCityData {
    func fetchCountryData(latitude: Double, longitude: Double, completion: @escaping (Result<WikipediaResponse, Error>) -> Void) {
        let baseUrl = WikipediaAPI.baseUrl + WikipediaAPI.ggscoord + "\(latitude)" + WikipediaAPI.c7 + "\(longitude)" + WikipediaAPI.colimit + WikipediaAPI.radius
        
        guard let url = URL(string: baseUrl) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { (data, response, error) in
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
                let wikipediaResponse = try decoder.decode(WikipediaResponse.self, from: data)
                
                completion(.success(wikipediaResponse))
            } catch let error {
                completion(.failure(error))
                print("\(error)")
            }
        }
        
        task.resume()
    }
    
}

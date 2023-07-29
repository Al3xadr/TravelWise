//
//  NetworkCityData.swift
//  TravelWise
//
//  Created by apple on 28.07.2023.
//

import Foundation

final class NetworkCityData {
    func fetchCountryData(latitude: Double, longitude: Double, completion: @escaping (Result<WikipediaResponse, Error>) -> Void) {
        let baseUrlString = "https://en.wikipedia.org/w/api.php?ggscoord=\(latitude)%7C\(longitude)&action=query&prop=coordinates%7Cpageimages%7Cpageterms&colimit=50&piprop=thumbnail&pithumbsize=500&pilimit=50&wbptterms=description&generator=geosearch&ggsradius=10000&ggslimit=50&format=json"
        
        guard let url = URL(string: baseUrlString) else {
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

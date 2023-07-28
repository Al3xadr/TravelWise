//
//  ModelInfoCountry.swift
//  TravelWise
//
//  Created by apple on 28.07.2023.
//

import Foundation

struct WikipediaResponse: Codable {
    let batchcomplete: String
    let query: Query
}

struct Query: Codable {
    let pages: [String: Page]
}

struct Page: Codable {
    let pageid: Int
    let ns: Int
    let title: String
    let index: Int
    let coordinates: [Coordinates]
    let thumbnail: Thumbnail?
    let terms: Terms?
}

struct Coordinates: Codable {
    let lat: Double
    let lon: Double
    let primary: String?
    let globe: String
}

struct Thumbnail: Codable {
    let source: String
    let width: Int
    let height: Int
}

struct Terms: Codable {
    let description: [String]
}

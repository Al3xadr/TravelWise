//
//  StaticURL.swift
//  TravelWise
//
//  Created by apple on 29.07.2023.
//

import Foundation
struct APIEndpoints {
    static let baseUrl = "https://restcountries.com/v3.1/"
    static let countryByName = "\(baseUrl)name/"
}


struct WikipediaAPI {
    static let baseUrl = "https://en.wikipedia.org/w/api.php"
    static let ggscoord = "?ggscoord="
    static let c7 = "%7C"
    static let colimit = "&action=query&prop=coordinates%7Cpageimages%7Cpageterms&colimit=50&"
    static let radius = "piprop=thumbnail&pithumbsize=500&pilimit=50&wbptterms=description&generator=geosearch&ggsradius=10000&ggslimit=50&format=json"
}

//
//  SearchResponse.swift
//  OmdbApp
//
//  Created by Ali Çolak on 7.11.2023.
//

import Foundation

struct SearchResponse: Codable {
    let search: [SearchItemResponse]?
    let totalResults: String?
    let response: String
    let error: String?
    
    private enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
        case response = "Response"
        case error = "Error"
    }
}

struct SearchItemResponse: Codable {
    let title: String?
    let year: String?
    let imdbID: String?
    let type: String?
    let poster: String?
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
}

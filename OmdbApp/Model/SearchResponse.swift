//
//  SearchResponse.swift
//  OmdbApp
//
//  Created by Ali Çolak on 7.11.2023.
//

import Foundation

struct SearchResponse: Codable {
    let search: [SearchItem]?
    let totalResults: String?
    let response: String
    let error: String?
}


struct SearchItem: Codable {
    let title: String
    let year: String
    let imdbID: String
    let type: String
    let poster: String
}

//
//  OmdbService.swift
//  OmdbApp
//
//  Created by Ali Çolak on 7.11.2023.
//

import Foundation

import Foundation

enum ServiceError : Error {
    case serverError
    case decodingError
    case urlError
}

protocol OmdbService {
    func fetchSearchResponse(searchText: String, pageNumber: Int,completion: @escaping (Result<SearchResponse, ServiceError>) -> ())
    func fetchDetailsResponse(imdbId: String, completion: @escaping (Result<DetailResponse, ServiceError>) -> ())
}

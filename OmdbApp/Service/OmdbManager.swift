//
//  OmdbManager.swift
//  OmdbApp
//
//  Created by Ali Çolak on 7.11.2023.
//

import Foundation

final class OmdbManager :  OmdbService {
    
    private struct Constants {
        static let baseURL = AppConstants.baseUrl
        static let searchQuery = AppConstants.searchQuery
        static let pageQuery = AppConstants.pageQuery
        static let imdbQuery = AppConstants.imdbQuery
    }
    
    func fetchSearchResponse(searchText: String, pageNumber: Int,completion: @escaping (Result<SearchResponse, ServiceError>) -> ()) {
        
        if let url = URL(string: Constants.baseURL + Constants.searchQuery + searchText +  Constants.pageQuery + String(pageNumber)) {
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                if error != nil {
                    completion(.failure(.serverError))
                } else if let data = data {
                    
                    let response = try? JSONDecoder().decode(SearchResponse.self, from: data)
                    
                    
                    if let response = response {
                        completion(.success(response))
                    } else {
                        completion(.failure(.decodingError))
                    }
                }
            }.resume()
            
        } else {
            completion(.failure(.urlError))
            return
        }
        
    }
    
    func fetchDetailsResponse(imdbId: String, completion: @escaping (Result<DetailItemResponse, ServiceError>) -> ()) {
        
        if let url = URL(string: Constants.baseURL + Constants.imdbQuery + imdbId) {
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                if error != nil {
                    completion(.failure(.serverError))
                } else if let data = data {
                    
                    
                    let response = try? JSONDecoder().decode(DetailItemResponse.self, from: data)
                    
                    if let response = response {
                        completion(.success(response))
                    } else {
                        completion(.failure(.decodingError))
                    }
                }
            }.resume()
            
        } else {
            completion(.failure(.urlError))
            return
        }
        
    }
    
}

//
//  MockOmdbManager.swift
//  OmdbAppTests
//
//  Created by Ali Çolak on 13.11.2023.
//

import XCTest
@testable import OmdbApp


final class MockOmdbManager: OmdbService {
    
    func fetchSearchResponse(searchText: String, pageNumber: Int, completion: @escaping (Result<OmdbApp.SearchResponse, OmdbApp.ServiceError>) -> ()) {
        
        switch searchText {
        case "batman":
            switch pageNumber {
            case 1:
                completion(.success(SearchMockData.batmanSearchResponsePage1))
            case 2:
                completion(.success(SearchMockData.batmanSearchResponsePage2))
            default:
                completion(.failure(.serverError))
            }
        case "fight club":
            switch pageNumber {
            case 1:
                completion(.success(SearchMockData.fightClubSearchResponsePage1))
            case 2:
                completion(.success(SearchMockData.fightClubSearchResponsePage2))
            case 3:
                completion(.success(SearchMockData.fightClubSearchResponsePage3))
            case 4:
                completion(.success(SearchMockData.fightClubSearchResponsePage4))
            case 5:
                completion(.success(SearchMockData.fightClubSearchResponsePage5))
            case 6:
                completion(.success(SearchMockData.fightClubSearchResponsePage6))
            case 7:
                completion(.success(SearchMockData.fightClubSearchResponsePage7))
            default:
                completion(.failure(.serverError))
                
            }
        default:
            completion(.failure(.urlError))
        }
        
    }
    
    func fetchDetailsResponse(imdbId: String, completion: @escaping (Result<OmdbApp.DetailItemResponse, OmdbApp.ServiceError>) -> ()) {
        
        
        switch imdbId {
        case "tt0372784":
            completion(.success(DetailMockData.firstItemDetail))
        case "tt2975590":
            completion(.success(DetailMockData.secondItemDetail))
        case "tt1877830":
            completion(.success(DetailMockData.thirdItemDetail))
        case "tt0096895":
            completion(.success(DetailMockData.fourthItemDetail))
        default:
            completion(.failure(.urlError))
        }
        
    }
    
    
}

//
//  DetailViewModel.swift
//  OmdbApp
//
//  Created by Ali Çolak on 7.11.2023.
//

import Foundation

class DetailViewModel {
    
    private let omdbService : OmdbService
    
    weak var delegate : DetailViewModelDelegate?
    
    init(omdbService: OmdbService) {
        self.omdbService = omdbService
    }
    
    func getItem(imdbId: String) {
        fetchItemDetail(imdbId: imdbId)
    }
    
    private func fetchItemDetail(imdbId: String) {
        
        omdbService.fetchDetailsResponse(imdbId: imdbId) { result in
            
            switch result {
            case .success(let item):
                
                let itemDto = DetailItemDto.init(item: item)
                
                self.delegate?.updateItem(item: itemDto)
                
            case .failure(let error):
                switch error {
                case .urlError:
                    print("There is an error in the url")
                case .decodingError:
                    print("There is an Error in Model or JSON data")
                case .serverError:
                    print("There is a problem with the server")
                }
            }
            
        }
    }
    
}

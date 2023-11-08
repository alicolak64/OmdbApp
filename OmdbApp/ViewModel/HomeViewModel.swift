//
//  HomeViewModel.swift
//  OmdbApp
//
//  Created by Ali Çolak on 7.11.2023.
//

import Foundation

class HomeViewModel {
    
    private let omdbService : OmdbService
    
    weak var delegate : HomeViewModelDelegate?
    
    private var searchItems: [SearchItemDto] = []
    
    private var pageNumber : Int = 1
    private var totalResults : Int = 1
    
    private var searchText: String?
    
    init(omdbService: OmdbService) {
        self.omdbService = omdbService
        initConfig()
    }
    
    private func initConfig() {
        searchText = AppConstants.initalSearch
        pageNumber = 1
        fetchInitalData()
    }
    
    
    private func fetchInitalData() {
        fetchItems()
    }
    
    private func representItems() {
        
        var uniqueItems: [SearchItemDto] = []
        var seenIDs = Set<String>()
        for item in searchItems {
            if !seenIDs.contains(item.imdbId) {
                uniqueItems.append(item)
                seenIDs.insert(item.imdbId)
            }
        }
        
        self.delegate?.updateSearchItems(searchItems: uniqueItems)
        
        if uniqueItems.isEmpty {
            self.delegate?.movieNotFound()
        }
        
    }
    
    func searchItems(text: String) {
        
        searchText = text
        
        if text.count > 2 { // if search text is not greater than 3 api throw an error and send a "Too many results." message
            
            pageNumber = 1
            fetchItems()
            
        } else {
            searchItems = []
            representItems()
        }
    }
    
    func getNextPageItems() {
        
        if let searchText {
            if searchText.count > 2 {
                
                if AppConstants.pageSize * pageNumber < totalResults {
                    fetchItems()
                }
                
            }
        }
        
    }
    
    private func fetchItems() {
        
        omdbService.fetchSearchResponse(searchText: searchText ?? AppConstants.initalSearch,pageNumber: pageNumber) { [self] result in
            
            switch result {
            case .success(let response):
                                
                if AppConstantFunctions.isSuccessResponse(response: response) {
                    
                    if let totalResultsString = response.totalResults, let totalResults = Int(totalResultsString) {
                        
                        self.pageNumber = self.pageNumber + 1
                        
                        self.totalResults = totalResults
                                                
                        if let items = response.search {
                            let newItems = items.map(SearchItemDto.init)
                            self.searchItems.append(contentsOf: newItems)
                        }
                        
                        self.representItems()
                        
                    }
                    
                } else {
                    self.searchItems = []
                    self.representItems()
                }
                
                
                
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

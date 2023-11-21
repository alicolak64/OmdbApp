//
//  HomeViewModel.swift
//  OmdbApp
//
//  Created by Ali Çolak on 7.11.2023.
//

import UIKit

final class HomeViewModel: NSObject {
    
    private let omdbService: OmdbService
    
    private weak var delegate: HomeViewModelDelegate?
    
    private var searchItems: [SearchItemDto] = []
    
    private var pageNumber: Int = 1
    private var totalResults: Int = 1
    
    private var searchText: String?
    
    private var lastScrollTime: Date?
    private var lastSearchTime: Date?
    
    init(delegate: HomeViewModelDelegate, omdbService: OmdbService = OmdbManager.shared) {
        self.delegate = delegate
        self.omdbService = omdbService
    }
    
    func searchItems(text: String) {
        
        searchText = text
        
        if text.count > 2 { // if search text is not greater than 3 api throw an error and send a "Too many results." message
            
            pageNumber = 1
            searchItems = []
            fetchItems()
            
        } else {
            searchItems = []
            representItems()
        }
        
    }
    
    func getNextPageItems() {
        
        if let searchText, searchText.count > 2 {
            if (AppConstants.pageSize - 1) * pageNumber < totalResults {
                fetchItems()
            }
        }
        
    }
    
    private func representItems() {
        
        self.delegate?.reloadCollectionView()
        
        if searchItems.isEmpty {
            if searchText?.count ?? 0 <= 2 {
                self.delegate?.updateErrorText(text: AppTexts.characterErrorText)
            } else {
                self.delegate?.updateErrorText(text: AppTexts.movieNotFoundErrorText)
            }
            
            self.delegate?.hideCollectionView()
            
        } else {
            self.delegate?.showCollectionView()
        }
        
    }
    
    private func fetchItems() {
        
        omdbService.fetchSearchResponse(searchText: searchText ?? AppConstants.initalSearch,pageNumber: pageNumber) { [weak self] result in
            
            switch result {
            case .success(let response):
                
                if AppConstantFunctions.isSuccessResponse(response: response) {
                    
                    if let totalResultsString = response.totalResults, let totalResults = Int(totalResultsString) {
                        
                        self?.pageNumber = (self?.pageNumber ?? 1) + 1
                        
                        self?.totalResults = totalResults
                        
                        if let items = response.search {
                            let newItems = items.map(SearchItemDto.init)
                            self?.searchItems.append(contentsOf: newItems)
                        }
                        
                        self?.representItems()
                        
                    }
                    
                } else {
                    self?.searchItems = []
                    self?.representItems()
                }
                
                
                
            case .failure(let error):
                switch error {
                case .urlError:
                    self?.searchItems = []
                    self?.representItems()
                case .decodingError:
                    self?.searchItems = []
                    self?.representItems()
                case .serverError:
                    self?.searchItems = []
                    self?.representItems()
                }
            }
            
        }
    }
}

extension HomeViewModel: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCell.identifier, for: indexPath) as! SearchCell
        
        cell.configure(with: searchItems[indexPath.row])
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        self.delegate?.closeKeyboard()
        
        let contentHeight = scrollView.contentSize.height
        let visibleHeight = scrollView.bounds.height
        let scrollOffset = scrollView.contentOffset.y
        
        let scrollPercentage = (scrollOffset + visibleHeight) / contentHeight
        
        if scrollPercentage >= AppConstants.infinityScrollPercentage {
            
            let now = Date()
            if let lastRequestTime = lastScrollTime, now.timeIntervalSince(lastRequestTime) < AppConstants.infinityScrollLateLimitSecond {
                return
            }
            
            self.getNextPageItems()
            
            self.lastScrollTime = now
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let imdbId = searchItems[indexPath.row].imdbId
        let destinationVC = DetailViewController()
        destinationVC.getData(imdbId: imdbId, items: searchItems)
        
        self.delegate?.closeKeyboard()
        
        self.delegate?.navigateDetailPage(destinationVC: destinationVC)
        
    }
    
}

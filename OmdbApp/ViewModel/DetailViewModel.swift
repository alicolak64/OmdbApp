//
//  DetailViewModel.swift
//  OmdbApp
//
//  Created by Ali Çolak on 7.11.2023.
//

import UIKit

final class DetailViewModel: NSObject {
    
    private let omdbService: OmdbService
    
    private weak var delegate: DetailViewModelDelegate?
    
    private var item: DetailItemDto?
    private var genres: [String] = []
    private var ratings: [RatingDto] = []
    
    private var items: [SearchItemDto] = []
    
    private var currentItemIndex: Int?
    
    init(delegate: DetailViewModelDelegate, omdbService: OmdbService = OmdbManager.shared) {
        self.delegate = delegate
        self.omdbService = omdbService
    }
    
    func getItem(imdbId: String) {
        fetchItemDetail(imdbId: imdbId)
    }
    
    func setData(imdbId: String, items: [SearchItemDto]) {
        self.items = items
        getItem(imdbId: imdbId)
    }
    
    func getBackItem() {
        let previousImdbId = items[(currentItemIndex ?? 0) - 1].imdbId
        getItem(imdbId: previousImdbId)
    }
    
    func getNextItem() {
        let nextImdbId = items[(currentItemIndex ?? 0) + 1].imdbId
        getItem(imdbId: nextImdbId)
    }
    
    private func fetchItemDetail(imdbId: String) {
        
        omdbService.fetchDetailsResponse(imdbId: imdbId) { [weak self] result in
            
            switch result {
            case .success(let item):
                
                let itemDto = DetailItemDto.init(item: item)
                
                self?.item = itemDto
                
                self?.currentItemIndex = self?.items.firstIndex(where: { $0.imdbId == itemDto.imdbID })
                
                self?.genres = itemDto.genre.components(separatedBy: ", ")
                
                self?.ratings = itemDto.ratings ?? []
                
                self?.delegate?.updateItem(item: itemDto)
                
                if (self?.currentItemIndex == 0) {
                    self?.delegate?.hideBackItemButton()
                } else {
                    self?.delegate?.showBackItemButton()
                }
                
                if (((self?.currentItemIndex ?? 0) + 1) == self?.items.count) {
                    self?.delegate?.hideNextItemButton()
                } else {
                    self?.delegate?.showNextItemButton()
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

extension DetailViewModel: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1 {
            return genres.count
        } else if collectionView.tag == 2 {
            return ratings.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GenreCell.identifier, for: indexPath) as! GenreCell
            
            cell.configure(with: genres[indexPath.row])
            
            return cell
        } else if collectionView.tag == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RatingCell.identifier, for: indexPath) as! RatingCell
            
            cell.configure(with: ratings[indexPath.row])
            
            return cell
        } else {
            return UICollectionViewCell()
        }
        
    }
    
}


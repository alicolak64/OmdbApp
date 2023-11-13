//
//  MockDetailViewOutput.swift
//  OmdbAppTests
//
//  Created by Ali Çolak on 13.11.2023.
//

import XCTest
@testable import OmdbApp

class MockDetailViewOutput : DetailViewModelDelegate {
    
    var item : DetailItemDto?
    var genres : [String] = []
    var ratings: [RatingDto] = []

    func updateItem(item: OmdbApp.DetailItemDto) {
        self.item = item
        self.ratings = item.ratings ?? []
        self.genres = item.genre.components(separatedBy: ", ")
    }
    
    
}

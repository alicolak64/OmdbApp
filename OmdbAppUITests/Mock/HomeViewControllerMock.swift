//
//  HomeViewControllerMock.swift
//  OmdbAppUITests
//
//  Created by Ali Çolak on 12.11.2023.
//

import Foundation

struct HomeViewControllerMock {
    static let firstCellForBatman = SearchItemMock.init(title: "Batman Begins", year: "2005", type: "Movie")
    static let scrollTestForBatman = SearchItemMock.init(title: "Batman & Robin", year: "1997", type: "Movie")
    static let paginationTestForBatman = SearchItemMock.init(title: "Batman: The Movie", year: "1966", type: "Movie")
    static let firstCellForFightClub = SearchItemMock.init(title: "Fight Club", year: "1999", type: "Movie")
    static let lastCellPaginationFightClub = SearchItemMock.init(title: "Eye of the Empress: The ...", year: "2015", type: "Movie") 
    static let appName = "Omdb App"
    static let characterErrorText = "Must Be At Least 3 Characters"
    static let movieNotFoundErrorText = "Movie Not Found"
    static let movieTypeText = "Movie"
    static let testSearchText = "Fight Club"
    static let testShortSearchText = "Ba"
    static let movieNotFoundSearchText = "Batmanman"
}


struct SearchItemMock: Codable {
    let title: String
    let year: String
    let type: String
}

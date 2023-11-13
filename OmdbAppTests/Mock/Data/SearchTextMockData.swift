//
//  SearchTextMockData.swift
//  OmdbAppTests
//
//  Created by Ali Çolak on 13.11.2023.
//

import XCTest
@testable import OmdbApp

struct SearchTextMockData {
    static let initalSearchText = AppConstants.initalSearch
    static let fightClubSearchText = "fight club"
    static let shortSearchText = "ba"
    static let movieNotFoundSearchText = "batmanman"
    static let characterErrorText = AppTexts.characterErrorText
    static let movieNotFoundErrorText = AppTexts.movieNotFoundErrorText
}

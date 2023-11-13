//
//  OmdbAppTests.swift
//  OmdbAppTests
//
//  Created by Ali Çolak on 7.11.2023.
//

import XCTest
@testable import OmdbApp

final class OmdbAppHomeTests: XCTestCase {
    
    private var mockOmdbService : MockOmdbManager!
    private var mockHomeViewModel : HomeViewModel!
    private var mockHomeViewOutput : MockHomeViewOutput!
    
    
    override func setUpWithError() throws {
        mockOmdbService = MockOmdbManager()
        
        mockHomeViewModel = HomeViewModel(omdbService: mockOmdbService)
        
        mockHomeViewOutput = MockHomeViewOutput()
        mockHomeViewModel.delegate = mockHomeViewOutput
                
    }
    
    override func tearDownWithError() throws {
        mockHomeViewModel = nil
        mockOmdbService = nil
        mockHomeViewOutput = nil
    }
    
    func testSearchMovieForBatman_whenAPISuccess_itemCount() throws {
        mockHomeViewModel.searchItems(text: SearchTextMockData.initalSearchText)
        XCTAssertEqual(mockHomeViewOutput.items.count, SearchMockData.batmanSearchResponsePage1.search?.count)
    }
    
    func testSearchMovieForBatman_whenEnterShortCharacter_showError() throws {
        mockHomeViewModel.searchItems(text: SearchTextMockData.shortSearchText)
        XCTAssertEqual(mockHomeViewOutput.items.count, 0)
        XCTAssertEqual(mockHomeViewOutput.errorText, SearchTextMockData.characterErrorText)
    }
    
    func testSearchMovie_whenAPIResponseFailure_showError() throws {
        mockHomeViewModel.searchItems(text: SearchTextMockData.movieNotFoundSearchText)
        XCTAssertEqual(mockHomeViewOutput.items.count, 0)
        XCTAssertEqual(mockHomeViewOutput.errorText, SearchTextMockData.movieNotFoundErrorText)
    }
    
    func testSearchMovieForBatman_whenAPISuccess_showFirstItem() throws {
        mockHomeViewModel.searchItems(text: SearchTextMockData.initalSearchText)
        let item1 = mockHomeViewOutput.items[0]
        let item2 = SearchMockData.batmanSearchResponsePage1.search?.map(SearchItemDto.init)[0]
        XCTAssertEqual(item1.imdbId, item2?.imdbId)
        XCTAssertEqual(item1.title, item2?.title)
        XCTAssertEqual(item1.poster, item2?.poster)
        XCTAssertEqual(item1.year, item2?.year)
        XCTAssertEqual(item1.type, item2?.type)
    }
    
    func testSearchMovieForBatman_whenAPISuccess_showLastItem() throws {
        mockHomeViewModel.searchItems(text: SearchTextMockData.initalSearchText)
        let item1 = mockHomeViewOutput.items[mockHomeViewOutput.items.count - 1]
        let item2 = SearchMockData.batmanSearchResponsePage1.search?.map(SearchItemDto.init)[SearchMockData.batmanSearchResponsePage1.search!.count - 1]
        XCTAssertEqual(item1.imdbId, item2?.imdbId)
        XCTAssertEqual(item1.title, item2?.title)
        XCTAssertEqual(item1.poster, item2?.poster)
        XCTAssertEqual(item1.year, item2?.year)
        XCTAssertEqual(item1.type, item2?.type)
    }
    
    func testPaginationForBatman_whenAPISuccess_itemCount() throws {
        mockHomeViewModel.searchItems(text: SearchTextMockData.initalSearchText)
        mockHomeViewModel.getNextPageItems()
        let itemCount = SearchMockData.batmanSearchResponsePage1.search!.count + SearchMockData.batmanSearchResponsePage2.search!.count
        XCTAssertEqual(mockHomeViewOutput.items.count, itemCount)
    }
    
    func testPaginationForBatman_whenAPISuccess_showFirstItem() throws {
        mockHomeViewModel.searchItems(text: SearchTextMockData.initalSearchText)
        mockHomeViewModel.getNextPageItems()
        let item1 = mockHomeViewOutput.items[0]
        let item2 = SearchMockData.batmanSearchResponsePage1.search?.map(SearchItemDto.init)[0]
        XCTAssertEqual(item1.imdbId, item2?.imdbId)
        XCTAssertEqual(item1.title, item2?.title)
        XCTAssertEqual(item1.poster, item2?.poster)
        XCTAssertEqual(item1.year, item2?.year)
        XCTAssertEqual(item1.type, item2?.type)
    }
    
    func testPaginationForBatman_whenAPISuccess_showLastItem() throws {
        mockHomeViewModel.searchItems(text: SearchTextMockData.initalSearchText)
        mockHomeViewModel.getNextPageItems()
        let item1 = mockHomeViewOutput.items[mockHomeViewOutput.items.count - 1]
        let item2 = SearchMockData.batmanSearchResponsePage2.search?.map(SearchItemDto.init)[SearchMockData.batmanSearchResponsePage2.search!.count - 1]
        XCTAssertEqual(item1.imdbId, item2?.imdbId)
        XCTAssertEqual(item1.title, item2?.title)
        XCTAssertEqual(item1.poster, item2?.poster)
        XCTAssertEqual(item1.year, item2?.year)
        XCTAssertEqual(item1.type, item2?.type)
    }
    
    func testSearchMovieForFightClub_whenAPISuccess_itemCount() throws {
        mockHomeViewModel.searchItems(text: SearchTextMockData.fightClubSearchText)
        XCTAssertEqual(mockHomeViewOutput.items.count, SearchMockData.fightClubSearchResponsePage1.search?.count)
    }
    
    func testSearchMovieForFightClub_whenAPISuccess_showFirstItem() throws {
        mockHomeViewModel.searchItems(text: SearchTextMockData.fightClubSearchText)
        let item1 = mockHomeViewOutput.items[0]
        let item2 = SearchMockData.fightClubSearchResponsePage1.search?.map(SearchItemDto.init)[0]
        XCTAssertEqual(item1.imdbId, item2?.imdbId)
        XCTAssertEqual(item1.title, item2?.title)
        XCTAssertEqual(item1.poster, item2?.poster)
        XCTAssertEqual(item1.year, item2?.year)
        XCTAssertEqual(item1.type, item2?.type)
    }
    
    func testSearchMovieForFightClub_whenAPISuccess_showLastItem() throws {
        mockHomeViewModel.searchItems(text: SearchTextMockData.fightClubSearchText)
        let item1 = mockHomeViewOutput.items[mockHomeViewOutput.items.count - 1]
        let item2 = SearchMockData.fightClubSearchResponsePage1.search?.map(SearchItemDto.init)[SearchMockData.fightClubSearchResponsePage1.search!.count - 1]
        XCTAssertEqual(item1.imdbId, item2?.imdbId)
        XCTAssertEqual(item1.title, item2?.title)
        XCTAssertEqual(item1.poster, item2?.poster)
        XCTAssertEqual(item1.year, item2?.year)
        XCTAssertEqual(item1.type, item2?.type)
    }
    
    func testPaginationForFightClub_whenAPISuccess_itemCount() throws {
        mockHomeViewModel.searchItems(text: SearchTextMockData.fightClubSearchText)
        mockHomeViewModel.getNextPageItems()
        let itemCount = SearchMockData.fightClubSearchResponsePage1.search!.count + SearchMockData.fightClubSearchResponsePage2.search!.count
        XCTAssertEqual(mockHomeViewOutput.items.count, itemCount)
    }
    
    func testPaginationForFightClub_whenAPISuccess_showFirstItem() throws {
        mockHomeViewModel.searchItems(text: SearchTextMockData.fightClubSearchText)
        mockHomeViewModel.getNextPageItems()
        let item1 = mockHomeViewOutput.items[0]
        let item2 = SearchMockData.fightClubSearchResponsePage1.search?.map(SearchItemDto.init)[0]
        XCTAssertEqual(item1.imdbId, item2?.imdbId)
        XCTAssertEqual(item1.title, item2?.title)
        XCTAssertEqual(item1.poster, item2?.poster)
        XCTAssertEqual(item1.year, item2?.year)
        XCTAssertEqual(item1.type, item2?.type)
    }
    
    func testPaginationForFightClub_whenAPISuccess_showLastItem() throws {
        mockHomeViewModel.searchItems(text: SearchTextMockData.fightClubSearchText)
        mockHomeViewModel.getNextPageItems()
        let item1 = mockHomeViewOutput.items[mockHomeViewOutput.items.count - 1]
        let item2 = SearchMockData.fightClubSearchResponsePage2.search?.map(SearchItemDto.init)[SearchMockData.fightClubSearchResponsePage2.search!.count - 1]
        XCTAssertEqual(item1.imdbId, item2?.imdbId)
        XCTAssertEqual(item1.title, item2?.title)
        XCTAssertEqual(item1.poster, item2?.poster)
        XCTAssertEqual(item1.year, item2?.year)
        XCTAssertEqual(item1.type, item2?.type)
    }
    
    func testLastPagePaginationForFightClub_whenAPISuccess_showLastItem() throws {
        mockHomeViewModel.searchItems(text: SearchTextMockData.fightClubSearchText)
        mockHomeViewModel.getNextPageItems()
        mockHomeViewModel.getNextPageItems()
        mockHomeViewModel.getNextPageItems()
        mockHomeViewModel.getNextPageItems()
        mockHomeViewModel.getNextPageItems()
        mockHomeViewModel.getNextPageItems()
        mockHomeViewModel.getNextPageItems()
        let item1 = mockHomeViewOutput.items[mockHomeViewOutput.items.count - 1]
        let item2 = SearchMockData.fightClubSearchResponsePage7.search?.map(SearchItemDto.init)[SearchMockData.fightClubSearchResponsePage7.search!.count - 1] // Last Page 6 element
        XCTAssertEqual(item1.imdbId, item2?.imdbId)
        XCTAssertEqual(item1.title, item2?.title)
        XCTAssertEqual(item1.poster, item2?.poster)
        XCTAssertEqual(item1.year, item2?.year)
        XCTAssertEqual(item1.type, item2?.type)
    }
        
}

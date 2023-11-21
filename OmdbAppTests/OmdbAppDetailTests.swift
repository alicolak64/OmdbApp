//
//  OmdbAppTests.swift
//  OmdbAppTests
//
//  Created by Ali Çolak on 7.11.2023.
//

import XCTest
@testable import OmdbApp

final class OmdbAppDetailTests: XCTestCase {
    
    private var mockOmdbService: MockOmdbManager!
    private var mockDetailViewModel: DetailViewModel!
    private var mockDetailViewModelOutput: MockDetailViewOutput!
    
    private var item: DetailItemDto!
    
    override func setUpWithError() throws {
        mockOmdbService = MockOmdbManager()
        
        mockDetailViewModelOutput = MockDetailViewOutput()
        
        mockDetailViewModel = DetailViewModel(delegate: mockDetailViewModelOutput, omdbService: mockOmdbService)
        
        mockDetailViewModel.setData(imdbId: DetailMockData.initalImdbId, items: SearchMockData.batmanSearchResponsePage1.search!.map(SearchItemDto.init))
        
        item = DetailItemDto.init(item: DetailMockData.thirdItemDetail)
        
    }
    
    override func tearDownWithError() throws {
        mockDetailViewModel = nil
        mockOmdbService = nil
        mockDetailViewModelOutput = nil
    }
    
    func testItemDetailsForBatman_whenAPISuccess_showDetail() throws {
        XCTAssertEqual(mockDetailViewModelOutput.item?.title, item.title)
        XCTAssertEqual(mockDetailViewModelOutput.item?.poster, item.poster)
        XCTAssertEqual(mockDetailViewModelOutput.item?.imdbRating, item.imdbRating)
        XCTAssertEqual(mockDetailViewModelOutput.item?.imdbRating, item.imdbRating)
        XCTAssertEqual(mockDetailViewModelOutput.item?.type, item.type)
        XCTAssertEqual(mockDetailViewModelOutput.item?.runtime, item.runtime)
        XCTAssertEqual(mockDetailViewModelOutput.item?.language, item.language)
        XCTAssertEqual(mockDetailViewModelOutput.item?.rated, item.rated)
        XCTAssertEqual(mockDetailViewModelOutput.item?.released, item.released)
        XCTAssertEqual(mockDetailViewModelOutput.item?.plot, item.plot)
        XCTAssertEqual(mockDetailViewModelOutput.item?.country, item.country)
        XCTAssertEqual(mockDetailViewModelOutput.item?.director, item.director)
        XCTAssertEqual(mockDetailViewModelOutput.item?.writer, item.writer)
        XCTAssertEqual(mockDetailViewModelOutput.item?.actors, item.actors)
        XCTAssertEqual(mockDetailViewModelOutput.item?.awards, item.awards)
        XCTAssertEqual(mockDetailViewModelOutput.item?.imdbVotes, item.imdbVotes)
        XCTAssertEqual(mockDetailViewModelOutput.item?.boxOffice, item.boxOffice)
    }
    
    func testItemDetailsForBatman2_whenAPISuccess_showDetail() throws {
        mockDetailViewModel.getItem(imdbId: DetailMockData.seconImdbId)
        item = DetailItemDto.init(item: DetailMockData.secondItemDetail)
        XCTAssertEqual(mockDetailViewModelOutput.item?.title, item.title)
        XCTAssertEqual(mockDetailViewModelOutput.item?.poster, item.poster)
        XCTAssertEqual(mockDetailViewModelOutput.item?.imdbRating, item.imdbRating)
        XCTAssertEqual(mockDetailViewModelOutput.item?.imdbRating, item.imdbRating)
        XCTAssertEqual(mockDetailViewModelOutput.item?.type, item.type)
        XCTAssertEqual(mockDetailViewModelOutput.item?.runtime, item.runtime)
        XCTAssertEqual(mockDetailViewModelOutput.item?.language, item.language)
        XCTAssertEqual(mockDetailViewModelOutput.item?.rated, item.rated)
        XCTAssertEqual(mockDetailViewModelOutput.item?.released, item.released)
        XCTAssertEqual(mockDetailViewModelOutput.item?.plot, item.plot)
        XCTAssertEqual(mockDetailViewModelOutput.item?.country, item.country)
        XCTAssertEqual(mockDetailViewModelOutput.item?.director, item.director)
        XCTAssertEqual(mockDetailViewModelOutput.item?.writer, item.writer)
        XCTAssertEqual(mockDetailViewModelOutput.item?.actors, item.actors)
        XCTAssertEqual(mockDetailViewModelOutput.item?.awards, item.awards)
        XCTAssertEqual(mockDetailViewModelOutput.item?.imdbVotes, item.imdbVotes)
        XCTAssertEqual(mockDetailViewModelOutput.item?.boxOffice, item.boxOffice)
    }
    
    func testShowNextButton_whenAPISuccess_showButton() throws {
        XCTAssertTrue(mockDetailViewModelOutput.isInvokeShowNextItemButton)
        XCTAssertEqual(mockDetailViewModelOutput.invokeShowNextItemButtonCount, 1)
    }
    
    func testShowBackButton_whenAPISuccess_showButton() throws {
        XCTAssertTrue(mockDetailViewModelOutput.isInvokeShowBackItemButton)
        XCTAssertEqual(mockDetailViewModelOutput.invokeShowBackItemButtonCount, 1)
    }
    
    func testHideNextButton_whenAPISuccess_hideButton() throws {
        XCTAssertFalse(mockDetailViewModelOutput.isInvokeHideNextItemButton)
        XCTAssertEqual(mockDetailViewModelOutput.invokeHideNextItemButtonCount, 0)
    }
    
    func testHideBackButton_whenAPISuccess_hideButton() throws {
        XCTAssertFalse(mockDetailViewModelOutput.isInvokeHideBackItemButton)
        XCTAssertEqual(mockDetailViewModelOutput.invokeHideBackItemButtonCount, 0)
    }
    
    func testNextItem_whenAPISuccess_showItemAndButons() throws {
        mockDetailViewModel.getNextItem()
        let nextItem = SearchMockData.batmanSearchResponsePage1.search!.map(SearchItemDto.init)[3]
        XCTAssertEqual(mockDetailViewModelOutput.item?.title, nextItem.title)
        XCTAssertEqual(mockDetailViewModelOutput.invokeShowNextItemButtonCount, 2)
        XCTAssertEqual(mockDetailViewModelOutput.invokeShowBackItemButtonCount, 2)
        XCTAssertEqual(mockDetailViewModelOutput.invokeHideBackItemButtonCount, 0)
        XCTAssertEqual(mockDetailViewModelOutput.invokeHideNextItemButtonCount, 0)
    }
    
    func testBackItem_whenAPISuccess_showItemAndButons() throws {
        mockDetailViewModel.getBackItem()
        let backItem = SearchMockData.batmanSearchResponsePage1.search!.map(SearchItemDto.init)[1]
        XCTAssertEqual(mockDetailViewModelOutput.item?.title, backItem.title)
        XCTAssertEqual(mockDetailViewModelOutput.invokeShowNextItemButtonCount, 2)
        XCTAssertEqual(mockDetailViewModelOutput.invokeShowBackItemButtonCount, 2)
        XCTAssertEqual(mockDetailViewModelOutput.invokeHideBackItemButtonCount, 0)
        XCTAssertEqual(mockDetailViewModelOutput.invokeHideNextItemButtonCount, 0)
    }
    
    func testTwoTimesBackItem_whenAPISuccess_showItemAndButons() throws {
        mockDetailViewModel.getBackItem()
        mockDetailViewModel.getBackItem()
        let backItem = SearchMockData.batmanSearchResponsePage1.search!.map(SearchItemDto.init)[0]
        XCTAssertEqual(mockDetailViewModelOutput.item?.title, backItem.title)
        XCTAssertEqual(mockDetailViewModelOutput.invokeShowNextItemButtonCount, 3)
        XCTAssertEqual(mockDetailViewModelOutput.invokeShowBackItemButtonCount, 2)
        XCTAssertEqual(mockDetailViewModelOutput.invokeHideBackItemButtonCount, 1)
        XCTAssertEqual(mockDetailViewModelOutput.invokeHideNextItemButtonCount, 0)
    }
    
    
}

//
//  OmdbAppTests.swift
//  OmdbAppTests
//
//  Created by Ali Çolak on 7.11.2023.
//

import XCTest
@testable import OmdbApp

final class OmdbAppDetailTests: XCTestCase {
    
    private var mockOmdbService : MockOmdbManager!
    private var mockDetailViewModel : DetailViewModel!
    private var mockDetailViewModelOutput : MockDetailViewOutput!
    
    private var item: DetailItemDto!
    
    override func setUpWithError() throws {
        mockOmdbService = MockOmdbManager()
        
        mockDetailViewModel = DetailViewModel(omdbService: mockOmdbService)
        
        mockDetailViewModelOutput = MockDetailViewOutput()
        mockDetailViewModel.delegate = mockDetailViewModelOutput
        
        mockDetailViewModel.getItem(imdbId: DetailMockData.initalImdbId)
        
        item = DetailItemDto.init(item: DetailMockData.initalItemDetail)
                
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
    
    func testItemGenreForBatman_whenAPISuccess_itemCountAndCells() {
        let itemGenreArray = item.genre.components(separatedBy: ", ")
        XCTAssertEqual(mockDetailViewModelOutput.genres.count, itemGenreArray.count)
        XCTAssertEqual(mockDetailViewModelOutput.genres[0], itemGenreArray[0])
        XCTAssertEqual(mockDetailViewModelOutput.genres[1], itemGenreArray[1])
        XCTAssertEqual(mockDetailViewModelOutput.genres[2], itemGenreArray[2])
    }
    
    func testItemRatingsForBatman_whenAPISuccess_itemCountAndCells() {
        XCTAssertEqual(mockDetailViewModelOutput.ratings.count, item.ratings?.count)
        XCTAssertEqual(mockDetailViewModelOutput.ratings[0].source , item.ratings![0].source)
        XCTAssertEqual(mockDetailViewModelOutput.ratings[0].value , item.ratings![0].value)
        XCTAssertEqual(mockDetailViewModelOutput.ratings[1].source , item.ratings![1].source)
        XCTAssertEqual(mockDetailViewModelOutput.ratings[1].value , item.ratings![1].value)
        XCTAssertEqual(mockDetailViewModelOutput.ratings[2].source , item.ratings![2].source)
        XCTAssertEqual(mockDetailViewModelOutput.ratings[2].value , item.ratings![2].value)
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
    
    func testItemGenreForBatman2_whenAPISuccess_itemCountAndCells() {
        mockDetailViewModel.getItem(imdbId: DetailMockData.seconImdbId)
        item = DetailItemDto.init(item: DetailMockData.secondItemDetail)
        let itemGenreArray = item.genre.components(separatedBy: ", ")
        XCTAssertEqual(mockDetailViewModelOutput.genres.count, itemGenreArray.count)
        XCTAssertEqual(mockDetailViewModelOutput.genres[0], itemGenreArray[0])
        XCTAssertEqual(mockDetailViewModelOutput.genres[1], itemGenreArray[1])
        XCTAssertEqual(mockDetailViewModelOutput.genres[2], itemGenreArray[2])
    }
    
    func testItemRatingsForBatman2_whenAPISuccess_itemCountAndCells() {
        mockDetailViewModel.getItem(imdbId: DetailMockData.seconImdbId)
        item = DetailItemDto.init(item: DetailMockData.secondItemDetail)
        XCTAssertEqual(mockDetailViewModelOutput.ratings.count, item.ratings?.count)
        XCTAssertEqual(mockDetailViewModelOutput.ratings[0].source , item.ratings![0].source)
        XCTAssertEqual(mockDetailViewModelOutput.ratings[0].value , item.ratings![0].value)
        XCTAssertEqual(mockDetailViewModelOutput.ratings[1].source , item.ratings![1].source)
        XCTAssertEqual(mockDetailViewModelOutput.ratings[1].value , item.ratings![1].value)
        XCTAssertEqual(mockDetailViewModelOutput.ratings[2].source , item.ratings![2].source)
        XCTAssertEqual(mockDetailViewModelOutput.ratings[2].value , item.ratings![2].value)
    }
    
}

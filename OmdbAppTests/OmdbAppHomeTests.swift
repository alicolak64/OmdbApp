//
//  OmdbAppTests.swift
//  OmdbAppTests
//
//  Created by Ali Çolak on 7.11.2023.
//

import XCTest
@testable import OmdbApp

final class OmdbAppHomeTests: XCTestCase {
    
    private var mockOmdbService: MockOmdbManager!
    private var mockHomeViewModel: HomeViewModel!
    private var mockHomeViewOutput: MockHomeViewOutput!
    
    
    override func setUpWithError() throws {
        mockOmdbService = MockOmdbManager()
        
        mockHomeViewOutput = MockHomeViewOutput()
        
        mockHomeViewModel = HomeViewModel( delegate: mockHomeViewOutput, omdbService: mockOmdbService)
        
    }
    
    override func tearDownWithError() throws {
        mockHomeViewModel = nil
        mockOmdbService = nil
        mockHomeViewOutput = nil
    }
    
    func testSearchMovieForBatman_whenAPISuccess_reloadData() throws {
        XCTAssertFalse(mockHomeViewOutput.isInvokeReloadCollectionView)
        XCTAssertEqual(mockHomeViewOutput.invokeReloadCollectionViewCount, 0)
        XCTAssertFalse(mockHomeViewOutput.isInvokeShowCollectionView)
        XCTAssertEqual(mockHomeViewOutput.invokeShowCollectionViewCount, 0)
        mockHomeViewModel.searchItems(text: SearchTextMockData.initalSearchText)
        XCTAssertTrue(mockHomeViewOutput.isInvokeReloadCollectionView)
        XCTAssertEqual(mockHomeViewOutput.invokeReloadCollectionViewCount, 1)
        XCTAssertTrue(mockHomeViewOutput.isInvokeShowCollectionView)
        XCTAssertEqual(mockHomeViewOutput.invokeShowCollectionViewCount, 1)
    }
    
    func testSearchMovieForBatman_whenEnterShortCharacter_showError() throws {
        XCTAssertEqual(mockHomeViewOutput.errorText, "")
        XCTAssertEqual(mockHomeViewOutput.invokeUpdateErrorTextCount, 0)
        XCTAssertFalse(mockHomeViewOutput.isInvokeHideCollectionView)
        XCTAssertEqual(mockHomeViewOutput.invokeHideCollectionViewCount, 0)
        mockHomeViewModel.searchItems(text: SearchTextMockData.shortSearchText)
        XCTAssertEqual(mockHomeViewOutput.errorText, SearchTextMockData.characterErrorText)
        XCTAssertEqual(mockHomeViewOutput.invokeUpdateErrorTextCount, 1)
        XCTAssertTrue(mockHomeViewOutput.isInvokeHideCollectionView)
        XCTAssertEqual(mockHomeViewOutput.invokeHideCollectionViewCount, 1)
    }
    
    func testSearchMovie_whenAPIResponseFailure_showError() throws {
        XCTAssertEqual(mockHomeViewOutput.errorText, "")
        XCTAssertEqual(mockHomeViewOutput.invokeUpdateErrorTextCount, 0)
        XCTAssertFalse(mockHomeViewOutput.isInvokeHideCollectionView)
        XCTAssertEqual(mockHomeViewOutput.invokeHideCollectionViewCount, 0)
        mockHomeViewModel.searchItems(text: SearchTextMockData.movieNotFoundSearchText)
        XCTAssertEqual(mockHomeViewOutput.errorText, SearchTextMockData.movieNotFoundErrorText)
        XCTAssertEqual(mockHomeViewOutput.invokeUpdateErrorTextCount, 1)
        XCTAssertTrue(mockHomeViewOutput.isInvokeHideCollectionView)
        XCTAssertEqual(mockHomeViewOutput.invokeHideCollectionViewCount, 1)
    }
    
    func testPagination_whenAPIResponseSuccess_reloadData() throws {
        XCTAssertFalse(mockHomeViewOutput.isInvokeReloadCollectionView)
        XCTAssertEqual(mockHomeViewOutput.invokeReloadCollectionViewCount, 0)
        XCTAssertFalse(mockHomeViewOutput.isInvokeShowCollectionView)
        XCTAssertEqual(mockHomeViewOutput.invokeShowCollectionViewCount, 0)
        mockHomeViewModel.searchItems(text: SearchTextMockData.initalSearchText)
        XCTAssertTrue(mockHomeViewOutput.isInvokeReloadCollectionView)
        XCTAssertEqual(mockHomeViewOutput.invokeReloadCollectionViewCount, 1)
        XCTAssertTrue(mockHomeViewOutput.isInvokeShowCollectionView)
        XCTAssertEqual(mockHomeViewOutput.invokeShowCollectionViewCount, 1)
        mockHomeViewModel.getNextPageItems()
        XCTAssertEqual(mockHomeViewOutput.invokeReloadCollectionViewCount, 2)
        XCTAssertEqual(mockHomeViewOutput.invokeShowCollectionViewCount, 2)
    }
    
    func testPaginationLastPage_whenAPIResponseSuccess_reloadData() throws {
        XCTAssertFalse(mockHomeViewOutput.isInvokeReloadCollectionView)
        XCTAssertEqual(mockHomeViewOutput.invokeReloadCollectionViewCount, 0)
        XCTAssertFalse(mockHomeViewOutput.isInvokeShowCollectionView)
        XCTAssertEqual(mockHomeViewOutput.invokeShowCollectionViewCount, 0)
        mockHomeViewModel.searchItems(text: SearchTextMockData.fightClubSearchText)
        mockHomeViewModel.getNextPageItems()
        mockHomeViewModel.getNextPageItems()
        mockHomeViewModel.getNextPageItems()
        mockHomeViewModel.getNextPageItems()
        mockHomeViewModel.getNextPageItems()
        mockHomeViewModel.getNextPageItems()
        XCTAssertEqual(mockHomeViewOutput.invokeReloadCollectionViewCount, 7)
    }
    
    func testPaginationLastPage2_whenAPIResponseSuccess_reloadData() throws {
        XCTAssertFalse(mockHomeViewOutput.isInvokeReloadCollectionView)
        XCTAssertEqual(mockHomeViewOutput.invokeReloadCollectionViewCount, 0)
        XCTAssertFalse(mockHomeViewOutput.isInvokeShowCollectionView)
        XCTAssertEqual(mockHomeViewOutput.invokeShowCollectionViewCount, 0)
        mockHomeViewModel.searchItems(text: SearchTextMockData.fightClubSearchText)
        mockHomeViewModel.getNextPageItems()
        mockHomeViewModel.getNextPageItems()
        mockHomeViewModel.getNextPageItems()
        mockHomeViewModel.getNextPageItems()
        mockHomeViewModel.getNextPageItems()
        mockHomeViewModel.getNextPageItems()
        mockHomeViewModel.getNextPageItems()
        XCTAssertEqual(mockHomeViewOutput.invokeReloadCollectionViewCount, 7)
    }
    
    func testShowErrorAndSearchMovie_whenAPIResponseSuccess_reloadData() throws {
        XCTAssertEqual(mockHomeViewOutput.errorText, "")
        XCTAssertEqual(mockHomeViewOutput.invokeUpdateErrorTextCount, 0)
        XCTAssertFalse(mockHomeViewOutput.isInvokeHideCollectionView)
        XCTAssertEqual(mockHomeViewOutput.invokeHideCollectionViewCount, 0)
        mockHomeViewModel.searchItems(text: SearchTextMockData.movieNotFoundSearchText)
        XCTAssertEqual(mockHomeViewOutput.errorText, SearchTextMockData.movieNotFoundErrorText)
        XCTAssertEqual(mockHomeViewOutput.invokeUpdateErrorTextCount, 1)
        XCTAssertTrue(mockHomeViewOutput.isInvokeHideCollectionView)
        XCTAssertEqual(mockHomeViewOutput.invokeHideCollectionViewCount, 1)
        mockHomeViewModel.searchItems(text: SearchTextMockData.initalSearchText)
        XCTAssertTrue(mockHomeViewOutput.isInvokeReloadCollectionView)
        XCTAssertEqual(mockHomeViewOutput.invokeReloadCollectionViewCount, 2)
        XCTAssertTrue(mockHomeViewOutput.isInvokeShowCollectionView)
        XCTAssertEqual(mockHomeViewOutput.invokeShowCollectionViewCount, 1)
    }
    
    func testSearchMovieAndShowError_whenAPIResponseSuccess_showError() throws {
        XCTAssertFalse(mockHomeViewOutput.isInvokeReloadCollectionView)
        XCTAssertEqual(mockHomeViewOutput.invokeReloadCollectionViewCount, 0)
        XCTAssertFalse(mockHomeViewOutput.isInvokeShowCollectionView)
        XCTAssertEqual(mockHomeViewOutput.invokeShowCollectionViewCount, 0)
        mockHomeViewModel.searchItems(text: SearchTextMockData.initalSearchText)
        XCTAssertTrue(mockHomeViewOutput.isInvokeReloadCollectionView)
        XCTAssertEqual(mockHomeViewOutput.invokeReloadCollectionViewCount, 1)
        XCTAssertTrue(mockHomeViewOutput.isInvokeShowCollectionView)
        XCTAssertEqual(mockHomeViewOutput.invokeShowCollectionViewCount, 1)
        XCTAssertEqual(mockHomeViewOutput.errorText, "")
        XCTAssertEqual(mockHomeViewOutput.invokeUpdateErrorTextCount, 0)
        XCTAssertFalse(mockHomeViewOutput.isInvokeHideCollectionView)
        XCTAssertEqual(mockHomeViewOutput.invokeHideCollectionViewCount, 0)
        mockHomeViewModel.searchItems(text: SearchTextMockData.movieNotFoundSearchText)
        XCTAssertEqual(mockHomeViewOutput.errorText, SearchTextMockData.movieNotFoundErrorText)
        XCTAssertEqual(mockHomeViewOutput.invokeUpdateErrorTextCount, 1)
        XCTAssertTrue(mockHomeViewOutput.isInvokeHideCollectionView)
        XCTAssertEqual(mockHomeViewOutput.invokeHideCollectionViewCount, 1)
    }
    
    
    
}

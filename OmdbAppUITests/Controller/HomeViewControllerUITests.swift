//
//  OmdbAppUITests.swift
//  OmdbAppUITests
//
//  Created by Ali Çolak on 7.11.2023.
//

import XCTest

final class HomeViewControllerUITests: XCTestCase {
    
    var app: XCUIApplication!
    var collectionView : XCUIElement!
    var searchBar : XCUIElement!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        
        collectionView = app.collectionViews["OmdbApp.HomeView.collectionView"]
        searchBar = app.searchFields["Search"]
    }
    
    override func tearDownWithError() throws {
    }
    
    func testExistsCollectionView() throws {
        
        XCTAssertTrue(collectionView.exists, "Collection View not found.")
    }
    
    func testExistsCell() throws {
        
        let cellTitle = collectionView.cells.element(boundBy: 0).staticTexts[HomeViewControllerMock.firstCellForBatman.title]
        
        let cellYear = collectionView.cells.element(boundBy: 0).staticTexts[HomeViewControllerMock.firstCellForBatman.year]
        
        let cellType = collectionView.cells.element(boundBy: 0).staticTexts[HomeViewControllerMock.firstCellForBatman.type]
        
        
        XCTAssertTrue(cellTitle.exists, "Cell not found.")
        XCTAssertTrue(cellYear.exists, "Cell not found.")
        XCTAssertTrue(cellType.exists, "Cell not found.")
        
    }
    
    func testExistsSearchBar() throws {
        XCTAssert(searchBar.exists, "Search Bar not found.")
    }
    
    // Test to check if the navigation bar and its components (logo and title) exist
    func testExistsNavigationBar() throws {
        
        let navigationBar = app.navigationBars["OmdbApp.HomeView"]
        
        let navigationBarLogoButton = navigationBar.children(matching: .button).element(boundBy: 0)
        let navigationBarTitleButton = navigationBar.buttons[HomeViewControllerMock.appName]
        
        XCTAssertTrue(navigationBarLogoButton.exists && navigationBarTitleButton.exists, "Logo and title buttons not found.")
    }
    
    func testVisibleCollectionViewCellCount() throws {
        
        XCTAssertEqual(collectionView.cells.count, 3, "Collection View Not Contains 3 row")
        
    }
    
    func testSearchBarInput() throws {
        
        searchBar.clearAndEnterText(text: HomeViewControllerMock.testSearchText)
        
        XCTAssertEqual(searchBar.value as? String, HomeViewControllerMock.testSearchText, "Failed to enter text in the search bar.")
        
    }
    
    func testSearchBarInputResult() throws {
        
        searchBar.clearAndEnterText(text: HomeViewControllerMock.testSearchText)
                
        let cellTitle = collectionView.cells.element(boundBy: 0).staticTexts[HomeViewControllerMock.firstCellForFightClub.title].waitForExistence(timeout: 10)
        
        let cellYear = collectionView.cells.element(boundBy: 0).staticTexts[HomeViewControllerMock.firstCellForFightClub.year].waitForExistence(timeout: 10)
        
        let cellType = collectionView.cells.element(boundBy: 0).staticTexts[HomeViewControllerMock.firstCellForFightClub.type].waitForExistence(timeout: 10)
        
        XCTAssertTrue(cellTitle, "Cell not found.")
        XCTAssertTrue(cellYear, "Cell not found.")
        XCTAssertTrue(cellType, "Cell not found.")
        
        
    }
    
    func testMustLeast3CharacterErrorVisible() throws {
        
        searchBar.clearAndEnterText(text: HomeViewControllerMock.testShortSearchText)
        
        let mustBeAtLeast3CharactersStaticText = XCUIApplication().staticTexts[HomeViewControllerMock.characterErrorText].waitForExistence(timeout: 10)
        
        XCTAssertTrue(mustBeAtLeast3CharactersStaticText, HomeViewControllerMock.characterErrorText)
    }
    
    func testMovieNotFoundErrorVisible() throws {
        
        let searchText = HomeViewControllerMock.movieNotFoundSearchText
        
        searchBar.clearAndEnterText(text: searchText)
        
        
        let movieNotFoundStaticText = XCUIApplication().staticTexts[HomeViewControllerMock.movieNotFoundErrorText].waitForExistence(timeout: 10)
        
        
        XCTAssertTrue(movieNotFoundStaticText, HomeViewControllerMock.movieNotFoundErrorText)
        
        
    }
    
    func testSroll() throws {
        
        collectionView.swipeUp(count: 1)
        
        let cell = collectionView.cells.otherElements.containing(.staticText, identifier: HomeViewControllerMock.scrollTestForBatman.title).element // Element is scroll element
        
        let firstCell = collectionView.cells.otherElements.containing(.staticText, identifier: HomeViewControllerMock.firstCellForBatman.title).element
        
        XCTAssertTrue(cell.exists, "Scrool not work.")
        XCTAssertFalse(firstCell.exists, "Scrool not work.")
        
        
    }
    
    func testPaginationWithScrollInfinite() throws {
        
        collectionView.swipeUp(count: 5)
        
        let cellTitle = collectionView.cells.otherElements.containing(.staticText, identifier: HomeViewControllerMock.paginationTestForBatman.title).element // Element is have in second page
        
        let cellYear = collectionView.cells.otherElements.containing(.staticText, identifier: HomeViewControllerMock.paginationTestForBatman.year).element// Element is have in second page
        
        let cellType = collectionView.cells.otherElements.containing(.staticText, identifier: HomeViewControllerMock.paginationTestForBatman.type).element // Element is have in second page
        
        XCTAssertTrue(cellTitle.exists, "Cell not found.")
        XCTAssertTrue(cellYear.exists, "Cell not found.")
        XCTAssertTrue(cellType.exists, "Cell not found.")
        
        
    }
    
    func testScrollLastPage() throws {
        
        let searchText = HomeViewControllerMock.testSearchText
        
        searchBar.clearAndEnterText(text: searchText)
        
        
        collectionView.cells.otherElements.containing(.staticText, identifier: HomeViewControllerMock.firstCellForFightClub.title).element.swipeUp()
        
        
        collectionView.swipeUp(count: 22) // Go to last element with scroll
        
        let cellTitle = collectionView.cells.otherElements.containing(.staticText, identifier: HomeViewControllerMock.lastCellPaginationFightClub.title).element // Last Page Last Element
        
        let cellYear = collectionView.cells.otherElements.containing(.staticText, identifier: HomeViewControllerMock.lastCellPaginationFightClub.year).element // Last Page Last Element
        
        let cellType = collectionView.cells.otherElements.containing(.staticText, identifier: HomeViewControllerMock.lastCellPaginationFightClub.type).element // Last Page Last Element
        
        XCTAssertTrue(cellTitle.exists, "Cell not found.")
        XCTAssertTrue(cellYear.exists, "Cell not found.")
        XCTAssertTrue(cellType.exists, "Cell not found.")
        
        
    }
    
    func testPassDetailVC() throws {
        
        let cell = collectionView.cells.element(boundBy: 0).staticTexts[HomeViewControllerMock.firstCellForBatman.title]
        
        cell.tap()
        
        let titleText = app.staticTexts["OmdbApp.DetailView.itemNameLabel"]
        
        XCTAssertTrue(titleText.exists, "Fail Page Pass to Detail VC.")
        
        
    }
    
    
}

extension XCUIElement {
    /**
     Removes any current text in the field before typing in the new value
     - Parameter text: the text to enter into the field
     */
    func clearAndEnterText(text: String) {
        guard let stringValue = self.value as? String else {
            XCTFail("Tried to clear and enter text into a non string value")
            return
        }
        
        self.tap()
        
        let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: stringValue.count)
        
        self.typeText(deleteString)
        self.typeText(text)
        
    }
    func swipeUp(count: Int) {
        for _ in 0..<count {
            swipeUp()
        }
    }
}

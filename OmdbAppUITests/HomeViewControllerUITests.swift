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
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExistsCollectionView() throws {
                
        XCTAssertTrue(collectionView.exists, "Collection View not found.")
    }
    
    func testExistsCell() throws {
        
        let firstCell = collectionView.cells.otherElements.containing(.staticText, identifier: "Batman Begins").element
        
        XCTAssertTrue(firstCell.exists, "Cell not found.")
    }
    
    func testExistsSearchBar() throws {
        XCTAssert(searchBar.exists, "Search Bar not found.")
    }
    
    // Test to check if the navigation bar and its components (logo and title) exist
    func testExistsNavigationBar() throws {
        
        let navigationBar = app.navigationBars["OmdbApp.HomeView"]
        
        let navigationBarLogoButton = navigationBar.children(matching: .button).element(boundBy: 0)
        let navigationBarTitleButton = navigationBar.buttons["Omdb App"]
        
        XCTAssertTrue(navigationBarLogoButton.exists && navigationBarTitleButton.exists, "Logo and title buttons not found.")
    }
    
    func testVisibleCollectionViewCellCount() throws {
        
        XCTAssertEqual(collectionView.cells.count, 3, "Collection View Not Contains 3 row")
        
    }
    
    func testSearchBarInput() throws {
        
        let searchText = "Fight Club"
        
        searchBar.tap()
        searchBar.clearAndEnterText(text: searchText)
        
        XCTAssertEqual(searchBar.value as? String, searchText, "Failed to enter text in the search bar.")
        
    }
    
    func testSearchBarInputResult() throws {
        
        let searchText = "Fight Club"
        
        searchBar.tap()
        searchBar.clearAndEnterText(text: searchText)
        
        let collectionView = app.collectionViews
        
        let firstCell = collectionView.cells.otherElements.containing(.staticText, identifier: "Fight Club").element
        
        XCTAssertTrue(firstCell.exists, "Cell not found.")
        
    }
    
    func testMustLeast3CharacterErrorVisible() throws {
        
        let searchText = "Ba"
        
        searchBar.tap()
        searchBar.clearAndEnterText(text: searchText)
        
        let mustBeAtLeast3CharactersStaticText = XCUIApplication().staticTexts["Must Be At Least 3 Characters"]
        
        XCTAssertTrue(mustBeAtLeast3CharactersStaticText.exists, "Must Be At Least 3 Characters Text not found.")
    }
    
    func testMovieNotFoundErrorVisible() throws {

        let searchText = "Batmanman"
        
        searchBar.tap()
        searchBar.clearAndEnterText(text: searchText)
        
        let movieNotFoundStaticText = XCUIApplication().staticTexts["Movie Not Found"]
        
        XCTAssertTrue(movieNotFoundStaticText.exists, "Movie Not Found Text not found.")
        
        
    }
    
    func testSroll() throws {
        
        collectionView.swipeUp()
        
        let cell = collectionView.cells.otherElements.containing(.staticText, identifier: "Batman & Robin").element // Element is scroll element
        
        let firstCell = collectionView.cells.otherElements.containing(.staticText, identifier: "Batman Begins").element
        
        XCTAssertTrue(cell.exists, "Scrool not work.")
        XCTAssertFalse(firstCell.exists, "Scrool not work.")
        
        
    }
    
    func testPaginationWithScrollInfinite() throws {
        
        collectionView.swipeUp()
        collectionView.swipeUp()
        collectionView.swipeUp()
        collectionView.swipeUp()
        collectionView.swipeUp()
        
        let cell = collectionView.cells.otherElements.containing(.staticText, identifier: "Batman: The Movie").element // Element is have in second page
        
        
        XCTAssertTrue(cell.exists, "Pagination not work.")
        
    }
    
    func testScrollLastPage() throws {
        
        let searchText = "Fight Club"
        
        searchBar.tap()
        searchBar.clearAndEnterText(text: searchText)
        
            
        collectionView.cells.otherElements.containing(.staticText, identifier: "Fight Club").element.swipeUp()
        
        
        collectionView.swipeUp()
        collectionView.swipeUp()
        collectionView.swipeUp()
        collectionView.swipeUp()
        collectionView.swipeUp()
        collectionView.swipeUp()
        collectionView.swipeUp()
        collectionView.swipeUp()
        collectionView.swipeUp()
        collectionView.swipeUp()
        collectionView.swipeUp()
        collectionView.swipeUp()
        collectionView.swipeUp()
        collectionView.swipeUp()
        collectionView.swipeUp()
        collectionView.swipeUp()
        collectionView.swipeUp()
        collectionView.swipeUp()
        collectionView.swipeUp()
        collectionView.swipeUp()
        collectionView.swipeUp()
        
        let lastCell =         collectionView.cells.otherElements.containing(.staticText, identifier: "Dance Fight Club").element // Last Page Last Element
        
        
        XCTAssertTrue(lastCell.exists, "Pagination not work.")
        
    }
    
    func testPassDetailVC() throws {
        
        let firstCell = collectionView.cells.otherElements.containing(.staticText, identifier: "Batman Begins").element
        
        firstCell.tap()
        
        
        let titleText = app.scrollViews.otherElements.staticTexts["Batman Begins"]
        
        
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
}

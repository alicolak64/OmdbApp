//
//  OmdbAppUITests.swift
//  OmdbAppUITests
//
//  Created by Ali Çolak on 7.11.2023.
//

import XCTest

final class DetailViewControllerUITests: XCTestCase {
    
    var app: XCUIApplication!
    var collectionView: XCUIElement!
    var image : XCUIElement!
    var title : XCUIElement!
    var backItemButton : XCUIElement!
    var nextItemButton : XCUIElement!
    var genreCollectionView: XCUIElement!
    var ratingCollectionView: XCUIElement!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        
        collectionView = app.collectionViews["OmdbApp.HomeView.collectionView"]
        
        let cell = collectionView.cells.otherElements.containing(.staticText, identifier: DetailViewControllerMock.initalCell.titleText).element
        
        cell.tap()
        
        image = app.images["OmdbApp.DetailView.itemImage"]
        title = app.staticTexts["OmdbApp.DetailView.itemNameLabel"]
        backItemButton = app.buttons["OmdbApp.DetailView.backItemButton"]
        nextItemButton = app.buttons["OmdbApp.DetailView.nextItemButton"]
        genreCollectionView = app.collectionViews["OmdbApp.DetailView.genreCollectionView"]
        ratingCollectionView = app.collectionViews["OmdbApp.DetailView.ratingCollectionView"]
        
        
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExistsImage() throws {
        
        XCTAssertTrue(image.waitForExistence(timeout: 10), "Image not found.")
        
    }
    
    func testExistsTitle() throws {
        
        XCTAssertTrue(title.waitForExistence(timeout: 10), "Title not found.")
        XCTAssertEqual(title.label, DetailViewControllerMock.initalCell.titleText, "Title is not equal to " + DetailViewControllerMock.initalCell.titleText)
        
    }
    
    func testExistsImdbRating() throws {
        
        let imdbRating = app.staticTexts["OmdbApp.DetailView.imdbRatingLabel"]
        let imdbRatingIcon = app.images["OmdbApp.DetailView.imdbRatingIcon"]
        
        XCTAssertTrue(imdbRating.waitForExistence(timeout: 10), "Imdb Rating not found.")
        XCTAssertTrue(imdbRatingIcon.waitForExistence(timeout: 10), "Imdb Rating Icon not found.")
        XCTAssertEqual(imdbRating.label, DetailViewControllerMock.initalCell.imdbText, "Imdb Rating is not equal to " + DetailViewControllerMock.initalCell.imdbText)
        
    }
    
    func testExistsType() throws {
        
        let typeView = app.otherElements["OmdbApp.DetailView.itemTypeContainerView"]
        let typeLabel = app.staticTexts["OmdbApp.DetailView.itemTypeLabel"]
        
        XCTAssertTrue(typeView.waitForExistence(timeout: 10), "Type View not found.")
        XCTAssertTrue(typeLabel.waitForExistence(timeout: 10), "Type Label not found.")
        
        XCTAssertEqual(typeLabel.label, DetailViewControllerMock.initalCell.typeText, "Type Label is not equal to " + DetailViewControllerMock.initalCell.typeText)
        
    }
    
    func testExistsLength() throws {
        
        let lengthTitle = app.staticTexts["OmdbApp.DetailView.lengthTitleLabel"]
        let lengthLabel = app.staticTexts["OmdbApp.DetailView.lengthValueLabel"]
        
        XCTAssertTrue(lengthTitle.waitForExistence(timeout: 10), "Length Title not found.")
        XCTAssertTrue(lengthLabel.waitForExistence(timeout: 10), "Length Label not found.")
        
        XCTAssertEqual(lengthTitle.label, DetailViewControllerMock.initalCell.lengthTitleText, "Length Title is not equal to " + DetailViewControllerMock.initalCell.lengthTitleText)
        XCTAssertEqual(lengthLabel.label, DetailViewControllerMock.initalCell.lenghtValueText, "Length Label is not equal to " + DetailViewControllerMock.initalCell.lenghtValueText)
        
    }
    
    func testExistingLanguage() throws {
        
        let languageTitle = app.staticTexts["OmdbApp.DetailView.languageTitleLabel"]
        let languageLabel = app.staticTexts["OmdbApp.DetailView.languageValueLabel"]
        
        XCTAssertTrue(languageTitle.waitForExistence(timeout: 10), "Language Title not found.")
        XCTAssertTrue(languageLabel.waitForExistence(timeout: 10), "Language Label not found.")
        
        XCTAssertEqual(languageTitle.label, DetailViewControllerMock.initalCell.languageTitleText, "Language Title is not equal to " + DetailViewControllerMock.initalCell.languageTitleText)
        XCTAssertEqual(languageLabel.label, (DetailViewControllerMock.initalCell.languageValueText), "Language Label is not equal to " + DetailViewControllerMock.initalCell.languageValueText)
        
    }
    
    func testExistingRating() throws {
        
        let ratingTitle = app.staticTexts["OmdbApp.DetailView.ratingTitleLabel"]
        let ratingLabel = app.staticTexts["OmdbApp.DetailView.ratingValueLabel"]
        
        XCTAssertTrue(ratingTitle.waitForExistence(timeout: 10), "Rating Title not found.")
        XCTAssertTrue(ratingLabel.waitForExistence(timeout: 10), "Rating Label not found.")
        
        XCTAssertEqual(ratingTitle.label, DetailViewControllerMock.initalCell.ratingTitleText, "Rating Title is not equal to " + DetailViewControllerMock.initalCell.ratingTitleText)
        XCTAssertEqual(ratingLabel.label, DetailViewControllerMock.initalCell.ratingValueText, "Rating Label is not equal to " + DetailViewControllerMock.initalCell.ratingValueText)
    }
    
    func testExistingReleased() throws {
        
        let releasedTitle = app.staticTexts["OmdbApp.DetailView.releasedTitleLabel"]
        let releasedLabel = app.staticTexts["OmdbApp.DetailView.releasedValueLabel"]
        
        XCTAssertTrue(releasedTitle.waitForExistence(timeout: 10), "Released Title not found.")
        XCTAssertTrue(releasedLabel.waitForExistence(timeout: 10), "Released Label not found.")
        
        XCTAssertEqual(releasedTitle.label, DetailViewControllerMock.initalCell.releasedTitleText, "Released Title is not equal to " + DetailViewControllerMock.initalCell.releasedTitleText)
        XCTAssertEqual(releasedLabel.label, DetailViewControllerMock.initalCell.releasedValueText, "Released Label is not equal to " + DetailViewControllerMock.initalCell.releasedValueText)
    }
    
    func testExistingDescription() throws {
        
        let descriptionTitle = app.staticTexts["OmdbApp.DetailView.descriptionTitleLabel"]
        let descriptionLabel = app.staticTexts["OmdbApp.DetailView.descriptionValueLabel"]
        
        XCTAssertTrue(descriptionTitle.waitForExistence(timeout: 10), "Description Title not found.")
        XCTAssertTrue(descriptionLabel.waitForExistence(timeout: 10), "Description Label not found.")
        
        XCTAssertEqual(descriptionTitle.label, DetailViewControllerMock.initalCell.descriptionTitleText, "Description Title is not equal to " + DetailViewControllerMock.initalCell.descriptionTitleText)
        XCTAssertEqual(descriptionLabel.label, DetailViewControllerMock.initalCell.descriptionValueText, "Description Label is not equal to " + DetailViewControllerMock.initalCell.descriptionValueText)
    }
    
    func testExistingCountry() throws {
        
        let countryTitle = app.staticTexts["OmdbApp.DetailView.countryTitleLabel"]
        let countryLabel = app.staticTexts["OmdbApp.DetailView.countryValueLabel"]
        
        XCTAssertTrue(countryTitle.waitForExistence(timeout: 10), "Country Title not found.")
        XCTAssertTrue(countryLabel.waitForExistence(timeout: 10), "Country Label not found.")
        
        XCTAssertEqual(countryTitle.label, DetailViewControllerMock.initalCell.countryTitleText, "Country Title is not equal to " + DetailViewControllerMock.initalCell.countryTitleText)
        XCTAssertEqual(countryLabel.label, DetailViewControllerMock.initalCell.countryValueText, "Country Label is not equal to " + DetailViewControllerMock.initalCell.countryValueText)
    }
    
    func testExistingDirector() throws {
        
        let directorTitle = app.staticTexts["OmdbApp.DetailView.directorTitleLabel"]
        let directorLabel = app.staticTexts["OmdbApp.DetailView.directorValueLabel"]
        
        XCTAssertTrue(directorTitle.waitForExistence(timeout: 10), "Director Title not found.")
        XCTAssertTrue(directorLabel.waitForExistence(timeout: 10), "Director Label not found.")
        
        XCTAssertEqual(directorTitle.label, DetailViewControllerMock.initalCell.directorTitleText, "Director Title is not equal to " + DetailViewControllerMock.initalCell.directorTitleText)
        XCTAssertEqual(directorLabel.label, DetailViewControllerMock.initalCell.directorValueText, "Director Label is not equal to " + DetailViewControllerMock.initalCell.directorValueText)
    }
    
    func testExistingWriter() throws {
        
        let writerTitle = app.staticTexts["OmdbApp.DetailView.writerTitleLabel"]
        let writerLabel = app.staticTexts["OmdbApp.DetailView.writerValueLabel"]
        
        XCTAssertTrue(writerTitle.waitForExistence(timeout: 10), "Writer Title not found.")
        XCTAssertTrue(writerLabel.waitForExistence(timeout: 10), "Writer Label not found.")
        
        XCTAssertEqual(writerTitle.label, DetailViewControllerMock.initalCell.writerTitleText, "Writer Title is not equal to " + DetailViewControllerMock.initalCell.writerTitleText)
        XCTAssertEqual(writerLabel.label, DetailViewControllerMock.initalCell.writerValueText, "Writer Label is not equal to " + DetailViewControllerMock.initalCell.writerValueText)
    }
    
    func testExistingActors() throws {
        
        let actorsTitle = app.staticTexts["OmdbApp.DetailView.actorTitleLabel"]
        let actorsLabel = app.staticTexts["OmdbApp.DetailView.actorValueLabel"]
        
        XCTAssertTrue(actorsTitle.waitForExistence(timeout: 10), "Actors Title not found.")
        XCTAssertTrue(actorsLabel.waitForExistence(timeout: 10), "Actors Label not found.")
        
        XCTAssertEqual(actorsTitle.label, DetailViewControllerMock.initalCell.actorsTitleText, "Actors Title is not equal to " + DetailViewControllerMock.initalCell.actorsTitleText)
        XCTAssertEqual(actorsLabel.label, DetailViewControllerMock.initalCell.actorsValueText, "Actors Label is not equal to " + DetailViewControllerMock.initalCell.actorsValueText)
    }
    
    func testExistingAward() throws {
        
        let awardTitle = app.staticTexts["OmdbApp.DetailView.awardTitleLabel"]
        let awardLabel = app.staticTexts["OmdbApp.DetailView.awardValueLabel"]
        
        XCTAssertTrue(awardTitle.waitForExistence(timeout: 10), "Award Title not found.")
        XCTAssertTrue(awardLabel.waitForExistence(timeout: 10), "Award Label not found.")
        
        XCTAssertEqual(awardTitle.label, DetailViewControllerMock.initalCell.awardsTitleText, "Award Title is not equal to " + DetailViewControllerMock.initalCell.awardsTitleText)
        XCTAssertEqual(awardLabel.label, DetailViewControllerMock.initalCell.awardsValueText, "Award Label is not equal to " + DetailViewControllerMock.initalCell.awardsValueText)
    }
    
    func testExistingIMDBVotes() throws {
        
        let imdbVotesTitle = app.staticTexts["OmdbApp.DetailView.imdbVotesTitleLabel"]
        let imdbVotesLabel = app.staticTexts["OmdbApp.DetailView.imdbVotesValueLabel"]
        
        XCTAssertTrue(imdbVotesTitle.waitForExistence(timeout: 10), "IMDB Votes Title not found.")
        XCTAssertTrue(imdbVotesLabel.waitForExistence(timeout: 10), "IMDB Votes Label not found.")
        
        XCTAssertEqual(imdbVotesTitle.label, DetailViewControllerMock.initalCell.imdbVotesTitleText, "IMDB Votes Title is not equal to " + DetailViewControllerMock.initalCell.imdbVotesTitleText)
        XCTAssertEqual(imdbVotesLabel.label, DetailViewControllerMock.initalCell.imdbVotesValueText, "IMDB Votes Label is not equal to " + DetailViewControllerMock.initalCell.imdbVotesValueText)
    }
    
    func testExistingBoxOffices() throws {
        
        let boxOfficesTitle = app.staticTexts["OmdbApp.DetailView.boxOfficesTitleLabel"]
        let boxOfficesLabel = app.staticTexts["OmdbApp.DetailView.boxOfficesValueLabel"]
        
        XCTAssertTrue(boxOfficesTitle.waitForExistence(timeout: 10), "Box Offices Title not found.")
        XCTAssertTrue(boxOfficesLabel.waitForExistence(timeout: 10), "Box Offices Label not found.")
        
        XCTAssertEqual(boxOfficesTitle.label, DetailViewControllerMock.initalCell.boxOfficeTitleText, "Box Offices Title is not equal to " + DetailViewControllerMock.initalCell.boxOfficeTitleText)
        XCTAssertEqual(boxOfficesLabel.label, DetailViewControllerMock.initalCell.boxOfficeValueText, "Box Offices Label is not equal to " + DetailViewControllerMock.initalCell.boxOfficeValueText)
    }
    
    func testExistsGenreCollectionView() throws {
        
        XCTAssertTrue(genreCollectionView.waitForExistence(timeout: 10), "Genre Collection View not found.")
        XCTAssertEqual(genreCollectionView.cells.count, 3, "Genre Collection View Not Contains 3 row")
        
        let cell1 = genreCollectionView.cells.element(boundBy: 0).staticTexts[DetailViewControllerMock.initalCell.genres[0]]
        let cell2 = genreCollectionView.cells.element(boundBy: 1).staticTexts[DetailViewControllerMock.initalCell.genres[1]]
        let cell3 = genreCollectionView.cells.element(boundBy: 2).staticTexts[DetailViewControllerMock.initalCell.genres[2]]
        
        XCTAssertTrue(cell1.exists, DetailViewControllerMock.initalCell.genres[0] + "Cell not found.")
        XCTAssertTrue(cell2.exists, DetailViewControllerMock.initalCell.genres[1] + "Cell not found.")
        XCTAssertTrue(cell3.exists, DetailViewControllerMock.initalCell.genres[2] + "Cell not found.")
        
        
    }
    
    func testExistsRatingCollectionView() throws {
        
        
        XCTAssertTrue(ratingCollectionView.waitForExistence(timeout: 10), "Rating Collection View not found.")
        XCTAssertEqual(ratingCollectionView.cells.count, 3, "Rating Collection View Not Contains 3 row")
        
        let cell1Source = ratingCollectionView.cells.element(boundBy: 0).staticTexts[DetailViewControllerMock.initalCell.ratings[0].source]
        let cell1Value = ratingCollectionView.cells.element(boundBy: 0).staticTexts[DetailViewControllerMock.initalCell.ratings[0].value]
        let cell2Source = ratingCollectionView.cells.element(boundBy: 1).staticTexts[DetailViewControllerMock.initalCell.ratings[1].source]
        let cell2Value = ratingCollectionView.cells.element(boundBy: 1).staticTexts[DetailViewControllerMock.initalCell.ratings[1].value]
        let cell3Source = ratingCollectionView.cells.element(boundBy: 2).staticTexts[DetailViewControllerMock.initalCell.ratings[2].source]
        let cell3Value = ratingCollectionView.cells.element(boundBy: 2).staticTexts[DetailViewControllerMock.initalCell.ratings[2].value]
        
        
        XCTAssertTrue(cell1Source.exists, DetailViewControllerMock.initalCell.ratings[0].source + " Source not found.")
        XCTAssertTrue(cell1Value.exists, DetailViewControllerMock.initalCell.ratings[0].value + " Value not found.")
        XCTAssertTrue(cell2Source.exists, DetailViewControllerMock.initalCell.ratings[1].source + " Source not found.")
        XCTAssertTrue(cell2Value.exists, DetailViewControllerMock.initalCell.ratings[1].value + " Value not found.")
        XCTAssertTrue(cell3Source.exists, DetailViewControllerMock.initalCell.ratings[2].source + " Source not found.")
        XCTAssertTrue(cell3Value.exists, DetailViewControllerMock.initalCell.ratings[2].value + " Value not found.")
        
    }
    
    func testExistingBackPageButton() throws {
        
        let navigationBar = app.navigationBars.firstMatch
        let backButton = navigationBar.buttons["backButton"]
        
        XCTAssertTrue(backButton.exists, "Back button not found.")
        
        backButton.tap()
        
        XCTAssertTrue(collectionView.exists, "Collection View not found.")
        
        
    }
    
    func testExistingBackItemButon1() throws {
        
        
        XCTAssertTrue(backItemButton.exists, "Back Item Button not found.")
        
        backItemButton.tap()
        
        XCTAssertTrue(title.waitForExistence(timeout: 10), "Title Text not found.")
        
        XCTAssertEqual(title.label, DetailViewControllerMock.previousCellTile, "Title Text is not equal to " + DetailViewControllerMock.previousCellTile)
        
        XCTAssertTrue(backItemButton.isEnabled)
        XCTAssertTrue(nextItemButton.isEnabled)
        
        
    }
    
    func testExistingBackItemButon2() throws {
        
        
        XCTAssertTrue(backItemButton.exists, "Back Item Button not found.")
        
        backItemButton.tap()
        nextItemButton.tap()
        backItemButton.tap()
        
        XCTAssertTrue(title.waitForExistence(timeout: 10), "Title Text not found.")
        
        XCTAssertEqual(title.label, DetailViewControllerMock.previousCellTile, "Title Text is not equal to " + DetailViewControllerMock.previousCellTile)

        XCTAssertTrue(backItemButton.isEnabled)
        XCTAssertTrue(nextItemButton.isEnabled)
        
    }
    
    func testExistingBackItemButtonIsEnabled() throws {
        
        
        XCTAssertTrue(backItemButton.exists, "Back Item Button not found.")
        
        backItemButton.tap()
        backItemButton.tap()
        
        XCTAssertTrue(title.exists, "Title Text not found.")
        
        XCTAssertEqual(title.label, DetailViewControllerMock.firstItemTitleForFirstPage, "Title Text is not equal to " + DetailViewControllerMock.firstItemTitleForFirstPage)
        
        XCTAssertFalse(backItemButton.isAccessibilityElement)
        XCTAssertTrue(nextItemButton.isEnabled)
        
    }
    
    func testExistingNextItemButon1() throws {
        
        
        XCTAssertTrue(nextItemButton.exists, "Back Item Button not found.")
        
        nextItemButton.tap()
        
        XCTAssertTrue(title.exists, "Title Text not found.")
        
        XCTAssertEqual(title.label, DetailViewControllerMock.nextCellTile, "Title Text is not equal to " + DetailViewControllerMock.nextCellTile)
        
        XCTAssertTrue(backItemButton.isEnabled)
        XCTAssertTrue(nextItemButton.isEnabled)
        
    }
    
    func testExistingNextItemButon2() throws {
        
        
        XCTAssertTrue(nextItemButton.exists, "Back Item Button not found.")
        
        nextItemButton.tap()
        nextItemButton.tap()
        
        XCTAssertTrue(title.exists, "Title Text not found.")
        
        XCTAssertEqual(title.label, DetailViewControllerMock.nextAndNextCellTitle, "Title Text is not equal to " + DetailViewControllerMock.nextAndNextCellTitle)
        
        XCTAssertTrue(backItemButton.isEnabled)
        XCTAssertTrue(nextItemButton.isEnabled)
        
    }
    
    
    func testExistingNextItemButtonIsEnabled() throws {
        
        
        XCTAssertTrue(backItemButton.exists, "Back Item Button not found.")
        
        nextItemButton.tap()
        nextItemButton.tap()
        nextItemButton.tap()
        nextItemButton.tap()
        nextItemButton.tap()
        nextItemButton.tap()
        nextItemButton.tap()
        
        XCTAssertTrue(title.exists, "Title Text not found.")
        
        XCTAssertEqual(title.label, DetailViewControllerMock.lastItemTitleForFirstPage, "Title Text is not equal to " + DetailViewControllerMock.lastItemTitleForFirstPage)
        
        
        XCTAssertTrue(backItemButton.isEnabled)
        XCTAssertFalse(nextItemButton.isAccessibilityElement)
        
    }
    
    
    
    
    
    
    
}

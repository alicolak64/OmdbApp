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
        
        let secondCell = collectionView.cells.otherElements.containing(.staticText, identifier: "The Batman").element
        
        secondCell.tap()
        
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
        
        XCTAssertTrue(image.exists, "Image not found.")
        
    }
    
    func testExistsTitle() throws {
        
        XCTAssertTrue(title.exists, "Title not found.")
        XCTAssertEqual(title.label, "The Batman", "Title is not equal to The Batman")
        
    }
    
    func testExistsImdbRating() throws {
        
        let imdbRating = app.staticTexts["OmdbApp.DetailView.imdbRatingLabel"]
        let imdbRatingIcon = app.images["OmdbApp.DetailView.imdbRatingIcon"]
        
        XCTAssertTrue(imdbRating.exists, "Imdb Rating not found.")
        XCTAssertTrue(imdbRatingIcon.exists, "Imdb Rating Icon not found.")
        XCTAssertEqual(imdbRating.label, "7.8/10 IMDb", "Imdb Rating is not equal to 7.8")
        
    }
    
    func testExistsType() throws {
        
        let typeView = app.otherElements["OmdbApp.DetailView.itemTypeContainerView"]
        let typeLabel = app.staticTexts["OmdbApp.DetailView.itemTypeLabel"]
        
        XCTAssertTrue(typeView.exists, "Type View not found.")
        XCTAssertTrue(typeLabel.exists, "Type Label not found.")
        
        XCTAssertEqual(typeLabel.label, "Movie", "Type Label is not equal to Movie")
        
    }
    
    func testExistsLength() throws {
        
        let lengthTitle = app.staticTexts["OmdbApp.DetailView.lengthTitleLabel"]
        let lengthLabel = app.staticTexts["OmdbApp.DetailView.lengthValueLabel"]
        
        XCTAssertTrue(lengthTitle.exists, "Length Title not found.")
        XCTAssertTrue(lengthLabel.exists, "Length Label not found.")
        
        XCTAssertEqual(lengthTitle.label, "Length", "Length Title is not equal to Length")
        XCTAssertEqual(lengthLabel.label, "176 min", "Length Label is not equal to 176 min")
        
    }
    
    func testExistingLanguage() throws {
        
        let languageTitle = app.staticTexts["OmdbApp.DetailView.languageTitleLabel"]
        let languageLabel = app.staticTexts["OmdbApp.DetailView.languageValueLabel"]
        
        XCTAssertTrue(languageTitle.exists, "Language Title not found.")
        XCTAssertTrue(languageLabel.exists, "Language Label not found.")
        
        XCTAssertEqual(languageTitle.label, "Language", "Language Title is not equal to Language")
        XCTAssertEqual(languageLabel.label, ("English\nSpanish\nLatin\nItalian"), "Language Label is not equal to English")
        
    }
    
    func testExistingRating() throws {
        
        let ratingTitle = app.staticTexts["OmdbApp.DetailView.ratingTitleLabel"]
        let ratingLabel = app.staticTexts["OmdbApp.DetailView.ratingValueLabel"]
        
        XCTAssertTrue(ratingTitle.exists, "Rating Title not found.")
        XCTAssertTrue(ratingLabel.exists, "Rating Label not found.")
        
        XCTAssertEqual(ratingTitle.label, "Rating", "Rating Title is not equal to Rating")
        XCTAssertEqual(ratingLabel.label, "PG-13", "Rating Label is not equal to PG-13")
    }
    
    func testExistingReleased() throws {
        
        let releasedTitle = app.staticTexts["OmdbApp.DetailView.releasedTitleLabel"]
        let releasedLabel = app.staticTexts["OmdbApp.DetailView.releasedValueLabel"]
        
        XCTAssertTrue(releasedTitle.exists, "Released Title not found.")
        XCTAssertTrue(releasedLabel.exists, "Released Label not found.")
        
        XCTAssertEqual(releasedTitle.label, "Released", "Released Title is not equal to Released")
        XCTAssertEqual(releasedLabel.label, "04 Mar 2022", "Released Label is not equal to 04 Mar 2022")
    }
    
    func testExistingDescription() throws {
        
        let descriptionTitle = app.staticTexts["OmdbApp.DetailView.descriptionTitleLabel"]
        let descriptionLabel = app.staticTexts["OmdbApp.DetailView.descriptionValueLabel"]
        
        XCTAssertTrue(descriptionTitle.exists, "Description Title not found.")
        XCTAssertTrue(descriptionLabel.exists, "Description Label not found.")
        
        XCTAssertEqual(descriptionTitle.label, "Description", "Description Title is not equal to Description")
        XCTAssertEqual(descriptionLabel.label, "When a sadistic serial killer begins murdering key political figures in Gotham, Batman is forced to investigate the city's hidden corruption and question his family's involvement.", "Description Label is not equal to The plot is unknown.")
    }
    
    func testExistingCountry() throws {
        
        let countryTitle = app.staticTexts["OmdbApp.DetailView.countryTitleLabel"]
        let countryLabel = app.staticTexts["OmdbApp.DetailView.countryValueLabel"]
        
        XCTAssertTrue(countryTitle.exists, "Country Title not found.")
        XCTAssertTrue(countryLabel.exists, "Country Label not found.")
        
        XCTAssertEqual(countryTitle.label, "Country:", "Country Title is not equal to Country")
        XCTAssertEqual(countryLabel.label, "United States", "Country Label is not equal to United States")
    }
    
    func testExistingDirector() throws {
        
        let directorTitle = app.staticTexts["OmdbApp.DetailView.directorTitleLabel"]
        let directorLabel = app.staticTexts["OmdbApp.DetailView.directorValueLabel"]
        
        XCTAssertTrue(directorTitle.exists, "Director Title not found.")
        XCTAssertTrue(directorLabel.exists, "Director Label not found.")
        
        XCTAssertEqual(directorTitle.label, "Director:", "Director Title is not equal to Director")
        XCTAssertEqual(directorLabel.label, "Matt Reeves", "Director Label is not equal to Matt Reeves")
    }
    
    func testExistingWriter() throws {
        
        let writerTitle = app.staticTexts["OmdbApp.DetailView.writerTitleLabel"]
        let writerLabel = app.staticTexts["OmdbApp.DetailView.writerValueLabel"]
        
        XCTAssertTrue(writerTitle.exists, "Writer Title not found.")
        XCTAssertTrue(writerLabel.exists, "Writer Label not found.")
        
        XCTAssertEqual(writerTitle.label, "Writer:", "Writer Title is not equal to Writer")
        XCTAssertEqual(writerLabel.label, "Matt Reeves, Peter Craig, Bob Kane", "Writer Label is not equal to Bill Finger")
    }
    
    func testExistingActors() throws {
        
        let actorsTitle = app.staticTexts["OmdbApp.DetailView.actorTitleLabel"]
        let actorsLabel = app.staticTexts["OmdbApp.DetailView.actorValueLabel"]
        
        XCTAssertTrue(actorsTitle.exists, "Actors Title not found.")
        XCTAssertTrue(actorsLabel.exists, "Actors Label not found.")
        
        XCTAssertEqual(actorsTitle.label, "Actor:", "Actors Title is not equal to Actors")
        XCTAssertEqual(actorsLabel.label, "Robert Pattinson, Zoë Kravitz, Jeffrey Wright", "Actors Label is not equal to Robert Pattinson")
    }
    
    func testExistingAward() throws {
        
        let awardTitle = app.staticTexts["OmdbApp.DetailView.awardTitleLabel"]
        let awardLabel = app.staticTexts["OmdbApp.DetailView.awardValueLabel"]
        
        XCTAssertTrue(awardTitle.exists, "Award Title not found.")
        XCTAssertTrue(awardLabel.exists, "Award Label not found.")
        
        XCTAssertEqual(awardTitle.label, "Award:", "Award Title is not equal to Award")
        XCTAssertEqual(awardLabel.label, "Nominated for 3 Oscars. 33 wins & 163 nominations total", "Award Label is not equal to N/A")
    }
    
    func testExistingIMDBVotes() throws {
        
        let imdbVotesTitle = app.staticTexts["OmdbApp.DetailView.imdbVotesTitleLabel"]
        let imdbVotesLabel = app.staticTexts["OmdbApp.DetailView.imdbVotesValueLabel"]
        
        XCTAssertTrue(imdbVotesTitle.exists, "IMDB Votes Title not found.")
        XCTAssertTrue(imdbVotesLabel.exists, "IMDB Votes Label not found.")
        
        XCTAssertEqual(imdbVotesTitle.label, "IMDb Votes:", "IMDB Votes Title is not equal to IMDB Votes")
        XCTAssertEqual(imdbVotesLabel.label, "738,929", "IMDB Votes Label is not equal to N/A")
    }
    
    func testExistingBoxOffices() throws {
        
        let boxOfficesTitle = app.staticTexts["OmdbApp.DetailView.boxOfficesTitleLabel"]
        let boxOfficesLabel = app.staticTexts["OmdbApp.DetailView.boxOfficesValueLabel"]
        
        XCTAssertTrue(boxOfficesTitle.exists, "Box Offices Title not found.")
        XCTAssertTrue(boxOfficesLabel.exists, "Box Offices Label not found.")
        
        XCTAssertEqual(boxOfficesTitle.label, "Box Offices:", "Box Offices Title is not equal to Box Offices")
        XCTAssertEqual(boxOfficesLabel.label, "$369,345,583", "Box Offices Label is not equal to N/A")
    }
    
    func testExistsGenreCollectionView() throws {
        
        XCTAssertTrue(genreCollectionView.exists, "Genre Collection View not found.")
        XCTAssertEqual(genreCollectionView.cells.count, 3, "Genre Collection View Not Contains 3 row")
        
        let cellTitle = genreCollectionView.cells.element(boundBy: 0).staticTexts["Action"]
        
        XCTAssertTrue(cellTitle.exists, "Cell Title not found.")
        
    }
    
    func testExistsRatingCollectionView() throws {
        
        
        XCTAssertTrue(ratingCollectionView.exists, "Rating Collection View not found.")
        XCTAssertEqual(ratingCollectionView.cells.count, 3, "Rating Collection View Not Contains 3 row")
        
        let cellTitle = ratingCollectionView.cells.element(boundBy: 0).staticTexts["Internet Movie Database"]
        let cellRating = ratingCollectionView.cells.element(boundBy: 0).staticTexts["7.8/10"]
        
        XCTAssertTrue(cellTitle.exists, "Cell Title not found.")
        XCTAssertTrue(cellRating.exists, "Cell Rating not found.")
        
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
                
        XCTAssertTrue(title.exists, "Title Text not found.")

        XCTAssertEqual(title.label, "Batman v Superman: Dawn of Justice", "Title Text is not equal to Batman v Superman: Dawn of Justice")
        
        XCTAssertTrue(backItemButton.isEnabled)
        XCTAssertTrue(nextItemButton.isEnabled)


    }
    
    func testExistingBackItemButon2() throws {
        

        XCTAssertTrue(backItemButton.exists, "Back Item Button not found.")
        
        backItemButton.tap()
        nextItemButton.tap()
        backItemButton.tap()
                        
        XCTAssertTrue(title.exists, "Title Text not found.")

        XCTAssertEqual(title.label, "Batman v Superman: Dawn of Justice", "Title Text is not equal to Batman v Superman: Dawn of Justice")
        
        XCTAssertTrue(backItemButton.isEnabled)
        XCTAssertTrue(nextItemButton.isEnabled)

    }
    
    func testExistingBackItemButtonIsEnabled() throws {
        

        XCTAssertTrue(backItemButton.exists, "Back Item Button not found.")
        
        backItemButton.tap()
        backItemButton.tap()
                        
        XCTAssertFalse(backItemButton.isAccessibilityElement)
        XCTAssertTrue(nextItemButton.isEnabled)

    }

    func testExistingNextItemButon1() throws {
        

        XCTAssertTrue(nextItemButton.exists, "Back Item Button not found.")
        
        nextItemButton.tap()
                
        XCTAssertTrue(title.exists, "Title Text not found.")

        XCTAssertEqual(title.label, "Batman", "Title Text is not equal to Batman")
        
        XCTAssertTrue(backItemButton.isEnabled)
        XCTAssertTrue(nextItemButton.isEnabled)

    }
    
    func testExistingNextItemButon2() throws {
        

        XCTAssertTrue(nextItemButton.exists, "Back Item Button not found.")
        
        nextItemButton.tap()
        nextItemButton.tap()
                
        XCTAssertTrue(title.exists, "Title Text not found.")

        XCTAssertEqual(title.label, "Batman Returns", "Title Text is not equal to Batman Returns")
        
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

                        
        XCTAssertTrue(backItemButton.isEnabled)
        XCTAssertFalse(nextItemButton.isAccessibilityElement)

    }
    
    
    
    
    
    
    
}

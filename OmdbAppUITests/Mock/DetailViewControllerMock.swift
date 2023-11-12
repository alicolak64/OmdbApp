//
//  DetailViewControllerMock.swift
//  OmdbAppUITests
//
//  Created by Ali Çolak on 13.11.2023.
//

import Foundation

struct DetailViewControllerMock {
    
    static let initalCell = ItemMock.init(
        titleText: "The Batman",
        imdbText: "7.8/10 IMDb",
        typeText: "Movie",
        lengthTitleText: "Length",
        lenghtValueText:"176 min",
        languageTitleText: "Language",
        languageValueText: "English\nSpanish\nLatin\nItalian",
        ratingTitleText: "Rating",
        ratingValueText: "PG-13",
        releasedTitleText: "Released",
        releasedValueText: "04 Mar 2022",
        descriptionTitleText: "Description",
        descriptionValueText: "When a sadistic serial killer begins murdering key political figures in Gotham, Batman is forced to investigate the city's hidden corruption and question his family's involvement.",
        countryTitleText: "Country:",
        countryValueText: "United States",
        directorTitleText: "Director:",
        directorValueText: "Matt Reeves",
        writerTitleText: "Writer:",
        writerValueText: "Matt Reeves, Peter Craig, Bob Kane",
        actorsTitleText: "Actor:",
        actorsValueText: "Robert Pattinson, Zoë Kravitz, Jeffrey Wright",
        awardsTitleText: "Award:",
        awardsValueText: "Nominated for 3 Oscars. 33 wins & 163 nominations total",
        imdbVotesTitleText: "IMDb Votes:",
        imdbVotesValueText: "738,929",
        boxOfficeTitleText: "Box Offices:",
        boxOfficeValueText: "$369,345,583",
        genres: ["Action", "Crime", "Drama"],
        ratings: [
            Rating(source: "Internet Movie Database", value: "7.8/10"),
            Rating(source: "Rotten Tomatoes", value: "85%"),
            Rating(source: "Metacritic", value: "72/100")
        ]
        
    )
    static let previousCellTile = "Batman v Superman: Dawn of Justice"
    static let nextCellTile = "Batman"
    static let nextAndNextCellTitle = "Batman Returns"
    static let firstItemTitleForFirstPage = "Batman Begins"
    static let lastItemTitleForFirstPage = "Batman v Superman: Dawn of Justice (Ultimate Edition)"
}


struct ItemMock: Codable {
    let titleText: String
    let imdbText: String
    let typeText: String
    let lengthTitleText: String
    let lenghtValueText: String
    let languageTitleText: String
    let languageValueText: String
    let ratingTitleText: String
    let ratingValueText: String
    let releasedTitleText: String
    let releasedValueText: String
    let descriptionTitleText: String
    let descriptionValueText: String
    let countryTitleText: String
    let countryValueText: String
    let directorTitleText: String
    let directorValueText: String
    let writerTitleText: String
    let writerValueText: String
    let actorsTitleText: String
    let actorsValueText: String
    let awardsTitleText: String
    let awardsValueText: String
    let imdbVotesTitleText: String
    let imdbVotesValueText: String
    let boxOfficeTitleText: String
    let boxOfficeValueText: String
    let genres: [String]
    let ratings: [Rating]
}

struct Rating: Codable {
    let source: String
    let value: String
}

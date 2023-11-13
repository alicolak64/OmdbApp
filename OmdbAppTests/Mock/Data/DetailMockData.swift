//
//  DetailMockData.swift
//  OmdbAppTests
//
//  Created by Ali Çolak on 13.11.2023.
//

import XCTest
@testable import OmdbApp

struct DetailMockData {
    
    static let initalImdbId = "tt1877830"
    static let seconImdbId =   "tt2975590"
    
    static let initalItemDetail = DetailItemResponse(
        title: "The Batman",
        year: "2022",
        rated: "PG-13",
        released: "04 Mar 2022",
        runtime: "176 min",
        genre: "Action, Crime, Drama",
        director: "Matt Reeves",
        writer: "Matt Reeves, Peter Craig, Bob Kane",
        actors: "Robert Pattinson, Zoë Kravitz, Jeffrey Wright",
        plot: "When a sadistic serial killer begins murdering key political figures in Gotham, Batman is forced to investigate the city's hidden corruption and question his family's involvement.",
        language: "English, Spanish, Latin, Italian",
        country: "United States",
        awards: "Nominated for 3 Oscars. 33 wins & 163 nominations total",
        poster: "https://m.media-amazon.com/images/M/MV5BM2MyNTAwZGEtNTAxNC00ODVjLTgzZjUtYmU0YjAzNmQyZDEwXkEyXkFqcGdeQXVyNDc2NTg3NzA@._V1_SX300.jpg",
        ratings: [
            RatingResponse(source: "Internet Movie Database", value: "7.8/10"),
            RatingResponse(source: "Rotten Tomatoes", value: "85%"),
            RatingResponse(source: "Metacritic", value: "72/100")
        ],
        metascore: "72",
        imdbRating: "7.8",
        imdbVotes: "738,929",
        imdbID: "tt1877830",
        type: "movie",
        dvd: "19 Apr 2022",
        boxOffice: "$369,345,583",
        production: "N/A",
        website: "N/A",
        response: "True"
    )
    
    static let secondItemDetail = DetailItemResponse(
        title: "Batman v Superman: Dawn of Justice",
        year: "2016",
        rated: "PG-13",
        released: "25 Mar 2016",
        runtime: "151 min",
        genre: "Action, Adventure, Sci-Fi",
        director: "Zack Snyder",
        writer: "Bob Kane, Bill Finger, Jerry Siegel",
        actors: "Ben Affleck, Henry Cavill, Amy Adams",
        plot: "Batman is manipulated by Lex Luthor to fear Superman. Superman´s existence is meanwhile dividing the world and he is framed for murder during an international crisis. The heroes clash and force the neutral Wonder Woman to reemerge.",
        language: "English",
        country: "United States",
        awards: "14 wins & 33 nominations",
        poster: "https://m.media-amazon.com/images/M/MV5BYThjYzcyYzItNTVjNy00NDk0LTgwMWQtYjMwNmNlNWJhMzMyXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg",
        ratings: [
            RatingResponse(source: "Internet Movie Database", value: "6.5/10"),
            RatingResponse(source: "Rotten Tomatoes", value: "29%"),
            RatingResponse(source: "Metacritic", value: "44/100")
        ],
        metascore: "44",
        imdbRating: "6.5",
        imdbVotes: "742,174",
        imdbID: "tt2975590",
        type: "movie",
        dvd: "25 Nov 2016",
        boxOffice: "$330,360,194",
        production: "N/A",
        website: "N/A",
        response: "True"
    )

    
}

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
    
    static let firstItemDetail = DetailItemResponse(
        title: "Batman Begins",
        year: "2005",
        rated: "PG-13",
        released: "15 Jun 2005",
        runtime: "140 min",
        genre: "Action, Crime, Drama",
        director: "Christopher Nolan",
        writer: "Bob Kane, David S. Goyer, Christopher Nolan",
        actors: "Christian Bale, Michael Caine, Ken Watanabe",
        plot: "After witnessing his parents' death, Bruce learns the art of fighting to confront injustice. When he returns to Gotham as Batman, he must stop a secret society that intends to destroy the city.",
        language: "English, Mandarin",
        country: "United States, United Kingdom",
        awards: "Nominated for 1 Oscar. 14 wins & 79 nominations total",
        poster: "https://m.media-amazon.com/images/M/MV5BOTY4YjI2N2MtYmFlMC00ZjcyLTg3YjEtMDQyM2ZjYzQ5YWFkXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg",
        ratings: [
            RatingResponse(source: "Internet Movie Database", value: "8.2/10"),
            RatingResponse(source: "Rotten Tomatoes", value: "85%"),
            RatingResponse(source: "Metacritic", value: "70/100")
        ],
        metascore: "70",
        imdbRating: "8.2",
        imdbVotes: "1,540,461",
        imdbID: "tt0372784",
        type: "movie",
        dvd: "09 Sep 2009",
        boxOffice: "$206,863,479",
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
    
    static let thirdItemDetail = DetailItemResponse(
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
    
    static let fourthItemDetail = DetailItemResponse(
        title: "Batman",
        year: "1989",
        rated: "PG-13",
        released: "23 Jun 1989",
        runtime: "126 min",
        genre: "Action, Adventure",
        director: "Tim Burton",
        writer: "Bob Kane, Sam Hamm, Warren Skaaren",
        actors: "Michael Keaton, Jack Nicholson, Kim Basinger",
        plot: "The Dark Knight of Gotham City begins his war on crime with his first major enemy being Jack Napier, a criminal who becomes the clownishly homicidal Joker.",
        language: "English, French, Spanish",
        country: "United States, United Kingdom",
        awards: "Won 1 Oscar. 10 wins & 28 nominations total",
        poster: "https://m.media-amazon.com/images/M/MV5BZWQ0OTQ3ODctMmE0MS00ODc2LTg0ZTEtZWIwNTUxOGExZTQ4XkEyXkFqcGdeQXVyNzAwMjU2MTY@._V1_SX300.jpg",
        ratings: [
            RatingResponse(source: "Internet Movie Database", value: "7.5/10"),
            RatingResponse(source: "Rotten Tomatoes", value: "76%"),
            RatingResponse(source: "Metacritic", value: "69/100")
        ],
        metascore: "69",
        imdbRating: "7.5",
        imdbVotes: "396,849",
        imdbID: "tt0096895",
        type: "movie",
        dvd: "24 Jul 2014",
        boxOffice: "$251,409,241",
        production: "N/A",
        website: "N/A",
        response: "True"
    )
    
    
}

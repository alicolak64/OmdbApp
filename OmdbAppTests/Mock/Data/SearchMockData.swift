//
//  MockData.swift
//  OmdbAppTests
//
//  Created by Ali Çolak on 13.11.2023.
//

import XCTest
@testable import OmdbApp


struct SearchMockData {
    
    static let batmanSearchResponsePage1 = SearchResponse(
        search: [
            SearchItemResponse(
                title: "Batman Begins",
                year: "2005",
                imdbID: "tt0372784",
                type: "Movie",
                poster: "https://m.media-amazon.com/images/M/MV5BOTY4YjI2N2MtYmFlMC00ZjcyLTg3YjEtMDQyM2ZjYzQ5YWFkXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg"
            ),
            SearchItemResponse(
                title: "Batman v Superman: Dawn of Justice",
                year: "2016",
                imdbID: "tt2975590",
                type: "Movie",
                poster: "https://m.media-amazon.com/images/M/MV5BYThjYzcyYzItNTVjNy00NDk0LTgwMWQtYjMwNmNlNWJhMzMyXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg"
            ),
            SearchItemResponse(
                title: "The Batman",
                year: "2022",
                imdbID: "tt1877830",
                type: "Movie",
                poster: "https://m.media-amazon.com/images/M/MV5BM2MyNTAwZGEtNTAxNC00ODVjLTgzZjUtYmU0YjAzNmQyZDEwXkEyXkFqcGdeQXVyNDc2NTg3NzA@._V1_SX300.jpg"
            ),
            SearchItemResponse(
                title: "Batman",
                year: "1989",
                imdbID: "tt0096895",
                type: "Movie",
                poster: "https://m.media-amazon.com/images/M/MV5BZWQ0OTQ3ODctMmE0MS00ODc2LTg0ZTEtZWIwNTUxOGExZTQ4XkEyXkFqcGdeQXVyNzAwMjU2MTY@._V1_SX300.jpg"
            ),
            SearchItemResponse(
                title: "Batman Returns",
                year: "1992",
                imdbID: "tt0103776",
                type: "Movie",
                poster: "https://m.media-amazon.com/images/M/MV5BOGZmYzVkMmItM2NiOS00MDI3LWI4ZWQtMTg0YWZkODRkMmViXkEyXkFqcGdeQXVyODY0NzcxNw@@._V1_SX300.jpg"
            ),
            SearchItemResponse(
                title: "Batman & Robin",
                year: "1997",
                imdbID: "tt0118688",
                type: "Movie",
                poster: "https://m.media-amazon.com/images/M/MV5BMGQ5YTM1NmMtYmIxYy00N2VmLWJhZTYtN2EwYTY3MWFhOTczXkEyXkFqcGdeQXVyNTA2NTI0MTY@._V1_SX300.jpg"
            ),
            SearchItemResponse(
                title: "Batman Forever",
                year: "1995",
                imdbID: "tt0112462",
                type: "Movie",
                poster: "https://m.media-amazon.com/images/M/MV5BNDdjYmFiYWEtYzBhZS00YTZkLWFlODgtY2I5MDE0NzZmMDljXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg"
            ),
            SearchItemResponse(
                title: "The Lego Batman Movie",
                year: "2017",
                imdbID: "tt4116284",
                type: "Movie",
                poster: "https://m.media-amazon.com/images/M/MV5BMTcyNTEyOTY0M15BMl5BanBnXkFtZTgwOTAyNzU3MDI@._V1_SX300.jpg"
            ),
            SearchItemResponse(
                title: "Batman: The Animated Series",
                year: "1992–1995",
                imdbID: "tt0103359",
                type: "Series",
                poster: "https://m.media-amazon.com/images/M/MV5BOTM3MTRkZjQtYjBkMy00YWE1LTkxOTQtNDQyNGY0YjYzNzAzXkEyXkFqcGdeQXVyOTgwMzk1MTA@._V1_SX300.jpg"
            ),
            SearchItemResponse(
                title: "Batman v Superman: Dawn of Justice (Ultimate Edition)",
                year: "2016",
                imdbID: "tt18689424",
                type: "Movie",
                poster: "https://m.media-amazon.com/images/M/MV5BOTRlNWQwM2ItNjkyZC00MGI3LThkYjktZmE5N2FlMzcyNTIyXkEyXkFqcGdeQXVyMTEyNzgwMDUw._V1_SX300.jpg"
            )
        ],
        totalResults: "551",
        response: "True",
        error: nil
    )
    
    static let batmanSearchResponsePage2 = SearchResponse(
        search: [
            SearchItemResponse(
                title: "Batman: The Killing Joke",
                year: "2016",
                imdbID: "tt4853102",
                type: "Movie",
                poster: "https://m.media-amazon.com/images/M/MV5BMTdjZTliODYtNWExMi00NjQ1LWIzN2MtN2Q5NTg5NTk3NzliL2ltYWdlXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg"
            ),
            SearchItemResponse(
                title: "Batman: Under the Red Hood",
                year: "2010",
                imdbID: "tt1569923",
                type: "Movie",
                poster: "https://m.media-amazon.com/images/M/MV5BNmY4ZDZjY2UtOWFiYy00MjhjLThmMjctOTQ2NjYxZGRjYmNlL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg"
            ),
            SearchItemResponse(
                title: "Batman: Mask of the Phantasm",
                year: "1993",
                imdbID: "tt0106364",
                type: "Movie",
                poster: "https://m.media-amazon.com/images/M/MV5BYTRiMWM3MGItNjAxZC00M2E3LThhODgtM2QwOGNmZGU4OWZhXkEyXkFqcGdeQXVyNjExODE1MDc@._V1_SX300.jpg"
            ),
            SearchItemResponse(
                title: "Batman: The Dark Knight Returns, Part 1",
                year: "2012",
                imdbID: "tt2313197",
                type: "Movie",
                poster: "https://m.media-amazon.com/images/M/MV5BMzIxMDkxNDM2M15BMl5BanBnXkFtZTcwMDA5ODY1OQ@@._V1_SX300.jpg"
            ),
            SearchItemResponse(
                title: "Batman: The Dark Knight Returns, Part 2",
                year: "2013",
                imdbID: "tt2166834",
                type: "Movie",
                poster: "https://m.media-amazon.com/images/M/MV5BYTEzMmE0ZDYtYWNmYi00ZWM4LWJjOTUtYTE0ZmQyYWM3ZjA0XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_SX300.jpg"
            ),
            SearchItemResponse(
                title: "Batman: The Movie",
                year: "1966",
                imdbID: "tt0060153",
                type: "Movie",
                poster: "https://m.media-amazon.com/images/M/MV5BMmM1OGIzM2UtNThhZS00ZGNlLWI4NzEtZjlhOTNhNmYxZGQ0XkEyXkFqcGdeQXVyNTkxMzEwMzU@._V1_SX300.jpg"
            ),
            SearchItemResponse(
                title: "Batman: Year One",
                year: "2011",
                imdbID: "tt1672723",
                type: "Movie",
                poster: "https://m.media-amazon.com/images/M/MV5BNTJjMmVkZjctNjNjMS00ZmI2LTlmYWEtOWNiYmQxYjY0YWVhXkEyXkFqcGdeQXVyNjExODE1MDc@._V1_SX300.jpg"
            ),
            SearchItemResponse(
                title: "Batman: Assault on Arkham",
                year: "2014",
                imdbID: "tt3139086",
                type: "Movie",
                poster: "https://m.media-amazon.com/images/M/MV5BZDU1ZGRiY2YtYmZjMi00ZDQwLWJjMWMtNzUwNDMwYjQ4ZTVhXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg"
            ),
            SearchItemResponse(
                title: "Batman Beyond",
                year: "1999–2001",
                imdbID: "tt0147746",
                type: "Series",
                poster: "https://m.media-amazon.com/images/M/MV5BZWJhNjA4YTAtODBlMS00NjIzLThhZWUtOGYxMGM3OTRmNDZmXkEyXkFqcGdeQXVyNjk1Njg5NTA@._V1_SX300.jpg"
            ),
            SearchItemResponse(
                title: "Batman: Gotham Knight",
                year: "2008",
                imdbID: "tt1117563",
                type: "Movie",
                poster: "https://m.media-amazon.com/images/M/MV5BM2I0YTFjOTUtMWYzNC00ZTgyLTk2NWEtMmE3N2VlYjEwN2JlXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg"
            )
        ],
        totalResults: "552",
        response: "True",
        error: nil
    )
    
    static let fightClubSearchResponsePage1 = SearchResponse(
        search: [
            SearchItemResponse(
                title: "Fight Club",
                year: "1999",
                imdbID: "tt0137523",
                type: "Movie",
                poster: "https://m.media-amazon.com/images/M/MV5BODQ0OWJiMzktYjNlYi00MzcwLThlZWMtMzRkYTY4ZDgxNzgxXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg"
            ),
            SearchItemResponse(
                title: "Superhero Fight Club",
                year: "2015",
                imdbID: "tt4622122",
                type: "Movie",
                poster: "https://m.media-amazon.com/images/M/MV5BN2NhMzc1MDktM2ExNy00YTRjLTgxOGYtNzNmMzY2MmUwMWVlXkEyXkFqcGdeQXVyMTEyNzgwMDUw._V1_SX300.jpg"
            ),
            SearchItemResponse(
                title: "Fight Club: Members Only",
                year: "2006",
                imdbID: "tt0456413",
                type: "Movie",
                poster: "https://m.media-amazon.com/images/M/MV5BNWU5ZjA1OTQtMGE1MS00NWU3LThmYTEtMTI2ZjlhNzYxZjU5XkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_SX300.jpg"
            ),
            SearchItemResponse(
                title: "Superhero Fight Club 2.0",
                year: "2016",
                imdbID: "tt6107818",
                type: "Movie",
                poster: "https://m.media-amazon.com/images/M/MV5BYTE3MGYxYzAtYzVhZi00NWIxLWFkNmQtMDBhOTZmZWI4MDU1XkEyXkFqcGdeQXVyNDA5ODU0NDg@._V1_SX300.jpg"
            ),
            SearchItemResponse(
                title: "Zombie Fight Club",
                year: "2014",
                imdbID: "tt3560742",
                type: "Movie",
                poster: "https://m.media-amazon.com/images/M/MV5BYmY4YmE2NGUtNmJkOS00ZjFlLTg2NDYtZjdiYjRiZjdiZmE3XkEyXkFqcGdeQXVyMjAyNTEwOQ@@._V1_SX300.jpg"
            ),
            SearchItemResponse(
                title: "Jurassic Fight Club",
                year: "2008",
                imdbID: "tt1258908",
                type: "Series",
                poster: "https://m.media-amazon.com/images/M/MV5BMjEyMDY1MDg5OF5BMl5BanBnXkFtZTcwNjYyMTk3MQ@@._V1_SX300.jpg"
            ),
            SearchItemResponse(
                title: "Fight Club",
                year: "2004",
                imdbID: "tt0415800",
                type: "Game",
                poster: "https://m.media-amazon.com/images/M/MV5BN2MyOGJiMzAtODEzYi00OWEyLTlkNzQtZDYzOGI5OGEzNmRlXkEyXkFqcGdeQXVyMTA1OTEwNjE@._V1_SX300.jpg"
            ),
            SearchItemResponse(
                title: "Bare Knuckle Fight Club",
                year: "2007–",
                imdbID: "tt6684226",
                type: "Series",
                poster: "https://m.media-amazon.com/images/M/MV5BN2JhNjczNGItODljNS00YjQ5LTg0OGUtMGMzOWY1NTQwMzdkXkEyXkFqcGdeQXVyMzU4NjI2NQ@@._V1_SX300.jpg"
            ),
            SearchItemResponse(
                title: "On Location: Fight Club",
                year: "2000",
                imdbID: "tt0373207",
                type: "Movie",
                poster: "N/A"
            ),
            SearchItemResponse(
                title: "Jamie & Jimmy's Food Fight Club",
                year: "2012–",
                imdbID: "tt4410492",
                type: "Series",
                poster: "https://m.media-amazon.com/images/M/MV5BYjBlYmRiMDMtODk4NS00YzRjLThmNmItNzQ5MjFkMjNlY2RmXkEyXkFqcGdeQXVyMTUyNjc3NDQ4._V1_SX300.jpg"
            )
        ],
        totalResults: "66",
        response: "True",
        error: nil
    )
    
    static let fightClubSearchResponsePage2 = SearchResponse(
        search: [
            SearchItemResponse(
                title: "Cartoon Fight Club",
                year: "2015–",
                imdbID: "tt6096830",
                type: "Series",
                poster: "https://m.media-amazon.com/images/M/MV5BYmRhNjE3NWYtMGNmNC00YTI3LWI5NDctNGYxMDdiOWNiOGQ2XkEyXkFqcGdeQXVyNjg5MjUzMTI@._V1_SX300.jpg"
            ),
            SearchItemResponse(
                title: "Buena Vista Fight Club",
                year: "2000",
                imdbID: "tt0229275",
                type: "Movie",
                poster: "https://m.media-amazon.com/images/M/MV5BOGQyMTg2NDctZjU5Zi00NTI1LTg4NjMtM2UyOTI4MmQ0Nzk5XkEyXkFqcGdeQXVyMTAxMjIzNTQ5._V1_SX300.jpg"
            ),
            SearchItemResponse(
                title: "Comedy Fight Club",
                year: "2007–",
                imdbID: "tt1042453",
                type: "Series",
                poster: "https://m.media-amazon.com/images/M/MV5BZjNmMzhiMGUtNDhjZi00ZWY0LWI3ZWMtMTU3OTc1ODBiMGU0XkEyXkFqcGdeQXVyNzI0OTYzNzQ@._V1_SX300.jpg"
            ),
            SearchItemResponse(
                title: "Fight Club",
                year: "2021",
                imdbID: "tt13707558",
                type: "Series",
                poster: "https://m.media-amazon.com/images/M/MV5BOGYyZDVjZDItYjM4ZS00ODFjLTg0OWYtMTUxYzYwZDRkODkyXkEyXkFqcGdeQXVyNDg4MjkzNDk@._V1_SX300.jpg"
            ),
            SearchItemResponse(
                title: "Florence Fight Club",
                year: "2015",
                imdbID: "tt3072180",
                type: "Movie",
                poster: "https://m.media-amazon.com/images/M/MV5BMzc1MTZmMjgtNWVhZC00MjM0LWIwODUtNTAwNmE2YmNlMjk3XkEyXkFqcGdeQXVyNjk1MjY1MDM@._V1_SX300.jpg"
            ),
            SearchItemResponse(
                title: "Florence Fight Club",
                year: "2010",
                imdbID: "tt1614969",
                type: "Movie",
                poster: "https://m.media-amazon.com/images/M/MV5BNGNkNzdjZGEtMTU2YS00NmQ4LWFjMDQtODc1M2YwNjZkZmE4XkEyXkFqcGdeQXVyNTM3MDMyMDQ@._V1_SX300.jpg"
            ),
            SearchItemResponse(
                title: "Fight Club: Copy of a Copy",
                year: "2015",
                imdbID: "tt5943502",
                type: "Movie",
                poster: "https://m.media-amazon.com/images/M/MV5BNTNhNjhhZTEtNWM3OS00OWIwLWIxMDgtMGViNmQyYzlmNWJjXkEyXkFqcGdeQXVyNDEzODUyOTE@._V1_SX300.jpg"
            ),
            SearchItemResponse(
                title: "Insane Fight Club",
                year: "2014–",
                imdbID: "tt3605366",
                type: "Series",
                poster: "https://m.media-amazon.com/images/M/MV5BMDgxNDg1OGYtZDU3OS00OTM5LWExMmEtNjlmYTI2MDFlYjE0XkEyXkFqcGdeQXVyMjIwNDg2OTU@._V1_SX300.jpg"
            ),
            SearchItemResponse(
                title: "Triller Fight Club: Paul vs. Askren",
                year: "2021",
                imdbID: "tt15301736",
                type: "Movie",
                poster: "https://m.media-amazon.com/images/M/MV5BYWUwZWQxZDktNzYzNi00YzM1LThiNmMtZWRlYzdkM2U4MzRmXkEyXkFqcGdeQXVyNzU5MjczMzE@._V1_SX300.jpg"
            ),
            SearchItemResponse(
                title: "Brooklyn Girls Fight Club",
                year: "2013",
                imdbID: "tt3519952",
                type: "Movie",
                poster: "https://m.media-amazon.com/images/M/MV5BMTczNzE2OTI2MF5BMl5BanBnXkFtZTgwNDU3MjI5MTE@._V1_SX300.jpg"
            )
        ],
        totalResults: "66",
        response: "True",
        error: nil
    )
    
    static let fightClubSearchResponsePage3 =  SearchResponse(
        search: [
            SearchItemResponse(
                title: "Girls Fight Club",
                year: "2007",
                imdbID: "tt1264089",
                type: "Movie",
                poster: "https://m.media-amazon.com/images/M/MV5BMTk1MTY2NDI3Nl5BMl5BanBnXkFtZTcwNzA2MDA4Mg@@._V1_SX300.jpg"
            ),
            SearchItemResponse(
                title: "Outback Fight Club",
                year: "2011",
                imdbID: "tt1808372",
                type: "Series",
                poster: "N/A"
            ),
            SearchItemResponse(
                title: "Tito Ortiz's Girls Fight Club",
                year: "2009",
                imdbID: "tt1491618",
                type: "Movie",
                poster: "https://m.media-amazon.com/images/M/MV5BMzY2MDIyMTA2Nl5BMl5BanBnXkFtZTcwNTk1MDA4Mg@@._V1_SX300.jpg"
            ),
            SearchItemResponse(
                title: "BJJ NO-MAD: First Rule of the Fight Club",
                year: "2015",
                imdbID: "tt5369048",
                type: "Movie",
                poster: "https://m.media-amazon.com/images/M/MV5BYjgxOGEzMTgtOGVhMS00OGY0LWEyMGUtZmRhNzQ0N2FhNTBjXkEyXkFqcGdeQXVyNjUzMzQ2Njk@._V1_SX300.jpg"
            ),
            SearchItemResponse(
                title: "Fight club camp kusse: Stand up på Skanderborg",
                year: "2006",
                imdbID: "tt0786999",
                type: "Movie",
                poster: "N/A"
            ),
            SearchItemResponse(
                title: "Football's Fight Club",
                year: "2002",
                imdbID: "tt0954934",
                type: "Movie",
                poster: "N/A"
            ),
            SearchItemResponse(
                title: "1PW: Fight Club 2",
                year: "2006",
                imdbID: "tt0851494",
                type: "Movie",
                poster: "N/A"
            ),
            SearchItemResponse(
                title: "Musangwe: Fight Club",
                year: "2007",
                imdbID: "tt1528785",
                type: "Movie",
                poster: "https://m.media-amazon.com/images/M/MV5BMzc1MTQ4ODgxNV5BMl5BanBnXkFtZTgwMzg3MTgwMDI@._V1_SX300.jpg"
            ),
            SearchItemResponse(
                title: "60 Second Fight Club",
                year: "2011",
                imdbID: "tt1887654",
                type: "Movie",
                poster: "https://m.media-amazon.com/images/M/MV5BM2JkMGY1ZjUtNGNkNS00NmMzLTgyYzUtM2M3N2MzMDRmYTdiXkEyXkFqcGdeQXVyMjM3ODA2NDQ@._V1_SX300.jpg"
            ),
            SearchItemResponse(
                title: "Teen Girl Fight Club",
                year: "2019",
                imdbID: "tt9579092",
                type: "Movie",
                poster: "https://m.media-amazon.com/images/M/MV5BODU0OTRjN2MtMTI2NC00Y2JkLWI5MTItM2UxNjVmOTZkOTZkXkEyXkFqcGdeQXVyMTcxMjQ1NA@@._V1_SX300.jpg"
            )
        ],
        totalResults: "66",
        response: "True",
        error: nil
    )
    static let fightClubSearchResponsePage4 = SearchResponse(
        search: [
            SearchItemResponse(
                title: "Elevator Fight Club",
                year: "2019",
                imdbID: "tt11694546",
                type: "Movie",
                poster: "N/A"
            ),
            SearchItemResponse(
                title: "Fantasy Fight Club",
                year: "2020–",
                imdbID: "tt12374832",
                type: "Series",
                poster: "https://m.media-amazon.com/images/M/MV5BMTBkNzkxZTItZTJiMS00MWFkLTk0YmUtNDFkZjc4ZjE0ZGM3XkEyXkFqcGdeQXVyMzYzNzc1NjY@._V1_SX300.jpg"
            ),
            SearchItemResponse(
                title: "Fight Club",
                year: "2018",
                imdbID: "tt13212384",
                type: "Movie",
                poster: "https://m.media-amazon.com/images/M/MV5BZGI4Y2VmNTYtNDBjMS00MDdlLWIyNjEtNjEwMjg4OGU1ZjZkXkEyXkFqcGdeQXVyMTA1Mjc3MDM1._V1_SX300.jpg"
            ),
            SearchItemResponse(
                title: "Amateur Boxing Fight Club",
                year: "1949–1950",
                imdbID: "tt13735118",
                type: "Series",
                poster: "N/A"
            ),
            SearchItemResponse(
                title: "The Baby-Sitters Fight Club",
                year: "2020–",
                imdbID: "tt13870882",
                type: "Series",
                poster: "N/A"
            ),
            SearchItemResponse(
                title: "Fight Club: Casting Calls",
                year: "2017",
                imdbID: "tt6612022",
                type: "Movie",
                poster: "https://m.media-amazon.com/images/M/MV5BZjY4MWQzNDctYzA2ZS00MjQ1LWE5NTMtOGJmNDQzMGQ2YzBhXkEyXkFqcGdeQXVyMjAyNzg1NjQ@._V1_SX300.jpg"
            ),
            SearchItemResponse(
                title: "ICW: Friday Night Fight Club",
                year: "2015–",
                imdbID: "tt4489644",
                type: "Series",
                poster: "https://m.media-amazon.com/images/M/MV5BOWRlYTQ1NjItMzU0ZC00NjZiLTkzNzItNzM1YjA0NjM4NGVkXkEyXkFqcGdeQXVyMzc3MTU3NDc@._V1_SX300.jpg"
            ),
            SearchItemResponse(
                title: "Extraordinary Bodies: City Boy Fight Club",
                year: "2017",
                imdbID: "tt7581622",
                type: "Movie",
                poster: "N/A"
            ),
            SearchItemResponse(
                title: "Smash Bros. Fight Club Trailer",
                year: "2012",
                imdbID: "tt8558274",
                type: "Movie",
                poster: "https://m.media-amazon.com/images/M/MV5BZTg4Zjc1ZDMtZDQ5Yy00MmY2LWEwZTUtNDI0NWMzZmE5Y2I5XkEyXkFqcGdeQXVyMjYzNDgwNzk@._V1_SX300.jpg"
            ),
            SearchItemResponse(
                title: "The Truth About Fight Club: One Minute at a Time",
                year: "2018",
                imdbID: "tt8726168",
                type: "Movie",
                poster: "https://m.media-amazon.com/images/M/MV5BNzdjZWYyNGUtOWQ2Yi00N2NlLWIyNjEtNjEwMjg4OGU1ZjZkXkEyXkFqcGdeQXVyMDY3OTcyOQ@@._V1_SX300.jpg"
            )
        ],
        totalResults: "66",
        response: "True",
        error: nil
    )
    
    static let fightClubSearchResponsePage5 = SearchResponse(
        search: [
            SearchItemResponse(
                title: "Zombie Girl Fight Club",
                year: "2015",
                imdbID: "tt9397874",
                type: "Movie",
                poster: "https://m.media-amazon.com/images/M/MV5BMjFjM2M3OGQtNDFlMC00Y2NjLTllZTAtZWZlNDBkM2QzOTgwXkEyXkFqcGdeQXVyNTY3NDkxMjk@._V1_SX300.jpg"
            ),
            SearchItemResponse(
                title: "Mox v Gage: GCW Fight Club Countdown Special",
                year: "2021",
                imdbID: "tt15560518",
                type: "Movie",
                poster: "https://m.media-amazon.com/images/M/MV5BMDQ0OTJlNzItOGFlZS00ZmJlLTlhY2ItOTE3ZjE2MmZjZmY2XkEyXkFqcGdeQXVyMTY3Mjk3MzI@._V1_SX300.jpg"
            ),
            SearchItemResponse(
                title: "Fight Club",
                year: "2022",
                imdbID: "tt16225632",
                type: "Movie",
                poster: "N/A"
            ),
            SearchItemResponse(
                title: "Saturday Night Fight Club",
                year: "2020–",
                imdbID: "tt17050572",
                type: "Series",
                poster: "https://m.media-amazon.com/images/M/MV5BNTgwNzY2NDEtYTI1ZS00OGI3LTljMmItNTUzNjRlMjRkZmUyXkEyXkFqcGdeQXVyMTM1ODg1MTEx._V1_SX300.jpg"
            ),
            SearchItemResponse(
                title: "Anna Konda: Female Fight Club Berlin",
                year: "2020",
                imdbID: "tt19768184",
                type: "Movie",
                poster: "https://m.media-amazon.com/images/M/MV5BYTkxMWQ4NDgtZTViZC00MzYwLThlYjktOGIxNzk4ZTk4NDc3XkEyXkFqcGdeQXVyNTgwNjc5Mzk@._V1_SX300.jpg"
            ),
            SearchItemResponse(
                title: "Fight Club (1999)",
                year: "1999",
                imdbID: "tt20236210",
                type: "Movie",
                poster: "N/A"
            ),
            SearchItemResponse(
                title: "Fight Club (1999)/Cabaret (1972) - 89 Movie Buff Specialists (Ep 12)",
                year: "1999",
                imdbID: "tt25601288",
                type: "Movie",
                poster: "N/A"
            ),
            SearchItemResponse(
                title: "Fight Club (1999) - Movie Review",
                year: "1999",
                imdbID: "tt26985850",
                type: "Movie",
                poster: "N/A"
            ),
            SearchItemResponse(
                title: "Great White Fight Club",
                year: "2023",
                imdbID: "tt29397285",
                type: "Movie",
                poster: "N/A"
            ),
            SearchItemResponse(
                title: "Chris Crudelli's Fight Club",
                year: "2011–",
                imdbID: "tt1919460",
                type: "Series",
                poster: "N/A"
            )
        ],
        totalResults: "66",
        response: "True",
        error: nil
    )
    
    static let fightClubSearchResponsePage6 = SearchResponse(
        search: [
            SearchItemResponse(
                title: "Comedy Fight Club - Ugens vinder",
                year: "2007–",
                imdbID: "tt2300630",
                type: "Series",
                poster: "N/A"
            ),
            SearchItemResponse(
                title: "Pillow Fight Club",
                year: "2012",
                imdbID: "tt2634556",
                type: "Movie",
                poster: "N/A"
            ),
            SearchItemResponse(
                title: "Stimulus Fight Club",
                year: "2013",
                imdbID: "tt2639108",
                type: "Movie",
                poster: "N/A"
            ),
            SearchItemResponse(
                title: "Showme Fight Club",
                year: "2013",
                imdbID: "tt2821858",
                type: "Movie",
                poster: "N/A"
            ),
            SearchItemResponse(
                title: "Fight Club Physics",
                year: "2012",
                imdbID: "tt3021440",
                type: "Movie",
                poster: "N/A"
            ),
            SearchItemResponse(
                title: "Real Fight Club",
                year: "2008",
                imdbID: "tt1530666",
                type: "Movie",
                poster: "N/A"
            ),
            SearchItemResponse(
                title: "1PW: Fight Club 1",
                year: "2006",
                imdbID: "tt1613673",
                type: "Movie",
                poster: "N/A"
            ),
            SearchItemResponse(
                title: "Bitch Fight Club",
                year: "2014",
                imdbID: "tt4333122",
                type: "Movie",
                poster: "N/A"
            ),
            SearchItemResponse(
                title: "Alien Fight Club",
                year: "2015",
                imdbID: "tt3163764",
                type: "Movie",
                poster: "N/A"
            ),
            SearchItemResponse(
                title: "Dance Fight Club",
                year: "2016",
                imdbID: "tt5718440",
                type: "Movie",
                poster: "N/A"
            )
        ],
        totalResults: "66",
        response: "True",
        error: nil
    )
    
    static let fightClubSearchResponsePage7 = SearchResponse(
        search: [
            SearchItemResponse(
                title: "Vice Sports: Bronx Fight Club",
                year: "2015",
                imdbID: "tt5757362",
                type: "Movie",
                poster: "N/A"
            ),
            SearchItemResponse(
                title: "G Rated Fight Club",
                year: "2015",
                imdbID: "tt5778468",
                type: "Movie",
                poster: "https://m.media-amazon.com/images/M/MV5BZDJmZWY2MjItMTg1OS00NmQ0LThjMDItOWU0NTRiMjJhY2NiXkEyXkFqcGdeQXVyNjgzNDgwNjY@._V1_SX300.jpg"
            ),
            SearchItemResponse(
                title: "Football Fight Club 2",
                year: "2015",
                imdbID: "tt5112196",
                type: "Movie",
                poster: "N/A"
            ),
            SearchItemResponse(
                title: "Football Fight Club",
                year: "2014–",
                imdbID: "tt5114704",
                type: "Series",
                poster: "N/A"
            ),
            SearchItemResponse(
                title: "Flogging 'Fight Club'",
                year: "2000",
                imdbID: "tt5270994",
                type: "Movie",
                poster: "N/A"
            ),
            SearchItemResponse(
                title: "Eye of the Empress: The Fight Club",
                year: "2015",
                imdbID: "tt5355654",
                type: "Movie",
                poster: "https://m.media-amazon.com/images/M/MV5BNzUxOTA0NzEyM15BMl5BanBnXkFtZTgwNjk2Njk3NzE@._V1_SX300.jpg"
            )
        ],
        totalResults: "66",
        response: "True",
        error: nil
    )
    
    static let errorSearchResponse = SearchResponse(
        search: nil,
        totalResults: nil,
        response: "False",
        error: "Movie not found!"
    )
    
}

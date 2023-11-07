//
//  DetailDto.swift
//  OmdbApp
//
//  Created by Ali Çolak on 7.11.2023.
//

import Foundation

struct DetailItemDto: Codable {
    
    let item : DetailItemResponse
    
    var title: String {
        item.title
    }
    
    var rated: String {
        item.rated
    }
    
    var released: String {
        item.released
    }
    
    var runtime: String {
        item.runtime
    }
    
    var genre: String {
        item.genre
    }
    
    var director: String {
        item.director
    }
    
    var writer: String {
        item.writer
    }
    
    var actors: String {
        item.actors
    }
    
    var plot : String {
        item.plot
    }
    
    var language : String {
        item.language
    }
    
    var country : String {
        item.country
    }
    
    var awards : String {
        item.awards
    }
    
    var poster: String {
        if item.poster == AppConstants.notAvaliableApiText {
            return AppConstants.noImageUrl
        } else {
            return item.poster
        }
    }
    
    var ratings: [RatingDto]? {
        return item.ratings?.map { RatingDto(source: $0.source, value: $0.value) }
    }
    
    var imdbVotes : String {
        item.imdbVotes
    }
    
    var imdbID : String {
        item.imdbID
    }
    
    var type : String {
        guard let firstCharacter = item.type.first else {
            return ""
        }
        return String(firstCharacter).uppercased() + item.type.dropFirst().lowercased()
    }
    
    var boxOffice: String {
        item.boxOffice
    }
}

struct RatingDto: Codable {
    let source: String
    let value: String
}

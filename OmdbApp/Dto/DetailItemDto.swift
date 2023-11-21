//
//  DetailDto.swift
//  OmdbApp
//
//  Created by Ali Çolak on 7.11.2023.
//

import UIKit

struct DetailItemDto: Codable {
    
    let item: DetailItemResponse
    
    var title: String {
        item.title ?? "No Title"
    }
    
    var rated: String {
        item.rated ?? "No Rated"
    }
    
    var released: String {
        item.released ?? "No Time"
    }
    
    var runtime: String {
        item.runtime ?? "No Min"
    }
    
    var genre: String {
        item.genre ?? "No Genre, "
    }
    
    var director: String {
        item.director ?? "No Director"
    }
    
    var writer: String {
        item.writer ?? "No Writer"
    }
    
    var actors: String {
        item.actors ?? "No Actors"
    }
    
    var plot: String {
        item.plot ?? "No Desc"
    }
    
    var language: String {
        item.language ?? "No Lang"
    }
    
    var country: String {
        item.country ?? "No Country"
    }
    
    var awards: String {
        item.awards ?? "No Awards"
    }
    
    var poster: String {
        if item.poster == AppConstants.notAvaliableApiText {
            return AppConstants.noImageUrl
        } else {
            return item.poster ?? AppConstants.noImageUrl
        }
    }
    
    var ratings: [RatingDto]? {
        return item.ratings?.map { RatingDto(source: $0.source ?? "No Source", value: $0.value ?? "No Value") }
    }
    
    var imdbRating: String {
        item.imdbRating ?? "0.0"
    }
    
    var imdbVotes: String {
        item.imdbVotes ?? "No Imdb Votes"
    }
    
    var imdbID: String {
        item.imdbID
    }
    
    var type: String {
        guard let firstCharacter = item.type?.first else {
            return ""
        }
        return String(firstCharacter).uppercased() + (item.type?.dropFirst().lowercased())!
    }
    
    var typeColor: UIColor {
        AppConstantFunctions.getTypeColor(forType: item.type ?? "")
    }
    
    var boxOffice: String {
        item.boxOffice ?? "No Box Office"
    }
}

struct RatingDto: Codable {
    let source: String
    let value: String
}

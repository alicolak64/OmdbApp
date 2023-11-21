//
//  SearchDto.swift
//  OmdbApp
//
//  Created by Ali Çolak on 7.11.2023.
//

import UIKit

struct SearchItemDto: Codable {
    
    let item: SearchItemResponse
    
    var title: String {
        item.title ?? "No Title"
    }
    
    var year: String {
        item.year ?? "No Year"
    }
    
    var type: String {
        guard let firstCharacter = item.type?.first else {
            return ""
        }
        return String(firstCharacter).uppercased() + (item.type?.dropFirst().lowercased() ?? "No Type")
    }
    
    var poster: String {
        if let poster = item.poster, poster != AppConstants.notAvaliableApiText {
            return poster
        } else {
            return AppConstants.noImageUrl
        }
    }
    
    var imdbId: String {
        item.imdbID ?? "No ImdbId"
    }
    
    var typeColor: UIColor {
        AppConstantFunctions.getTypeColor(forType: item.type ?? "movie")
    }
    
}

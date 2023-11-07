//
//  SearchDto.swift
//  OmdbApp
//
//  Created by Ali Çolak on 7.11.2023.
//

import UIKit

struct SearchItemDto: Codable {
    
    let item : SearchItemResponse

    var title: String {
        item.title
    }
    
    var year : String {
        item.year
    }
    
    var type : String {
        guard let firstCharacter = item.type.first else {
            return ""
        }
        return String(firstCharacter).uppercased() + item.type.dropFirst().lowercased()
    }
    
    var poster : String {
        if item.poster == AppConstants.notAvaliableApiText {
            return AppConstants.noImageUrl
        } else {
            return item.poster
        }
    }
    
    var imdbId: String {
        item.imdbID
    }
    
    var typeColor : UIColor {
        AppConstantFunctions.getTypeColor(forType: item.type)
    }
    
}

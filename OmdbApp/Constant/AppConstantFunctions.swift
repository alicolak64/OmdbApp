//
//  AppConstantFunctions.swift
//  OmdbApp
//
//  Created by Ali Çolak on 7.11.2023.
//

import UIKit

struct AppConstantFunctions {
    static func getTypeColor(forType type: String) -> UIColor {
        switch type {
        case AppConstants.movieTypeText:
            return AppColors.filmTypeColor!
        case AppConstants.seriesTypeText:
            return AppColors.seriesTypeColor!
        case AppConstants.episodeTypeText:
            return AppColors.episodeTypeColor!
        default:
            return AppColors.blackColor!
        }
    }
    static func isSuccessResponse(response : SearchResponse) -> Bool {
        if response.response == "True" {
            return true
        } else {
            return false
        }
    }
}

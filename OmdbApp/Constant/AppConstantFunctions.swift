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
        case AppTexts.movieTypeText:
            return AppColors.filmTypeColor!
        case AppTexts.seriesTypeText:
            return AppColors.seriesTypeColor!
        case AppTexts.episodeTypeText:
            return AppColors.episodeTypeColor!
        case AppTexts.gameTypeText:
            return AppColors.gameTypeColor!
        default:
            return AppColors.blackColor!
        }
    }
    static func isSuccessResponse(response: SearchResponse) -> Bool {
        if response.response == "True" {
            return true
        } else {
            return false
        }
    }
}

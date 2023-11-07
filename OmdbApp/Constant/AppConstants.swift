//
//  AppConstants.swift
//  OmdbApp
//
//  Created by Ali Çolak on 7.11.2023.
//

import UIKit

struct AppConstants {
    static let deviceWidth = UIScreen.main.bounds.width
    static let deviceHeight = UIScreen.main.bounds.height
    static let infinityScrollPercentage = 0.8
    static let infinityScrollLateLimitSecond = 1.0
    static let apiKey = "949f41fa"
    static let baseUrl = "https://www.omdbapi.com/?&apikey=" + apiKey
    static let searchQuery = "&page="
    static let pageQuery = "&s="
    static let imdbQuery = "&i="
}

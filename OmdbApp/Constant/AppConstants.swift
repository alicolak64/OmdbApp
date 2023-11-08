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
    static let pageSize = 10
    static let apiKey = "949f41fa"
    static let baseUrl = "https://www.omdbapi.com/?&apikey=" + apiKey
    static let pageQuery = "&page="
    static let searchQuery = "&s="
    static let imdbQuery = "&i="
    static let initalSearch = "batman"
    static let noImageUrl = "https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg"
    static let notAvaliableApiText = "N/A"
    static let movieTypeText = "movie"
    static let seriesTypeText = "series"
    static let episodeTypeText = "episode"
    static let gameTypeText = "game"

}

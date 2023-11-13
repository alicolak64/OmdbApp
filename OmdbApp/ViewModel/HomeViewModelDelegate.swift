//
//  HomeViewModelDelegate.swift
//  OmdbApp
//
//  Created by Ali Çolak on 7.11.2023.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject{
    func updateSearchItems(searchItems: [SearchItemDto])
    func updateErrorText(text: String)
}

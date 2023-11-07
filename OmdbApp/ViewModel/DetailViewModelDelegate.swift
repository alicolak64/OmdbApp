//
//  DetailViewModelDelegate.swift
//  OmdbApp
//
//  Created by Ali Çolak on 7.11.2023.
//

import Foundation

protocol DetailViewModelDelegate : AnyObject {
    func updateItem(item: DetailItemDto)
}

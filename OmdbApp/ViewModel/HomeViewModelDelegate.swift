//
//  HomeViewModelDelegate.swift
//  OmdbApp
//
//  Created by Ali Çolak on 7.11.2023.
//

import UIKit

protocol HomeViewModelDelegate: AnyObject{
    func showCollectionView()
    func hideCollectionView()
    func reloadCollectionView()
    func updateErrorText(text: String)
    func closeKeyboard()
    func navigateDetailPage(destinationVC: UIViewController)
}

//
//  MockHomeViewOutput.swift
//  OmdbAppTests
//
//  Created by Ali Çolak on 13.11.2023.
//

import XCTest
@testable import OmdbApp

final class MockHomeViewOutput: HomeViewModelDelegate {
    
    var isInvokeShowCollectionView = false
    var invokeShowCollectionViewCount = 0
    func showCollectionView() {
        self.isInvokeShowCollectionView = true
        self.invokeShowCollectionViewCount += 1
    }
    
    
    var isInvokeHideCollectionView = false
    var invokeHideCollectionViewCount = 0
    func hideCollectionView() {
        isInvokeHideCollectionView = true
        invokeHideCollectionViewCount += 1
    }
    
    var isInvokeReloadCollectionView = false
    var invokeReloadCollectionViewCount = 0
    func reloadCollectionView() {
        self.isInvokeReloadCollectionView = true
        self.invokeReloadCollectionViewCount += 1
    }
    
    var isInvokeNavigateDetailPage = false
    var invokeNavigateDetailPageCount = 0
    func navigateDetailPage(destinationVC: UIViewController) {
        self.isInvokeNavigateDetailPage = true
        self.invokeNavigateDetailPageCount += 1
    }
    
    var errorText: String = ""
    var invokeUpdateErrorTextCount = 0
    func updateErrorText(text: String) {
        self.errorText = text
        self.invokeUpdateErrorTextCount += 1
    }
    
    func closeKeyboard() {
        
    }
    
}

//
//  MockDetailViewOutput.swift
//  OmdbAppTests
//
//  Created by Ali Çolak on 13.11.2023.
//

import XCTest
@testable import OmdbApp

final class MockDetailViewOutput: DetailViewModelDelegate {
    
    var isInvokeShowBackItemButton = false
    var invokeShowBackItemButtonCount = 0
    func showBackItemButton() {
        self.isInvokeShowBackItemButton = true
        self.invokeShowBackItemButtonCount += 1
    }
    
    var isInvokeShowNextItemButton = false
    var invokeShowNextItemButtonCount = 0
    func showNextItemButton() {
        self.isInvokeShowNextItemButton = true
        self.invokeShowNextItemButtonCount += 1
    }
    
    var isInvokeHideBackItemButton = false
    var invokeHideBackItemButtonCount = 0
    func hideBackItemButton() {
        self.isInvokeHideBackItemButton = true
        self.invokeHideBackItemButtonCount += 1
    }
    
    var isInvokeHideNextItemButton = false
    var invokeHideNextItemButtonCount = 0
    func hideNextItemButton() {
        self.isInvokeHideNextItemButton = true
        self.invokeHideNextItemButtonCount += 1
    }
    
    var item: DetailItemDto?
    
    func updateItem(item: OmdbApp.DetailItemDto) {
        self.item = item
    }
    
    
}

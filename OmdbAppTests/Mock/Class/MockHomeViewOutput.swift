//
//  MockHomeViewOutput.swift
//  OmdbAppTests
//
//  Created by Ali Çolak on 13.11.2023.
//

import XCTest
@testable import OmdbApp

class MockHomeViewOutput : HomeViewModelDelegate {
   

    var items : [SearchItemDto] = []
    var errorText : String = ""
    
    func updateSearchItems(searchItems: [OmdbApp.SearchItemDto]) {
        self.items = searchItems
    }
    
    func updateErrorText(text: String) {
        self.errorText = text
    }
    
}

//
//  ViewController.swift
//  OmdbApp
//
//  Created by Ali Çolak on 7.11.2023.
//

import UIKit

class HomeViewController: UIViewController, HomeViewModelDelegate {
    
    let viewModel : HomeViewModel
    
    var items : [SearchItemDto] = []
    
    var lastRequestTime: Date?
    
    init(viewModel : HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
    }
    
    override func viewDidLayoutSubviews() {
        //setConstraints()
    }
    
    func updateSearchResults(searchItems: [SearchItemDto]) {
        //print(searchItems)
    }


}


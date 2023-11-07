//
//  DetailViewController.swift
//  OmdbApp
//
//  Created by Ali Çolak on 7.11.2023.
//


import UIKit
import Kingfisher

class DetailViewController: UIViewController, DetailViewModelDelegate {
    
    
    
    let viewModel : DetailViewModel
    
    var item : DetailItemDto?
    var itemImdbId : Int?
    var items : [DetailItemDto] = []
    
    var currentItemIndex : Int?
    
    init(viewModel : DetailViewModel) {
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
        self.viewModel.getItem(imdbId: "tt3896198")
    }
    
    override func viewDidLayoutSubviews() {
        //setConstraints()
    }
    
    func updateItem(item: DetailItemDto) {
        //print(item)
    }
    
}

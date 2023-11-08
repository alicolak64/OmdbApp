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
    
    
    lazy var searchBar : UISearchBar = {
        
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.searchBarStyle = .minimal
        searchBar.searchTextField.backgroundColor = AppColors.whiteColor
        searchBar.delegate = self
        
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .font: AppFonts.placeholderFont ,
            .foregroundColor: AppColors.placeHolderColor ?? UIColor.darkGray
        ]
        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: AppTexts.searchBarPlaceholderText, attributes: placeholderAttributes)
        searchBar.searchTextField.layer.cornerRadius = 16
        searchBar.searchTextField.layer.masksToBounds = true
        searchBar.searchTextField.autocapitalizationType = .none
        
        searchBar.searchTextField.text = AppConstants.initalSearch
        
        
        return searchBar
        
    }()
    
    let whiteView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = AppColors.blackColor
        view.layer.cornerRadius = 10
        view.layer.shadowColor = UIColor.gray.cgColor
        return view
    }()
    
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: AppConstants.deviceWidth * 0.9, height: AppConstants.deviceWidth * 0.6)
        layout.minimumInteritemSpacing = 10
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = AppColors.blackColor
        
        return collectionView
    }()
    
    var errorLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = AppColors.appMainColor
        label.isHidden = true
        label.font = AppFonts.titleFont
        return label
    }()
    
    
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
        view.backgroundColor = AppColors.blackColor
        initalConfig()
    }
    
    override func viewDidLayoutSubviews() {
        setConstraints()
    }
    
    func updateSearchItems(searchItems: [SearchItemDto]) {
        DispatchQueue.main.async {
            self.errorLabel.isHidden = true
            self.collectionView.isHidden = false
        }
        
        self.items = searchItems
        
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func movieNotFound() {
        DispatchQueue.main.async {
            self.errorLabel.text = AppTexts.movieNotFoundErrorText
            self.collectionView.isHidden = true
            self.errorLabel.isHidden = false
        }
        
    }
    
    
}


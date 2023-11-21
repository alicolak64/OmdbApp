//
//  ViewController.swift
//  OmdbApp
//
//  Created by Ali Çolak on 7.11.2023.
//

import UIKit

final class HomeViewController: UIViewController  {
    
    private lazy var viewModel = HomeViewModel(delegate: self)
    
    private lazy var navigationBarLogo: UIBarButtonItem = {
        let logoImage = AppIcons.appLogo?.resized(toSize: CGSize(width: 32, height: 32)).withTintColor(AppColors.appMainColor!, renderingMode: .alwaysOriginal)
        let barLogo = UIBarButtonItem(image: logoImage, style: .plain, target: self, action: nil)
        return barLogo
    }()
    
    private lazy var navigationBarTitle: UIBarButtonItem = {
        let appTitle = UIBarButtonItem(title: AppTexts.appName, style: .plain, target: self, action: nil)
        appTitle.setTitleTextAttributes([.foregroundColor: AppColors.appMainColor!, .font: AppFonts.titleBoldFont ], for: .normal)
        return appTitle
    }()
    
    private lazy var searchBar: UISearchBar = {
        
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
        
        return searchBar
        
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = AppColors.blackColor
        view.layer.cornerRadius = 10
        view.layer.shadowColor = UIColor.gray.cgColor
        return view
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: AppConstants.deviceWidth * 0.9, height: AppConstants.deviceWidth * 0.6)
        layout.minimumInteritemSpacing = 10
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = AppColors.blackColor
        collectionView.accessibilityIdentifier = "OmdbApp.HomeView.collectionView"
        
        return collectionView
    }()
    
    private let errorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = AppColors.appMainColor
        label.isHidden = false
        label.text = AppTexts.pleaseSearchMovieText
        label.font = AppFonts.titleFont
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColors.blackColor
        initalConfig()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setConstraints()
    }
    
}

extension HomeViewController {
    
    private func initalConfig() {
        
        self.navigationController?.navigationBar.topItem?.leftBarButtonItems = [navigationBarLogo,navigationBarTitle]
        
        
        contentView.addSubviews([collectionView,errorLabel])
        view.addSubviews([searchBar,contentView])
        
        collectionView.delegate = self.viewModel
        collectionView.dataSource = self.viewModel
        collectionView.register(SearchCell.self, forCellWithReuseIdentifier: SearchCell.identifier)
        
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            
            searchBar.topAnchor.constraint(equalTo: (navigationController?.navigationBar.bottomAnchor)!,constant: 15),
            searchBar.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 10),
            searchBar.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -10),
            
            contentView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 5),
            contentView.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 10),
            contentView.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -10),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -10),
            
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            errorLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            errorLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
        ])
        
    }
    
}

extension HomeViewController: HomeViewModelDelegate {
    
    func reloadCollectionView() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func showCollectionView() {
        DispatchQueue.main.async {
            self.errorLabel.isHidden = true
            self.collectionView.isHidden = false
        }
    }
    
    func hideCollectionView() {
        DispatchQueue.main.async {
            self.collectionView.isHidden = true
            self.errorLabel.isHidden = false
        }
    }
    
    func updateErrorText(text: String) {
        DispatchQueue.main.async {
            self.errorLabel.text = text
        }
    }
    
    func closeKeyboard() {
        closeSearchResignFirstResponder()
    }
    
    func navigateDetailPage(destinationVC: UIViewController) {
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
}

extension HomeViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if let searchedText = searchBar.text {
            let searchedLowerText = searchedText.lowercased()
            viewModel.searchItems(text: searchedLowerText)
        }
    }
    
    func closeSearchResignFirstResponder() {
        searchBar.resignFirstResponder()
    }
    
}


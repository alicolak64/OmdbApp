//
//  HomeViewControllerExtension.swift
//  OmdbApp
//
//  Created by Ali Çolak on 8.11.2023.
//

import UIKit

extension HomeViewController {
    
    func initalConfig() {
        
        let logoImage = AppIcons.appLogo?.resized(toSize: CGSize(width: 32, height: 32)).withTintColor(AppColors.appMainColor!, renderingMode: .alwaysOriginal)
        let barLogo = UIBarButtonItem(image: logoImage, style: .plain, target: self, action: nil)
        let appTitle = UIBarButtonItem(title: AppTexts.appName, style: .plain, target: self, action: nil)
        
        appTitle.setTitleTextAttributes([.foregroundColor : AppColors.appMainColor!, .font : AppFonts.titleBoldFont ], for: .normal)
        
        navigationController?.navigationBar.topItem?.leftBarButtonItems = [barLogo,appTitle]
        
        whiteView.addSubview(collectionView)
        whiteView.addSubview(errorLabel)
        view.addSubviews([searchBar,whiteView])
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(SearchCell.self, forCellWithReuseIdentifier: SearchCell.identifier)
        
    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
            
            searchBar.topAnchor.constraint(equalTo: (navigationController?.navigationBar.bottomAnchor)!,constant: 15),
            searchBar.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 10),
            searchBar.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -10),
            
            whiteView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 5),
            whiteView.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 10),
            whiteView.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -10),
            whiteView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -10),
            
            collectionView.topAnchor.constraint(equalTo: whiteView.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: whiteView.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: whiteView.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor),
            
            errorLabel.centerXAnchor.constraint(equalTo: whiteView.centerXAnchor),
            errorLabel.centerYAnchor.constraint(equalTo: whiteView.centerYAnchor),
            
        ])
        
    }
    
}


extension HomeViewController : UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if let searchedText = searchBar.text {
            if searchedText.count < 3 {
                DispatchQueue.main.async {
                    self.errorLabel.text = AppTexts.characterErrorText
                    self.collectionView.isHidden = true
                    self.errorLabel.isHidden = false
                }
            } else {
                let searchedLowerText = searchedText.lowercased()
                viewModel.searchItems(text: searchedLowerText)
            }
        }
    }
    func closeSearchResignFirstResponder() {
        searchBar.resignFirstResponder()
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCell.identifier, for: indexPath) as! SearchCell
        
        cell.configure(with: items[indexPath.row])
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        closeSearchResignFirstResponder()
        
        let contentHeight = scrollView.contentSize.height
        let visibleHeight = scrollView.bounds.height
        let scrollOffset = scrollView.contentOffset.y
        
        let scrollPercentage = (scrollOffset + visibleHeight) / contentHeight
        
        if scrollPercentage >= AppConstants.infinityScrollPercentage {
            
            let now = Date()
            if let lastRequestTime = lastRequestTime, now.timeIntervalSince(lastRequestTime) < AppConstants.infinityScrollLateLimitSecond {
                return
            }
            
            viewModel.getNextPageItems()
            
            self.lastRequestTime = now
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let imdbId = items[indexPath.row].imdbId
        let service : OmdbService = OmdbManager()
        let destinationViewModel = DetailViewModel(omdbService: service)
        let destinationVC = DetailViewController(viewModel: destinationViewModel)
        destinationVC.itemImdbId = imdbId
        destinationVC.items = items
        
        closeSearchResignFirstResponder()
        
        navigationController?.pushViewController(destinationVC, animated: true)
        
    }
    
    
}

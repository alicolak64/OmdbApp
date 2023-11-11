//
//  DetailViewControllerExtension.swift
//  OmdbApp
//
//  Created by Ali Çolak on 8.11.2023.
//

import UIKit

extension DetailViewController {
    
    
    func initialConfig() {
        
        let backButton = UIButton(type: .custom)
        
        let arrowImage = AppIcons.arrowBackIcon?.withTintColor(AppColors.whiteColor!)
        backButton.setImage(arrowImage, for: .normal)
        backButton.accessibilityIdentifier = "backButton"
        
        backButton.addTarget(self, action: #selector(backPreviousScreenButtonTapped), for: .touchUpInside)
        
        let backButtonItem = UIBarButtonItem(customView: backButton)
        self.navigationItem.leftBarButtonItem = backButtonItem
        
        view.addSubview(itemImage)
        
        view.addSubview(backItemButton)
        view.addSubview(nextItemButton)
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
        contentView.addSubview(itemNameLabel)
        
        contentView.addSubview(imdbRatingIcon)
        contentView.addSubview(imdbRatingLabel)
        
        contentView.addSubview(itemTypeContainerView)
        itemTypeContainerView.addSubview(itemTypeLabel)
        
        contentView.addSubview(genreCollectionView)
        
        contentView.addSubview(lengthTitleLabel)
        contentView.addSubview(languageTitleLabel)
        contentView.addSubview(ratingTitleLabel)
        contentView.addSubview(releasedTitleLabel)

        contentView.addSubview(lengthValueLabel)
        contentView.addSubview(languageValueLabel)
        contentView.addSubview(ratingValueLabel)
        contentView.addSubview(releasedValueLabel)
        
        contentView.addSubview(descriptionTitleLabel)
        contentView.addSubview(descriptionValueLabel)
        
        contentView.addSubview(countryTitleLabel)
        contentView.addSubview(countryValueLabel)
        
        contentView.addSubview(directorTitleLabel)
        contentView.addSubview(directorValueLabel)
        
        contentView.addSubview(writerTitleLabel)
        contentView.addSubview(writerValueLabel)
        
        contentView.addSubview(actorTitleLabel)
        contentView.addSubview(actorValueLabel)
        
        contentView.addSubview(awardTitleLabel)
        contentView.addSubview(awardValueLabel)
        
        contentView.addSubview(imdbVotesTitleLabel)
        contentView.addSubview(imdbVotesValueLabel)
        
        contentView.addSubview(boxOfficesTitleLabel)
        contentView.addSubview(boxOfficesValueLabel)
        
        contentView.addSubview(ratingsTitleLabel)
        contentView.addSubview(ratingCollectionView)


        genreCollectionView.delegate = self
        genreCollectionView.dataSource = self
        genreCollectionView.register(GenreCell.self, forCellWithReuseIdentifier: GenreCell.identifier)
        
        ratingCollectionView.delegate = self
        ratingCollectionView.dataSource = self
        ratingCollectionView.register(RatingCell.self, forCellWithReuseIdentifier: RatingCell.identifier)
                
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            
            itemImage.topAnchor.constraint(equalTo: view.topAnchor),
            itemImage.leftAnchor.constraint(equalTo: view.leftAnchor),
            itemImage.rightAnchor.constraint(equalTo: view.rightAnchor),
            itemImage.heightAnchor.constraint(equalToConstant: AppConstants.deviceWidth * 0.8),
            
            backItemButton.leftAnchor.constraint(equalTo: itemImage.leftAnchor, constant: 20),
            backItemButton.topAnchor.constraint(equalTo: itemImage.centerYAnchor),
            
            nextItemButton.rightAnchor.constraint(equalTo: itemImage.rightAnchor,constant: -20),
            nextItemButton.topAnchor.constraint(equalTo: itemImage.centerYAnchor),
            
            scrollView.topAnchor.constraint(equalTo: itemImage.bottomAnchor, constant: -50),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalToConstant: AppConstants.deviceHeight * 0.95),
            
            itemNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            itemNameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            itemNameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            
            imdbRatingIcon.topAnchor.constraint(equalTo: itemNameLabel.bottomAnchor, constant: 10),
            imdbRatingIcon.leftAnchor.constraint(equalTo: itemNameLabel.leftAnchor),
            
            imdbRatingLabel.topAnchor.constraint(equalTo: itemNameLabel.bottomAnchor, constant: 10),
            imdbRatingLabel.leftAnchor.constraint(equalTo: imdbRatingIcon.rightAnchor, constant: 3),
            
            itemTypeContainerView.topAnchor.constraint(equalTo: itemNameLabel.bottomAnchor, constant: 10),
            itemTypeContainerView.rightAnchor.constraint(equalTo: itemNameLabel.rightAnchor, constant: -20),
            itemTypeContainerView.heightAnchor.constraint(equalToConstant: 20),
            itemTypeContainerView.widthAnchor.constraint(equalToConstant: 60),
            
            itemTypeLabel.topAnchor.constraint(equalTo: itemTypeContainerView.topAnchor),
            itemTypeLabel.leftAnchor.constraint(equalTo: itemTypeContainerView.leftAnchor, constant: 8),
            
            genreCollectionView.topAnchor.constraint(equalTo: imdbRatingIcon.bottomAnchor, constant: 25),
            genreCollectionView.leftAnchor.constraint(equalTo: itemNameLabel.leftAnchor),
            genreCollectionView.rightAnchor.constraint(equalTo: itemNameLabel.rightAnchor),
            genreCollectionView.heightAnchor.constraint(equalToConstant: AppConstants.deviceWidth * 0.09),
            
            
            lengthTitleLabel.topAnchor.constraint(equalTo: genreCollectionView.bottomAnchor, constant: 20),
            lengthTitleLabel.leftAnchor.constraint(equalTo: itemNameLabel.leftAnchor),
            
            languageTitleLabel.topAnchor.constraint(equalTo: genreCollectionView.bottomAnchor, constant: 20),
            languageTitleLabel.leftAnchor.constraint(equalTo: lengthTitleLabel.rightAnchor, constant: 35),
            
            ratingTitleLabel.topAnchor.constraint(equalTo: genreCollectionView.bottomAnchor, constant: 20),
            ratingTitleLabel.leftAnchor.constraint(equalTo: languageTitleLabel.rightAnchor, constant: 35),
            
            releasedTitleLabel.topAnchor.constraint(equalTo: genreCollectionView.bottomAnchor, constant: 20),
            releasedTitleLabel.leftAnchor.constraint(equalTo: ratingTitleLabel.rightAnchor, constant: 35),
            
            
            lengthValueLabel.topAnchor.constraint(equalTo: lengthTitleLabel.bottomAnchor, constant: 3),
            lengthValueLabel.leftAnchor.constraint(equalTo: lengthTitleLabel.leftAnchor),
            
            languageValueLabel.topAnchor.constraint(equalTo: languageTitleLabel.bottomAnchor, constant: 3),
            languageValueLabel.leftAnchor.constraint(equalTo: languageTitleLabel.leftAnchor),
            
            ratingValueLabel.topAnchor.constraint(equalTo: ratingTitleLabel.bottomAnchor, constant: 3),
            ratingValueLabel.leftAnchor.constraint(equalTo: ratingTitleLabel.leftAnchor),
            
            releasedValueLabel.topAnchor.constraint(equalTo: releasedTitleLabel.bottomAnchor, constant: 3),
            releasedValueLabel.leftAnchor.constraint(equalTo: releasedTitleLabel.leftAnchor),
            
            descriptionTitleLabel.topAnchor.constraint(equalTo: languageValueLabel.bottomAnchor, constant: 20),
            descriptionTitleLabel.leftAnchor.constraint(equalTo: itemNameLabel.leftAnchor),
            
            descriptionTitleLabel.topAnchor.constraint(equalTo: languageValueLabel.bottomAnchor, constant: 20),
            descriptionTitleLabel.leftAnchor.constraint(equalTo: itemNameLabel.leftAnchor),
            
            descriptionValueLabel.topAnchor.constraint(equalTo: descriptionTitleLabel.bottomAnchor, constant: 10),
            descriptionValueLabel.leftAnchor.constraint(equalTo: itemNameLabel.leftAnchor),
            descriptionValueLabel.rightAnchor.constraint(equalTo: itemNameLabel.rightAnchor),

            countryTitleLabel.topAnchor.constraint(equalTo: descriptionValueLabel.bottomAnchor, constant: 20),
            countryTitleLabel.leftAnchor.constraint(equalTo: itemNameLabel.leftAnchor),
            
            countryValueLabel.topAnchor.constraint(equalTo: descriptionValueLabel.bottomAnchor, constant: 20),
            countryValueLabel.leftAnchor.constraint(equalTo: countryTitleLabel.rightAnchor, constant: 10),
            countryValueLabel.rightAnchor.constraint(equalTo: itemNameLabel.rightAnchor),
            
            directorTitleLabel.topAnchor.constraint(equalTo: countryValueLabel.bottomAnchor, constant: 10),
            directorTitleLabel.leftAnchor.constraint(equalTo: itemNameLabel.leftAnchor),
            
            directorValueLabel.topAnchor.constraint(equalTo: countryValueLabel.bottomAnchor, constant: 10),
            directorValueLabel.leftAnchor.constraint(equalTo: directorTitleLabel.rightAnchor, constant: 10),
            directorValueLabel.rightAnchor.constraint(equalTo: itemNameLabel.rightAnchor),
            
            
            writerTitleLabel.topAnchor.constraint(equalTo: directorValueLabel.bottomAnchor, constant: 10),
            writerTitleLabel.leftAnchor.constraint(equalTo: itemNameLabel.leftAnchor),
            
            writerValueLabel.topAnchor.constraint(equalTo: directorValueLabel.bottomAnchor, constant: 10),
            writerValueLabel.leftAnchor.constraint(equalTo: writerTitleLabel.rightAnchor, constant: 10),
            writerValueLabel.rightAnchor.constraint(equalTo: itemNameLabel.rightAnchor),
            
            actorTitleLabel.topAnchor.constraint(equalTo: writerValueLabel.bottomAnchor, constant: 10),
            actorTitleLabel.leftAnchor.constraint(equalTo: itemNameLabel.leftAnchor),
            
            actorValueLabel.topAnchor.constraint(equalTo: writerValueLabel.bottomAnchor, constant: 10),
            actorValueLabel.leftAnchor.constraint(equalTo: actorTitleLabel.rightAnchor, constant: 10),
            actorValueLabel.rightAnchor.constraint(equalTo: itemNameLabel.rightAnchor),
            
            
            awardTitleLabel.topAnchor.constraint(equalTo: actorValueLabel.bottomAnchor, constant: 10),
            awardTitleLabel.leftAnchor.constraint(equalTo: itemNameLabel.leftAnchor),
            
            awardValueLabel.topAnchor.constraint(equalTo: actorValueLabel.bottomAnchor, constant: 10),
            awardValueLabel.leftAnchor.constraint(equalTo: awardTitleLabel.rightAnchor, constant: 10),
            awardValueLabel.rightAnchor.constraint(equalTo: itemNameLabel.rightAnchor),
            
            
            imdbVotesTitleLabel.topAnchor.constraint(equalTo: awardValueLabel.bottomAnchor, constant: 10),
            imdbVotesTitleLabel.leftAnchor.constraint(equalTo: itemNameLabel.leftAnchor),
            
            imdbVotesValueLabel.topAnchor.constraint(equalTo: awardValueLabel.bottomAnchor, constant: 10),
            imdbVotesValueLabel.leftAnchor.constraint(equalTo: imdbVotesTitleLabel.rightAnchor, constant: 10),
            
            
            boxOfficesTitleLabel.topAnchor.constraint(equalTo: imdbVotesValueLabel.bottomAnchor, constant: 10),
            boxOfficesTitleLabel.leftAnchor.constraint(equalTo: itemNameLabel.leftAnchor),
            
            boxOfficesValueLabel.topAnchor.constraint(equalTo: imdbVotesValueLabel.bottomAnchor, constant: 10),
            boxOfficesValueLabel.leftAnchor.constraint(equalTo: boxOfficesTitleLabel.rightAnchor, constant: 10),
            
            ratingsTitleLabel.topAnchor.constraint(equalTo: boxOfficesValueLabel.bottomAnchor, constant: 25),
            ratingsTitleLabel.leftAnchor.constraint(equalTo: itemNameLabel.leftAnchor),
            
            ratingCollectionView.topAnchor.constraint(equalTo: ratingsTitleLabel.bottomAnchor, constant: 10),
            ratingCollectionView.leftAnchor.constraint(equalTo: itemNameLabel.leftAnchor),
            ratingCollectionView.rightAnchor.constraint(equalTo: itemNameLabel.rightAnchor),
            ratingCollectionView.heightAnchor.constraint(equalToConstant: AppConstants.deviceWidth * 0.2),
            
        ])
    }
    
    @objc func backPreviousScreenButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func backItemButtonTapped() {
                
        let previousImdbId = items[(currentItemIndex ?? 0) - 1].imdbId
        
        itemImdbId = previousImdbId
        
        self.viewModel.getItem(imdbId: itemImdbId!)
        
    }
    
    @objc func nextItemButtonTapped() {
                        
        let previousImdbId = items[(currentItemIndex ?? 0) + 1].imdbId
        
        itemImdbId = previousImdbId
        
        self.viewModel.getItem(imdbId: itemImdbId!)
    }
    
}

extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1 {
            return genres.count
        } else if collectionView.tag == 2 {
            return ratings.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GenreCell.identifier, for: indexPath) as! GenreCell
            
            cell.configure(with: genres[indexPath.row])
            
            return cell
        } else if collectionView.tag == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RatingCell.identifier, for: indexPath) as! RatingCell
            
            cell.configure(with: ratings[indexPath.row])
            
            return cell
        } else {
            return UICollectionViewCell()
        }
        
    }
    
}

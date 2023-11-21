//
//  DetailViewController.swift
//  OmdbApp
//
//  Created by Ali Çolak on 7.11.2023.
//


import UIKit
import Kingfisher

final class DetailViewController: UIViewController {
    
    private lazy var viewModel = DetailViewModel(delegate: self)
    
    private lazy var navigationBarBackButtonItem: UIBarButtonItem = {
        let backButton = UIButton(type: .custom)
        
        let arrowImage = AppIcons.arrowBackIcon?.withTintColor(AppColors.whiteColor!)
        backButton.setImage(arrowImage, for: .normal)
        backButton.accessibilityIdentifier = "backButton"
        
        backButton.addTarget(self, action: #selector(backPreviousScreenButtonTapped), for: .touchUpInside)
        
        let backButtonItem = UIBarButtonItem(customView: backButton)
        
        return backButtonItem
    }()
    
    private let itemImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.masksToBounds = true
        image.accessibilityIdentifier = "OmdbApp.DetailView.itemImage"
        return image
    }()
    
    private lazy var backItemButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(AppIcons.backMovieIcon, for: .normal)
        button.tintColor = AppColors.whiteColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(backItemButtonTapped), for: .touchUpInside)
        button.accessibilityIdentifier = "OmdbApp.DetailView.backItemButton"
        return button
    }()
    
    private lazy var nextItemButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(AppIcons.nextMovieIcon, for: .normal)
        button.tintColor = AppColors.whiteColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(nextItemButtonTapped), for: .touchUpInside)
        button.accessibilityIdentifier = "OmdbApp.DetailView.nextItemButton"
        return button
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.backgroundColor = AppColors.whiteColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let itemNameLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.regularBoldFont
        label.textColor = AppColors.blackColor
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "OmdbApp.DetailView.itemNameLabel"
        return label
    }()
    
    private let imdbRatingIcon: UIImageView = {
        let image = AppIcons.starIcon
        let imageView = UIImageView(image: image)
        imageView.tintColor = AppColors.appMainColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "OmdbApp.DetailView.imdbRatingIcon"
        return imageView
    }()
    
    private let imdbRatingLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = AppFonts.placeholderFont
        label.textColor = AppColors.placeHolderColor
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "OmdbApp.DetailView.imdbRatingLabel"
        return label
    }()
    
    private let itemTypeContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.accessibilityIdentifier = "OmdbApp.DetailView.itemTypeContainerView"
        return view
    }()
    
    private let itemTypeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = AppFonts.mediumFont
        label.textColor = AppColors.blackColor
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "OmdbApp.DetailView.itemTypeLabel"
        return label
    }()
    
    private let genreCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: AppConstants.deviceWidth * 0.18, height: AppConstants.deviceWidth * 0.08)
        layout.minimumInteritemSpacing = 3
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = AppColors.whiteColor
        collectionView.isScrollEnabled = false
        collectionView.tag = 1
        collectionView.accessibilityIdentifier = "OmdbApp.DetailView.genreCollectionView"
        
        
        return collectionView
    }()
    
    private let lengthTitleLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.mediumFont
        label.textColor = AppColors.placeHolderColor
        label.text = "Length"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "OmdbApp.DetailView.lengthTitleLabel"
        return label
    }()
    
    private let lengthValueLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.mediumFont
        label.textColor = AppColors.blackColor
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "OmdbApp.DetailView.lengthValueLabel"
        return label
    }()
    
    private let languageTitleLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.mediumFont
        label.textColor = AppColors.placeHolderColor
        label.text = "Language"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "OmdbApp.DetailView.languageTitleLabel"
        return label
    }()
    
    private let languageValueLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.mediumFont
        label.textColor = AppColors.blackColor
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "OmdbApp.DetailView.languageValueLabel"
        return label
    }()
    
    private let ratingTitleLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.mediumFont
        label.textColor = AppColors.placeHolderColor
        label.text = "Rating"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "OmdbApp.DetailView.ratingTitleLabel"
        return label
    }()
    
    private let ratingValueLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.mediumFont
        label.textColor = AppColors.blackColor
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "OmdbApp.DetailView.ratingValueLabel"
        return label
    }()
    
    private let releasedTitleLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.mediumFont
        label.textColor = AppColors.placeHolderColor
        label.text = "Released"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "OmdbApp.DetailView.releasedTitleLabel"
        return label
    }()
    
    private let releasedValueLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.mediumFont
        label.textColor = AppColors.blackColor
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "OmdbApp.DetailView.releasedValueLabel"
        return label
    }()
    
    private let descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.regularBoldFont
        label.textColor = AppColors.blackColor
        label.text = "Description"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "OmdbApp.DetailView.descriptionTitleLabel"
        return label
    }()
    
    private let descriptionValueLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.mediumFont
        label.textColor = AppColors.placeHolderColor
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "OmdbApp.DetailView.descriptionValueLabel"
        return label
    }()
    
    private let countryTitleLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.largeFont
        label.textColor = AppColors.blackColor
        label.text = "Country:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "OmdbApp.DetailView.countryTitleLabel"
        return label
    }()
    
    private let countryValueLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.largeFont
        label.textColor = AppColors.placeHolderColor
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "OmdbApp.DetailView.countryValueLabel"
        return label
    }()
    
    private let directorTitleLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.largeFont
        label.textColor = AppColors.blackColor
        label.text = "Director:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "OmdbApp.DetailView.directorTitleLabel"
        return label
    }()
    
    private let directorValueLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.largeFont
        label.textColor = AppColors.placeHolderColor
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "OmdbApp.DetailView.directorValueLabel"
        return label
    }()
    
    private let writerTitleLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.largeFont
        label.textColor = AppColors.blackColor
        label.text = "Writer:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "OmdbApp.DetailView.writerTitleLabel"
        return label
    }()
    
    private let writerValueLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.largeFont
        label.textColor = AppColors.placeHolderColor
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "OmdbApp.DetailView.writerValueLabel"
        return label
    }()
    
    private let actorTitleLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.largeFont
        label.textColor = AppColors.blackColor
        label.text = "Actor:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "OmdbApp.DetailView.actorTitleLabel"
        return label
    }()
    
    private let actorValueLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.largeFont
        label.textColor = AppColors.placeHolderColor
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "OmdbApp.DetailView.actorValueLabel"
        return label
    }()
    
    private let awardTitleLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.largeFont
        label.textColor = AppColors.blackColor
        label.text = "Award:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "OmdbApp.DetailView.awardTitleLabel"
        return label
    }()
    
    private let awardValueLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.largeFont
        label.textColor = AppColors.placeHolderColor
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "OmdbApp.DetailView.awardValueLabel"
        return label
    }()
    
    private let imdbVotesTitleLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.largeFont
        label.textColor = AppColors.blackColor
        label.text = "IMDb Votes:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "OmdbApp.DetailView.imdbVotesTitleLabel"
        return label
    }()
    
    private let imdbVotesValueLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.largeFont
        label.textColor = AppColors.placeHolderColor
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "OmdbApp.DetailView.imdbVotesValueLabel"
        return label
    }()
    
    private let boxOfficesTitleLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.largeFont
        label.textColor = AppColors.blackColor
        label.text = "Box Offices:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "OmdbApp.DetailView.boxOfficesTitleLabel"
        return label
    }()
    
    private let boxOfficesValueLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.largeFont
        label.textColor = AppColors.placeHolderColor
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "OmdbApp.DetailView.boxOfficesValueLabel"
        return label
    }()
    
    private let ratingsTitleLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.largeFont
        label.textColor = AppColors.blackColor
        label.text = "Ratings:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "OmdbApp.DetailView.ratingsTitleLabel"
        return label
    }()
    
    private let ratingCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: AppConstants.deviceWidth * 0.25, height: AppConstants.deviceWidth * 0.18)
        layout.minimumInteritemSpacing = 3
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = AppColors.whiteColor
        collectionView.tag = 2
        collectionView.accessibilityIdentifier = "OmdbApp.DetailView.ratingCollectionView"
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = AppColors.backgroundColor
        
        initialConfig()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setConstraints()
    }
    
    func getData(imdbId: String, items: [SearchItemDto]) {
        viewModel.setData(imdbId: imdbId, items: items)
    }
    
}

extension DetailViewController: DetailViewModelDelegate {
    
    func updateItem(item: DetailItemDto) {
        
        DispatchQueue.main.async { [weak self] in
            
            guard let self else {
                return
            }
            
            self.itemImage.kf.setImage(with: URL(string: item.poster))
            self.itemNameLabel.text = item.title
            self.imdbRatingLabel.text = item.imdbRating + "/10 IMDb"
            
            self.itemTypeLabel.text = item.type
            self.itemTypeContainerView.backgroundColor = item.typeColor
            
            self.genreCollectionView.reloadData()
            
            self.lengthValueLabel.text = item.runtime
            self.languageValueLabel.text = item.language.components(separatedBy: ", ").joined(separator: "\n")
            self.ratingValueLabel.text = item.rated
            self.releasedValueLabel.text = item.released
            
            self.descriptionValueLabel.text = item.plot
            
            self.countryValueLabel.text = item.country
            self.directorValueLabel.text = item.director
            self.writerValueLabel.text = item.writer
            self.actorValueLabel.text = item.actors
            self.awardValueLabel.text = item.awards
            self.imdbVotesValueLabel.text = item.imdbVotes
            self.boxOfficesValueLabel.text = item.boxOffice
            
            self.ratingCollectionView.reloadData()
            
        }
        
    }
    
    func showBackItemButton() {
        DispatchQueue.main.async { [weak self] in
            self?.backItemButton.isHidden = false
        }
    }
    
    func showNextItemButton() {
        DispatchQueue.main.async { [weak self] in
            self?.nextItemButton.isHidden = false
        }
    }
    
    func hideBackItemButton() {
        DispatchQueue.main.async { [weak self] in
            self?.backItemButton.isHidden = true
        }
    }
    
    func hideNextItemButton() {
        DispatchQueue.main.async { [weak self] in
            self?.nextItemButton.isHidden = true
        }
    }
    
}

extension DetailViewController {
    
    
    private func initialConfig() {
        
        
        self.navigationItem.leftBarButtonItem = navigationBarBackButtonItem
        
        view.addSubviews([itemImage,backItemButton,nextItemButton,scrollView])
        
        scrollView.addSubview(contentView)
        
        contentView.addSubviews([itemNameLabel,imdbRatingIcon,imdbRatingLabel,itemTypeContainerView,itemTypeLabel,genreCollectionView,lengthTitleLabel,languageTitleLabel,ratingTitleLabel,releasedTitleLabel,lengthValueLabel,languageValueLabel,ratingValueLabel,releasedValueLabel,descriptionTitleLabel,descriptionValueLabel,countryTitleLabel,countryValueLabel,directorTitleLabel,directorValueLabel,writerTitleLabel,writerValueLabel,actorTitleLabel,actorValueLabel,awardTitleLabel,awardValueLabel,imdbVotesTitleLabel,imdbVotesValueLabel,boxOfficesTitleLabel,boxOfficesValueLabel,ratingsTitleLabel,ratingCollectionView])
        
        genreCollectionView.delegate = self.viewModel
        genreCollectionView.dataSource = self.viewModel
        genreCollectionView.register(GenreCell.self, forCellWithReuseIdentifier: GenreCell.identifier)
        
        ratingCollectionView.delegate = self.viewModel
        ratingCollectionView.dataSource = self.viewModel
        ratingCollectionView.register(RatingCell.self, forCellWithReuseIdentifier: RatingCell.identifier)
        
    }
    
    private func setConstraints() {
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
    
    @objc private func backPreviousScreenButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private  func backItemButtonTapped() {
        viewModel.getBackItem()
    }
    
    @objc private  func nextItemButtonTapped() {
        viewModel.getNextItem()
    }
    
}


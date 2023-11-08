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
    var itemImdbId : String?
    var items : [SearchItemDto] = []
    var genres : [String] = []
    var ratings: [RatingDto] = []
    
    var currentItemIndex : Int?
    
    let itemImage : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.masksToBounds = true
        return image
    }()
    
    lazy var backItemButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(AppIcons.backMovieIcon, for: .normal)
        button.tintColor = AppColors.whiteColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(backItemButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var nextItemButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(AppIcons.nextMovieIcon, for: .normal)
        button.tintColor = AppColors.whiteColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(nextItemButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let contentView : UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.backgroundColor = AppColors.whiteColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let itemNameLabel : UILabel = {
        let label = UILabel()
        label.font = AppFonts.regularBoldFont
        label.textColor = AppColors.blackColor
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imdbRatingIcon: UIImageView = {
        let image = AppIcons.starIcon
        let imageView = UIImageView(image: image)
        imageView.tintColor = AppColors.appMainColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let imdbRatingLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = AppFonts.placeholderFont
        label.textColor = AppColors.placeHolderColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let itemTypeContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        return view
    }()
    
    let itemTypeLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = AppFonts.mediumFont
        label.textColor = AppColors.blackColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let genreCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: AppConstants.deviceWidth * 0.18, height: AppConstants.deviceWidth * 0.08)
        layout.minimumInteritemSpacing = 3
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = AppColors.whiteColor
        collectionView.isScrollEnabled = false
        collectionView.tag = 1
        
        return collectionView
    }()
    
    let lengthTitleLabel : UILabel = {
        let label = UILabel()
        label.font = AppFonts.mediumFont
        label.textColor = AppColors.placeHolderColor
        label.text = "Lenght"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let lengthValueLabel : UILabel = {
        let label = UILabel()
        label.font = AppFonts.mediumFont
        label.textColor = AppColors.blackColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let languageTitleLabel : UILabel = {
        let label = UILabel()
        label.font = AppFonts.mediumFont
        label.textColor = AppColors.placeHolderColor
        label.text = "Language"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let languageValueLabel : UILabel = {
        let label = UILabel()
        label.font = AppFonts.mediumFont
        label.textColor = AppColors.blackColor
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let ratingTitleLabel : UILabel = {
        let label = UILabel()
        label.font = AppFonts.mediumFont
        label.textColor = AppColors.placeHolderColor
        label.text = "Rating"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let ratingValueLabel : UILabel = {
        let label = UILabel()
        label.font = AppFonts.mediumFont
        label.textColor = AppColors.blackColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let releasedTitleLabel : UILabel = {
        let label = UILabel()
        label.font = AppFonts.mediumFont
        label.textColor = AppColors.placeHolderColor
        label.text = "Released"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let releasedValueLabel : UILabel = {
        let label = UILabel()
        label.font = AppFonts.mediumFont
        label.textColor = AppColors.blackColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionTitleLabel : UILabel = {
        let label = UILabel()
        label.font = AppFonts.regularBoldFont
        label.textColor = AppColors.blackColor
        label.text = "Description"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionValueLabel : UILabel = {
        let label = UILabel()
        label.font = AppFonts.mediumFont
        label.textColor = AppColors.placeHolderColor
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let countryTitleLabel : UILabel = {
        let label = UILabel()
        label.font = AppFonts.largeFont
        label.textColor = AppColors.blackColor
        label.text = "Country:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let countryValueLabel : UILabel = {
        let label = UILabel()
        label.font = AppFonts.largeFont
        label.textColor = AppColors.placeHolderColor
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let directorTitleLabel : UILabel = {
        let label = UILabel()
        label.font = AppFonts.largeFont
        label.textColor = AppColors.blackColor
        label.text = "Director:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let directorValueLabel : UILabel = {
        let label = UILabel()
        label.font = AppFonts.largeFont
        label.textColor = AppColors.placeHolderColor
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let writerTitleLabel : UILabel = {
        let label = UILabel()
        label.font = AppFonts.largeFont
        label.textColor = AppColors.blackColor
        label.text = "Writer:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let writerValueLabel : UILabel = {
        let label = UILabel()
        label.font = AppFonts.largeFont
        label.textColor = AppColors.placeHolderColor
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let actorTitleLabel : UILabel = {
        let label = UILabel()
        label.font = AppFonts.largeFont
        label.textColor = AppColors.blackColor
        label.text = "Actor:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let actorValueLabel : UILabel = {
        let label = UILabel()
        label.font = AppFonts.largeFont
        label.textColor = AppColors.placeHolderColor
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let awardTitleLabel : UILabel = {
        let label = UILabel()
        label.font = AppFonts.largeFont
        label.textColor = AppColors.blackColor
        label.text = "Award:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let awardValueLabel : UILabel = {
        let label = UILabel()
        label.font = AppFonts.largeFont
        label.textColor = AppColors.placeHolderColor
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imdbVotesTitleLabel : UILabel = {
        let label = UILabel()
        label.font = AppFonts.largeFont
        label.textColor = AppColors.blackColor
        label.text = "IMDb Votes:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imdbVotesValueLabel : UILabel = {
        let label = UILabel()
        label.font = AppFonts.largeFont
        label.textColor = AppColors.placeHolderColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let boxOfficesTitleLabel : UILabel = {
        let label = UILabel()
        label.font = AppFonts.largeFont
        label.textColor = AppColors.blackColor
        label.text = "Box Offices:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let boxOfficesValueLabel : UILabel = {
        let label = UILabel()
        label.font = AppFonts.largeFont
        label.textColor = AppColors.placeHolderColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let ratingsTitleLabel : UILabel = {
        let label = UILabel()
        label.font = AppFonts.largeFont
        label.textColor = AppColors.blackColor
        label.text = "Ratings:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let ratingCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: AppConstants.deviceWidth * 0.25, height: AppConstants.deviceWidth * 0.18)
        layout.minimumInteritemSpacing = 3
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = AppColors.whiteColor
        collectionView.tag = 2
        
        return collectionView
    }()
    
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
        view.backgroundColor = AppColors.backgroundColor
        
        initialConfig()
        
        self.viewModel.getItem(imdbId: itemImdbId!)
        
    }
    
    override func viewDidLayoutSubviews() {
        setConstraints()
    }
    
    func updateItem(item: DetailItemDto) {
        
        self.item = item
        
        self.currentItemIndex = items.firstIndex(where: { $0.imdbId == itemImdbId })
                
        DispatchQueue.main.async { [weak self] in
            
            guard let self else {
                return
            }
            
            if (currentItemIndex == 0) {
                self.backItemButton.isHidden = true
            } else {
                self.backItemButton.isHidden = false
            }
            
            if (((currentItemIndex ?? 0) + 1) == items.count) {
                self.nextItemButton.isHidden = true
            } else {
                self.nextItemButton.isHidden = false
            }
            
            self.itemImage.kf.setImage(with: URL(string: item.poster))
            self.itemNameLabel.text = item.title
            self.imdbRatingLabel.text = item.imdbRating + "/10 IMDb"
            
            self.itemTypeLabel.text = item.type
            self.itemTypeContainerView.backgroundColor = item.typeColor
            
            self.genres = item.genre.components(separatedBy: ", ")
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
            
            self.ratings = item.ratings ?? []
            self.ratingCollectionView.reloadData()
            
        }
        
        
    }
    
}

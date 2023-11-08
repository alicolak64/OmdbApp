//
//  SearchCell.swift
//  OmdbApp
//
//  Created by Ali Çolak on 8.11.2023.
//

import UIKit
import Kingfisher


class SearchCell: UICollectionViewCell {
    
    static let identifier = "SearchCell"
    
    private let itemImage : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 15
        return image
    }()
    
    private let itemName : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = AppFonts.titleFont
        label.textColor = AppColors.blackColor
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let itemTypeContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        return view
    }()
    
    private let itemTypeLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = AppFonts.mediumFont
        label.textColor = AppColors.blackColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let itemyYearLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = AppFonts.placeholderFont
        label.textColor = AppColors.placeHolderColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.layer.masksToBounds = false
        contentView.backgroundColor = AppColors.whiteColor
        
        addCellComponents()
        setCellLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with item: SearchItemDto) {
        
        self.itemImage.kf.setImage(with: URL(string: item.poster))
        
        if item.title.count > 24 {
            let truncatedTitle = String(item.title.prefix(24)) + "..."
            self.itemName.text = truncatedTitle
        } else {
            self.itemName.text = item.title
        }
        
        self.itemTypeContainerView.backgroundColor = item.typeColor
        
        self.itemTypeLabel.text = item.type
        
        self.itemyYearLabel.text = item.year
    }
    
    func addCellComponents(){
        
        contentView.addSubview(itemImage)
        
        contentView.addSubview(itemName)
        
        contentView.addSubview(itemTypeContainerView)
        
        itemTypeContainerView.addSubview(itemTypeLabel)

        contentView.addSubview(itemyYearLabel)
        
    }
    
    
    func setCellLayouts(){
        
        NSLayoutConstraint.activate([
            
            itemImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            itemImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            itemImage.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            itemImage.heightAnchor.constraint(equalToConstant: contentView.frame.height * 0.6),
            
            itemName.topAnchor.constraint(equalTo: itemImage.bottomAnchor, constant: 15),
            itemName.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            
            itemTypeContainerView.topAnchor.constraint(equalTo: itemName.bottomAnchor, constant: 12),
            itemTypeContainerView.leftAnchor.constraint(equalTo: itemName.leftAnchor),
            itemTypeContainerView.heightAnchor.constraint(equalToConstant: 25),
            itemTypeContainerView.widthAnchor.constraint(equalToConstant: 60),
            
            itemTypeLabel.topAnchor.constraint(equalTo: itemName.bottomAnchor, constant: 15),
            itemTypeLabel.leftAnchor.constraint(equalTo: itemTypeContainerView.leftAnchor, constant: 8),
            
            itemyYearLabel.topAnchor.constraint(equalTo: itemName.bottomAnchor, constant: 15),
            itemyYearLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            
        ])
        
    }
    
}

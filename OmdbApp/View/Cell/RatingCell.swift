//
//  RatingCell.swift
//  OmdbApp
//
//  Created by Ali Çolak on 8.11.2023.
//

import UIKit

class RatingCell: UICollectionViewCell {
    
    static let identifier = "RatingCell"
    
    private let sourceLabel : UILabel = {
        let label = UILabel()
        label.font = AppFonts.mediumFont
        label.textColor = AppColors.placeHolderColor
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private let valueLabel : UILabel = {
        let label = UILabel()
        label.font = AppFonts.mediumFont
        label.textColor = AppColors.blackColor
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = AppColors.backgroundColor
        contentView.layer.cornerRadius = 15
        
        addCellComponents()
        
        setCellLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with rating: RatingDto) {
        
        self.sourceLabel.text = rating.source
        self.valueLabel.text = rating.value
    }
    
    func addCellComponents() {
        contentView.addSubview(sourceLabel)
        contentView.addSubview(valueLabel)
    }
    
    func setCellLayouts() {
        
        NSLayoutConstraint.activate([
            
            sourceLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            sourceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            sourceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            valueLabel.topAnchor.constraint(equalTo: sourceLabel.bottomAnchor),
            valueLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            valueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            valueLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
        ])
    }
    
}

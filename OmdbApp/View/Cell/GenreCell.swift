//
//  GenreCell.swift
//  OmdbApp
//
//  Created by Ali Çolak on 8.11.2023.
//

import UIKit

final class GenreCell: UICollectionViewCell {
    
    static let identifier = "GenreCell"
    
    private let genreView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.genreViewColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = false
        view.layer.cornerRadius = 15
        return view
    }()
    
    private let genreNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = AppColors.genreTextColor
        label.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addCellComponents()
        
        setCellLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with genre: String) {
        self.genreNameLabel.text = genre
    }
    
    private func addCellComponents() {
        contentView.addSubview(genreView)
        genreView.addSubview(genreNameLabel)
    }
    
    private func setCellLayouts() {
        
        NSLayoutConstraint.activate([
            genreView.topAnchor.constraint(equalTo: topAnchor),
            genreView.leadingAnchor.constraint(equalTo: leadingAnchor),
            genreView.trailingAnchor.constraint(equalTo: trailingAnchor),
            genreView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            genreNameLabel.topAnchor.constraint(equalTo: topAnchor),
            genreNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            genreNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            genreNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
    }
    
}

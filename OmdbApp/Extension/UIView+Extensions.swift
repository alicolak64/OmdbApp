//
//  UIView+Extensions.swift
//  OmdbApp
//
//  Created by Ali Çolak on 15.11.2023.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]){
        views.forEach { view in
            self.addSubview(view)
        }
    }
}

//
//  UIImage+Extensions.swift
//  OmdbApp
//
//  Created by Ali Çolak on 15.11.2023.
//

import UIKit

extension UIImage {
    func resized(toSize newSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage ?? self
    }
}

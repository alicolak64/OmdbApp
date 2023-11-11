//
//  GeneralExtensions.swift
//  OmdbApp
//
//  Created by Ali Çolak on 7.11.2023.
//

import UIKit


extension UIColor {
    public convenience init?(hex: String, alpha: Double = 1.0) {
        var pureString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if pureString.hasPrefix("#") {
            pureString.remove(at: pureString.startIndex)
        }
        if pureString.count != 6 {
            return nil
        }
        let scanner = Scanner(string: pureString)
        var hexNumber: UInt64 = 0
        
        if scanner.scanHexInt64(&hexNumber) {
            self.init(
                red: CGFloat((hexNumber & 0xFF0000) >> 16) / 255.0,
                green: CGFloat((hexNumber & 0x00FF00) >> 8) / 255.0,
                blue: CGFloat(hexNumber & 0x0000FF) / 255.0,
                alpha: CGFloat(alpha)
            )
            return
        }
        return nil
    }
}

extension UIImage {
    func resized(toSize newSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage ?? self
    }
}



extension UIView {
    func addSubviews(_ views : [UIView]){
        views.forEach { view in
            addSubview(view)
        }
    }
}

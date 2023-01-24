//
//  Ext+UIColor.swift
//  AITourism
//
//  Created by Mekhriddin Jumaev on 21/01/23.
//

import UIKit

extension UIColor {
    class func short(red: Int, green: Int, blue: Int, alpha: Double = 1) -> UIColor {
        let r = CGFloat(red) / 255.0
        let g = CGFloat(green) / 255.0
        let b = CGFloat(blue) / 255.0
        let a = CGFloat(alpha)
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
    
    convenience init(hex hexFromString: String, alpha: CGFloat = 1.0) {
        var cString: String = hexFromString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        var rgbValue: UInt64 = 10066329
        
        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }
        
        if cString.count == 6 {
            Scanner(string: cString).scanHexInt64(&rgbValue)
        }
        
        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}


class CreateFlowLayout {
    
    static func createFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let with = view.bounds.width
        let padding: CGFloat = 15
        let minumumItemSpacing: CGFloat  = 10
        let availableWith = with - (padding * 2) - (minumumItemSpacing * 1)
        let itemWith = availableWith / 2
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 15
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWith, height: 360)
        return flowLayout
    }
}

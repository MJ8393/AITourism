//
//  Ext+UIViewController.swift
//  AITourism
//
//  Created by Mekhriddin Jumaev on 22/01/23.
//

import UIKit

extension UIViewController {
    func configureBackgroundColor(_ color: UIColor) {
        view.backgroundColor = color
    }
    func configureNavBar(_ title: String, _ isLargeTitle: Bool, _ backColor: UIColor, _ tintColor: UIColor) {
        self.title = title
        navigationController?.navigationBar.prefersLargeTitles = isLargeTitle
        navigationController?.backgroundColor(backgroundcolor: backColor, tintColor: tintColor)
    }
}

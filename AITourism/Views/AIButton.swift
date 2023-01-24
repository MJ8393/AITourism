//
//  File.swift
//  AITourism
//
//  Created by Mekhriddin Jumaev on 21/01/23.
//

import UIKit

class AIButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(backgroundColor: UIColor, title: String) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        setTitleColor(whiteColor, for: .normal)
        layer.cornerRadius = 25 
        titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
    }
}


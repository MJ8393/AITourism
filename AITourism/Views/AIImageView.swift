//
//  File.swift
//  AITourism
//
//  Created by Mekhriddin Jumaev on 21/01/23.
//

import UIKit

class AIImageView: UIImageView {
    
    init(image: UIImage) {
        super.init(frame: .zero)
        self.image = image
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        layer.cornerRadius  = 0
        clipsToBounds = true
        contentMode = .scaleAspectFill
    }
}

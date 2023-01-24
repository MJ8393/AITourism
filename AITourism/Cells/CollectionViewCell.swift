//
//  File.swift
//  AITourism
//
//  Created by Mekhriddin Jumaev on 22/01/23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let identifier = "cellID"
    
    lazy var animalImageView = AIImageView(image: UIImage(named: "question1")!)
    lazy var animalName = AILabel(text: "Lion", textColor: .black, textAlignment: .center, fontSize: 20, weight: .semibold)
    lazy var infoLabel = AILabel(text: "xxx", textColor: .black, textAlignment: .left, fontSize: 12, weight: .regular)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        addSubview()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        backgroundColor = .clear
        
        layer.cornerRadius = 8
        layer.borderColor = UIColor.black.withAlphaComponent(0.4).cgColor
        layer.borderWidth = 1
    }
    
    private func addSubview() {
        addSubview(animalImageView)
        addSubview(animalName)
        addSubview(infoLabel)
        animalImageView.contentMode = .scaleAspectFit
    }
    
    private func setConstraints() {
        animalImageView.snp.makeConstraints { make in
            make.top.equalTo(self).offset(10)
            make.leading.equalTo(self).offset(30)
            make.trailing.equalTo(self).offset(-30)
            make.height.equalTo(100)
        }
        
        animalName.snp.makeConstraints { make in
            make.left.right.equalTo(self)
            make.top.equalTo(animalImageView.snp.bottom).offset(5)
        }
        
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(animalName.snp.bottom).offset(10)
            make.leading.equalTo(self).offset(10)
            make.trailing.equalTo(self).offset(-10)
        }
    }
    
    func setAnimalImage(region: Region) {
        animalImageView.image = region.image
        animalName.text = region.name
        infoLabel.text = region.info
    }
    
}

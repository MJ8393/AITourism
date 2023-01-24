//
//  MainTableViewCell.swift
//  AITourism
//
//  Created by Mekhriddin Jumaev on 21/01/23.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    static let reuseID = "MainTableViewCell"
    
    lazy var questionLabel = AILabel(text: "Where is Uzbekistan?", textColor: .black, textAlignment: .left, fontSize: 22, weight: .semibold)
    
    lazy var arrayImageView = AIImageView(image: UIImage(named: "down-arrow")!)
    
    lazy var answerLabel = AILabel(text: "Uzbekistan lies at the core of the ancient Silk Road, it a country that is home to the three most important Silk Road cities, Samarkand, Bukhara, and Khiva. Uzbekistan's UNESCO World Heritage gem, the incredibly historic town of Samarkand is a melting pot of cultures from all over the world.", textColor: .black, textAlignment: .left, fontSize: 12, weight: .regular)
    
    lazy var answerImageView = AIImageView(image: UIImage(named: "question1")!)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setConstraints()
        clipsToBounds = true
        answerImageView.layer.borderWidth = 2
        answerImageView.layer.borderColor = UIColor.black.cgColor
        answerImageView.layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        contentView.addSubview(arrayImageView)
        contentView.addSubview(questionLabel)
        contentView.addSubview(answerImageView)
        contentView.addSubview(answerLabel)
    }
    
    func setContent(question: Question) {
        questionLabel.text = question.question
        answerLabel.text = question.answer
        answerImageView.image = question.image
    }
    
    private func setConstraints() {
        
        arrayImageView.snp.makeConstraints { make in
            make.trailing.equalTo(contentView).offset(-20)
            make.top.equalTo(contentView).offset(26)
            make.width.height.equalTo(18)
        }
        
        questionLabel.snp.makeConstraints { make in
            make.leading.equalTo(contentView).offset(20)
            make.centerY.equalTo(arrayImageView)
            make.trailing.equalTo(arrayImageView.snp.leading).offset(-20)
        }
        
        answerImageView.snp.makeConstraints { make in
            make.trailing.equalTo(contentView).offset(-20)
            make.top.equalTo(arrayImageView.snp.bottom).offset(26 + 10)
            make.height.equalTo(100 + 40)
            make.width.equalTo(150)
        }
        
        print(160 * UIScreen.main.bounds.height / 926)
        
        answerLabel.snp.makeConstraints { make in
            make.leading.equalTo(contentView).offset(20)
            make.trailing.equalTo(answerImageView.snp.leading).offset(-20)
            make.top.equalTo(answerImageView)
        }
        
    }
}

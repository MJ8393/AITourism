//
//  AITextField.swift
//  AITourism
//
//  Created by Mekhriddin Jumaev on 22/01/23.
//

import UIKit

class AITextField: UITextField {
    
    var icon = "envelope.fill"

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(icon: String) {
        super.init(frame: .zero)
        self.icon = icon
        self.layer.borderColor = UIColor.black.withAlphaComponent(0.4).cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 25
        self.autocorrectionType = .no
        self.layer.masksToBounds = false
        self.rightViewMode = .always
        self.font = .systemFont(ofSize: 18)
        if let view = profileView() {
            self.rightView = paddingRightIcon(view, 5)
        }
    }
    
    private func paddingRightIcon(_ view: UIView, _ padding: CGFloat) -> UIView {
        let contentView = UIView()
        contentView.backgroundColor = .clear
        contentView.addSubview(view)
        contentView.snp.makeConstraints { make in
            make.width.equalTo(40 + padding )
            make.height.equalTo(40 )
        }
        view.snp.makeConstraints { make in
            make.top.leading.bottom.equalTo(contentView)
            make.height.width.equalTo(40 )
        }
        return contentView
    }
    
    func profileView() -> UIView? {
        let btn = UIButton()
        btn.backgroundColor = mainColor.withAlphaComponent(0.2)
        btn.layer.cornerRadius = 20 
        btn.imageView?.contentMode = .scaleAspectFit
        btn.tintColor = mainColor
        btn.setImage(UIImage.init(systemName: icon)?.withTintColor(.red), for: .normal)
        return btn
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
}

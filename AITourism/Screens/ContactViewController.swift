//
//  ContactViewController.swift
//  AITourism
//
//  Created by Mekhriddin Jumaev on 21/01/23.
//

import UIKit

class ContactViewController: UIViewController {
    
    lazy var nameTextField = AITextField(icon: "person.fill")
    lazy var nameLabel = AILabel(text: "Your Name", textColor: .black, textAlignment: .center, fontSize: 11, weight: .regular)
    
    lazy var emailTextField = AITextField(icon: "envelope.fill")
    lazy var emailLabel = AILabel(text: "Email Address", textColor: .black, textAlignment: .center, fontSize: 11, weight: .regular)
    
    lazy var messageTextView: UITextView = {
        let textView = UITextView()
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.black.withAlphaComponent(0.4).cgColor
        textView.textAlignment = .left
        textView.layer.cornerRadius = 25
        textView.textContainerInset = UIEdgeInsets(top: 15, left: 20, bottom: 15, right: 20)
        textView.font = .systemFont(ofSize: 18)
        textView.autocorrectionType = .no
        textView.returnKeyType = .send
        textView.delegate = self
        return textView
    }()
    lazy var messageLabel = AILabel(text: "Your Message", textColor: .black, textAlignment: .center, fontSize: 11, weight: .regular)
    
    lazy var sendButton = AIButton(backgroundColor: mainColor, title: "Send Message")
    
    lazy var addressTitleLabel = AILabel(text: "Our address", textColor: .black, textAlignment: .left, fontSize: 25 * UIScreen.main.bounds.height / 926, weight: .semibold)
    lazy var streetLabel = AILabel(text: "123 Main Street", textColor: .black, textAlignment: .left, fontSize: 16 * UIScreen.main.bounds.height / 926, weight: .regular)
    lazy var cityLabel = AILabel(text: "City, State ZIP", textColor: .black, textAlignment: .left, fontSize: 16 * UIScreen.main.bounds.height / 926, weight: .regular)
    lazy var phoneLabel = AILabel(text: "Phone: 555-555-5555", textColor: .black, textAlignment: .left, fontSize: 16 * UIScreen.main.bounds.height / 926, weight: .regular)
    lazy var emailsLabel = AILabel(text: "Email: info@example.com", textColor: .black, textAlignment: .left, fontSize: 16 * UIScreen.main.bounds.height / 926, weight: .regular)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        addSubviews()
        setConstraints()
    }
    
    @objc func sendButtonTapped() {
        print(messageTextView.text!)
    }
    
    @objc private func viewPressed() {
        view.endEditing(true)
    }

    private func configureUI() {
        configureBackgroundColor(whiteColor)
        configureNavBar("Contact Us", true, mainColor, whiteColor)
        
        nameLabel.backgroundColor = .white
        emailLabel.backgroundColor = .white
        messageLabel.backgroundColor = .white
        nameTextField.delegate = self
        emailTextField.delegate = self
        sendButton.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(viewPressed)))
    }
    
    private func addSubviews() {
        view.addSubview(nameTextField)
        view.addSubview(nameLabel)
        
        view.addSubview(emailTextField)
        view.addSubview(emailLabel)
        
        view.addSubview(messageTextView)
        view.addSubview(messageLabel)
        
        view.addSubview(sendButton)
        
        view.addSubview(addressTitleLabel)
        view.addSubview(streetLabel)
        view.addSubview(cityLabel)
        view.addSubview(phoneLabel)
        view.addSubview(emailsLabel)
    }
    
    private func setConstraints() {
        nameTextField.snp.makeConstraints { make in
            make.leading.equalTo(view).offset(30)
            make.trailing.equalTo(view).offset(-30)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50 * UIScreen.main.bounds.height / 926)
            make.height.equalTo(50)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(nameTextField).offset(20 )
            make.width.equalTo(nameLabel.text!.width(withConstrainedHeight: 11, font: nameLabel.font) + 12)
            make.centerY.equalTo(nameTextField.snp.top)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.leading.equalTo(view).offset(30)
            make.trailing.equalTo(view).offset(-30)
            make.top.equalTo(nameTextField.snp.bottom).offset(20 * UIScreen.main.bounds.height / 926)
            make.height.equalTo(50)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.leading.equalTo(emailTextField).offset(20)
            make.width.equalTo(emailLabel.text!.width(withConstrainedHeight: 11, font: nameLabel.font) + 12)
            make.centerY.equalTo(emailTextField.snp.top)
        }
        
        messageTextView.snp.makeConstraints { make in
            make.leading.equalTo(view).offset(30)
            make.trailing.equalTo(view).offset(-30)
            make.top.equalTo(emailTextField.snp.bottom).offset(20 * UIScreen.main.bounds.height / 926)
            make.height.equalTo(120 * UIScreen.main.bounds.height / 926)
        }
        
        messageLabel.snp.makeConstraints { make in
            make.leading.equalTo(messageTextView).offset(20)
            make.width.equalTo(messageLabel.text!.width(withConstrainedHeight: 11, font: nameLabel.font) + 12)
            make.centerY.equalTo(messageTextView.snp.top)
        }
        
        sendButton.snp.makeConstraints { make in
            make.leading.trailing.equalTo(messageTextView)
            make.top.equalTo(messageTextView.snp.bottom).offset(20 * UIScreen.main.bounds.height / 926)
            make.height.equalTo(50)
        }
        
        addressTitleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(sendButton)
            make.top.equalTo(sendButton.snp.bottom).offset(60 * UIScreen.main.bounds.height / 926)
        }
        
        streetLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(sendButton)
            make.top.equalTo(addressTitleLabel.snp.bottom).offset(10 * UIScreen.main.bounds.height / 926)
        }
        
        cityLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(sendButton)
            make.top.equalTo(streetLabel.snp.bottom).offset(10 * UIScreen.main.bounds.height / 926)
        }
        
        phoneLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(sendButton)
            make.top.equalTo(cityLabel.snp.bottom).offset(10 * UIScreen.main.bounds.height / 926)
        }
        
        emailsLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(sendButton)
            make.top.equalTo(phoneLabel.snp.bottom).offset(10 * UIScreen.main.bounds.height / 926)
        }
    }
}

extension ContactViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField {
            emailTextField.becomeFirstResponder()
        } else if textField == emailTextField {
            messageTextView.becomeFirstResponder()
        } else {
            print("Send")
        }
        return true
    }
}

extension ContactViewController: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            print(messageTextView.text!)
            textView.endEditing(true)
            return false
        }
        return true
    }
}

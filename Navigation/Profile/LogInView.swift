//
//  LogInView.swift
//  Navigation
//
//  Created by Антон Зудинов on 23.02.2023.
//

import UIKit

class LogInView: UIView {
    
    private var logIn: String?
    private var password: String?
    private let buttonBackgoundColor = UIColor(patternImage: UIImage(named: "blue_pixel")!)
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let conentView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let logoImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logo")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private lazy var logInTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .systemGray6
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.placeholder = "Email or phone"
        textField.textColor = .black
        textField.clearButtonMode = .always
        textField.delegate = self
        textField.layer.cornerRadius = 10
        textField.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.addTarget(self, action: #selector(logInTextChanged), for: .editingChanged)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .systemGray6
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.placeholder = "Password"
        textField.textColor = .black
        textField.isSecureTextEntry = true
        textField.delegate = self
        textField.clearButtonMode = .always
        textField.layer.cornerRadius = 10
        textField.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.addTarget(self, action: #selector(passwordTextChanged), for: .editingChanged)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        return textField
    }()
    
    lazy var logInButton: CustomButton = {
        let button = CustomButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10.0
        button.clipsToBounds = true
        button.setTitle("Log in", for: .normal)
        button.layer.masksToBounds = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        addSubview(scrollView)
        scrollView.addSubview(conentView)
        conentView.addSubview(logoImage)
        conentView.addSubview(logInTextField)
        conentView.addSubview(passwordTextField)
        conentView.addSubview(logInButton)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            conentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            conentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            conentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            conentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            conentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            logoImage.topAnchor.constraint(equalTo: conentView.topAnchor, constant: 120),
            logoImage.centerXAnchor.constraint(equalTo: conentView.centerXAnchor),
            logoImage.heightAnchor.constraint(equalToConstant: 100),
            logoImage.widthAnchor.constraint(equalToConstant: 100),
            
            logInTextField.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 120),
            logInTextField.trailingAnchor.constraint(equalTo: conentView.trailingAnchor, constant: -16),
            logInTextField.leadingAnchor.constraint(equalTo: conentView.leadingAnchor, constant: 16),
            logInTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.topAnchor.constraint(equalTo: logInTextField.bottomAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: conentView.trailingAnchor, constant: -16),
            passwordTextField.leadingAnchor.constraint(equalTo: conentView.leadingAnchor, constant: 16),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            logInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: conentView.trailingAnchor, constant: -16),
            logInButton.leadingAnchor.constraint(equalTo: conentView.leadingAnchor, constant: 16),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.bottomAnchor.constraint(equalTo: conentView.bottomAnchor)
        
        ])
    }
    
    @objc func logInTextChanged() {
        if logInTextField.text != nil {
            logIn = logInTextField.text!
        }
    }
    
    @objc func passwordTextChanged() {
        if passwordTextField.text != nil {
            password = passwordTextField.text!
        }
    }
}

extension LogInView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
        return true
    }
}



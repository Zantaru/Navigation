//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Антон Зудинов on 18.02.2023.
//

import UIKit

final class ProfileHeaderView: UIView {

    //Переменная для хранения вводимого текста
    
    private var statusText: String?
    
    //Лейбл для имени пользователя
    
    lazy var fullNameLabel: UILabel = {
       let label = UILabel(frame: CGRect(x: 152, y: 27, width: 200, height: 30))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "Viktiriia Nikolaeva"
        return label
    }()

    //Лейбл для текста статуса
    
    lazy var statusLabel: UILabel = {
       let label = UILabel(frame: CGRect(x: 152, y: 92, width: 200, height: 30))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.text = "Waiting for something..."
        return label
    }()
    
    //Аватарка
    
    lazy var avatarImageView: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 16, y: 16, width: 120, height: 120))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "BjceNTX0ZSU")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 60.0
        image.layer.borderWidth = 3.0
        image.layer.borderColor = UIColor.white.cgColor
        return image
    }()
    
    //Кнопка показать статус
    
    lazy var setStatusButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 16, y: 176, width: UIScreen.main.bounds.width - 32, height: 50))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 4.0
        button.setTitle("Show status", for: .normal)
        button.backgroundColor = .systemTeal
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4.0
        button.layer.masksToBounds = false
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        return button
    }()
    
    //Поле для ввода текста статуса
    
    lazy var statusTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 152, y: 120, width: UIScreen.main.bounds.width - 168, height: 40))
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.textColor = .black
        textField.clearButtonMode = .always
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        return textField
    }()
    
    
    init() {
        super.init(frame: .init(x: 0, y: 100, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 200)) //Измеяю размер фрейма для соответсвия макету
        backgroundColor = .lightGray
        addSubview(fullNameLabel)
        addSubview(avatarImageView)
        addSubview(statusLabel)
        addSubview(setStatusButton)
        addSubview(statusTextField)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Записываем текст из поля ввода в переменную
    
    @objc func statusTextChanged() {
        if statusTextField.text != nil {
            statusText = statusTextField.text!
        }
    }
    
    //Передаем текст из переменной в лейбл
    
    @objc func tapAction () {
        statusLabel.text = statusText
        print(statusText!)
    }
    
}

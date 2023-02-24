//
//  LogInButton.swift
//  Navigation
//
//  Created by Антон Зудинов on 24.02.2023.
//

import UIKit

class CustomButton: UIButton {

    private let buttonBackgoundColor = UIColor(patternImage: UIImage(named: "blue_pixel")!)

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isEnabled = isEnabled
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var isHighlighted: Bool {
        didSet {
            self.backgroundColor = isHighlighted ? buttonBackgoundColor.withAlphaComponent(0.8) : buttonBackgoundColor
        }
    }

    override var isEnabled: Bool {
        didSet {
            self.backgroundColor = isEnabled ? buttonBackgoundColor : buttonBackgoundColor.withAlphaComponent(0.8)
        }
    }
}

//
//  Button.swift
//  Ozinshe
//
//  Created by Nazerke Sembay on 15.06.2023.
//

import UIKit

class Button: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        custumize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        custumize()
    }
    
}

private extension Button {
    func custumize() {
        backgroundColor = UIColor(red: 126/255, green: 45/255, blue: 252/255, alpha: 1)
        layer.cornerRadius = 12
        
        titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
    }
}

//
//  TextField.swift
//  Ozinshe
//
//  Created by Nazerke Sembay on 15.06.2023.
//

import UIKit

class TextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        customize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customize()
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 0))
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 0))
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 0))
    }
}

extension TextField: UITextFieldDelegate {
    private func customize() {
        layer.cornerRadius = 12
        layer.borderWidth = 1
        setBorderColor()
        
        addTarget(self, action: #selector(editingDidBegin), for: .editingDidBegin)
        addTarget(self, action: #selector(editingDidEnd), for: .editingDidEnd)
    }
    
    func setBorderColor(_ active: Bool = false) {
        layer.borderColor = CGColor(
            red: (active ? 151 : 229)/255,
            green: (active ? 83 : 235)/255,
            blue: 240/255,
            alpha: 1
        )
    }
    
    @objc func editingDidBegin() {
        setBorderColor(true)
    }
    
    @objc func editingDidEnd() {
        setBorderColor()
    }
}

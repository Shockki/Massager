//
//  DesignableTextField.swift
//  Local Socket
//
//  Created by Анатолий on 02.04.2018.
//  Copyright © 2018 Анатолий Модестов. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class DesignableTextField: UITextField {
   
    @IBInspectable var corner: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = corner
        }
    }
    @IBInspectable var cursor: CGFloat = 0.0 {
        didSet {
            self.leftView = UIView(frame: .init(x: 0, y: 0, width: cursor, height: 0))
            self.leftViewMode = .always
        }
    }
}

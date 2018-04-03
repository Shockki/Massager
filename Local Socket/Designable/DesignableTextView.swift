//
//  DesignableTextView.swift
//  Local Socket
//
//  Created by Анатолий on 03.04.2018.
//  Copyright © 2018 Анатолий Модестов. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class DesignableTextView: UITextView {
    
    @IBInspectable var corner: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = corner
            self.layer.masksToBounds = true
        }
    }
    
}

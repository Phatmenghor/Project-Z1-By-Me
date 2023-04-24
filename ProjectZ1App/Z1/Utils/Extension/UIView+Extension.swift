//
//  UIView+Extension.swift
//  Z1 App IOS
//
//  Created by PHAT MENGHOR on 4/4/23.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}

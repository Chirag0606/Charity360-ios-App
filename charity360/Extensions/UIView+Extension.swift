//
//  UIView+Extensions.swift
//  charity360
//
//  Created by user1 on 24/02/24.
//

import UIKit

extension UIView{
    @IBInspectable var cornerRadiusUsedForOnboarding: CGFloat{
        get { return cornerRadiusUsedForOnboarding}
        set {
            self.layer.cornerRadius = newValue
        }
    }
}

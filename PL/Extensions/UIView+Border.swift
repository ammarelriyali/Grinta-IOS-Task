//
//  UIView+Border.swift
//  PL
//
//  Created by ammar on 13/10/2023.
//

import UIKit

extension UIView {

    func makeBorder() {
        self.layer.cornerRadius = self.frame.size.width/30
        self.clipsToBounds = true
    }
}

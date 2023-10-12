//
//  CustomViewProtocol.swift
//  PL
//
//  Created by ammar on 12/10/2023.
//

import UIKit
protocol CustomViewProtocol {
    func commonInit()
}
extension CustomViewProtocol where Self: UIView {
    func commonInit() {
        if let view = Bundle(for: Self.self)
            .loadNibNamed(String(describing: Self.self),
                          owner: self,
                          options: nil)?.first as? UIView {
            addSubview(view)
            view.frame = bounds
            view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        }
    }
}

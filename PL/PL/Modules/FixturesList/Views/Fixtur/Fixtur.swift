//
//  Fixtur.swift
//  PL
//
//  Created by ammar on 12/10/2023.
//

import UIKit

class Fixtur: UIView, CustomViewProtocol {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var homeTeam: Team!
    @IBOutlet weak var awayTeam: Team!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var status: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    func setFixtur(_ Fixtur: Any) {
       
    }
}

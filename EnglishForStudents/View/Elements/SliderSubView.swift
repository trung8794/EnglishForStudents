//
//  SliderSubView.swift
//  EnglishForStudents
//
//  Created by Nguyen Store on 08/08/2018.
//  Copyright © 2018 Nguyen Store. All rights reserved.
//

import UIKit

class SliderSubView: UIView {

    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var lblNumber: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    public func commonInit(){
        //-- do some things
        
        Bundle.main.loadNibNamed("SliderSubView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
    }

}

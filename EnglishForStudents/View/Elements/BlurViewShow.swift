//
//  BlurViewShow.swift
//  EnglishForStudents
//
//  Created by Nguyen Store on 09/08/2018.
//  Copyright © 2018 Nguyen Store. All rights reserved.
//

import UIKit

class BlurViewShow: UIView {

    @IBOutlet var contentView: UIView!
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
        
        Bundle.main.loadNibNamed("BlurViewShow", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
    }


}

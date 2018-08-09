//
//  MyTableViewCell.swift
//  EnglishForStudents
//
//  Created by Nguyen Store on 09/08/2018.
//  Copyright © 2018 Nguyen Store. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var lblBackGround: UIView!
    @IBOutlet weak var btnArrowRight: UIButton!
    
    @IBOutlet weak var lblNumCompleted: UILabel!
    @IBOutlet weak var lblToppicName: UILabel!
    @IBOutlet weak var lblNumber: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        lblBackGround.customBorderRadius(rad: 10)
        btnArrowRight.customBorderRadius(rad: 17.5)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

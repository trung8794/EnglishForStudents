//
//  ShowUnitsViewController.swift
//  EnglishForStudents
//
//  Created by Nguyen Store on 08/08/2018.
//  Copyright © 2018 Nguyen Store. All rights reserved.
//

import UIKit

class ShowUnitsViewController: NavigationCustomViewController{

   
    @IBOutlet weak var bg_image: UIImageView!
    @IBOutlet weak var lblNumber: UILabel!
    var gradeNumber = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        bg_image.image = UIImage(named: Variables.NAME_BG)
       btnTopbarShowText.titleLabel?.text = "<< GRADE " + gradeNumber
        lblNumber.text = gradeNumber
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    

    override func viewDidAppear(_ animated: Bool) {
        
    }
}

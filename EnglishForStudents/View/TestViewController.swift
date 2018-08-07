//
//  TestViewController.swift
//  EnglishForStudents
//
//  Created by Nguyen Store on 07/08/2018.
//  Copyright © 2018 Nguyen Store. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    var data: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        label.text = data
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

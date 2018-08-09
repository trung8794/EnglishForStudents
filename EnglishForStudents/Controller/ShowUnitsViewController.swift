//
//  ShowUnitsViewController.swift
//  EnglishForStudents
//
//  Created by Nguyen Store on 08/08/2018.
//  Copyright © 2018 Nguyen Store. All rights reserved.
//

import UIKit

class ShowUnitsViewController: NavigationCustomViewController, UITableViewDataSource, UITableViewDelegate{
    
 
    var listCell = ["one", "two","three","four","five"]
    
   
    @IBOutlet weak var MyTableView: UITableView!
    @IBOutlet weak var bg_image: UIImageView!
    var topString = ""
    
    var gradeNumber = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        bg_image.image = UIImage(named: NAME_BG)
        btnTopbarShowText.titleLabel?.font = FONT_TEXT_27
        
        MyTableView.dataSource = self
        MyTableView.delegate = self
        MyTableView.backgroundColor = UIColor.clear
        MyTableView.showsHorizontalScrollIndicator = false
        MyTableView.showsVerticalScrollIndicator = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    

    override func viewDidAppear(_ animated: Bool) {
        btnTopbarShowText.setTitle("<< GRADE \(gradeNumber)", for: .normal)
    }
    
    //-- make Table View ---
    // MARK: - Table view data source
    
    //     func numberOfSections(in tableView: UITableView) -> Int {
    //        // #warning Incomplete implementation, return the number of sections
    //        return 1
    //    }
    //
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 13
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("MyTableViewCell", owner: self, options: nil)?.first as! MyTableViewCell
        let backgroundView = UIView()
        backgroundView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        backgroundView.customBorderRadius(rad:  10)
        cell.selectedBackgroundView = backgroundView
        cell.backgroundColor = UIColor.clear;
        cell.lblNumber.text = String(indexPath.row + 1)
        if(indexPath.row < 4){
            
            cell.lblNumCompleted.text = "3/5 Completed"
            cell.lblNumber.textColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            cell.lblToppicName.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            cell.lblNumCompleted.textColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

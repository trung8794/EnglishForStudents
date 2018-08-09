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
     @IBOutlet weak var myBlurView: UIVisualEffectView!
    var topString = ""
    
    var gradeNumber = 0
    
    var effect : UIVisualEffect!
    var effectState = 0
    var addItemView  = BlurViewShow(frame: CGRect(x: 0, y: 0, width: 300, height: 380))
    override func viewDidLoad() {
        super.viewDidLoad()
        bg_image.image = UIImage(named: NAME_BG)
        btnTopbarShowText.titleLabel?.font = FONT_TEXT_27
        
        MyTableView.dataSource = self
        MyTableView.delegate = self
        MyTableView.backgroundColor = UIColor.clear
        MyTableView.showsHorizontalScrollIndicator = false
        MyTableView.showsVerticalScrollIndicator = false
        
        //--Load blur View--
        effect = myBlurView.effect
        myBlurView.effect = nil
        addItemView.customBorderRadius(rad: 10)
        btnLeftMenu.addTarget(self, action:#selector(hideBlur), for: .touchUpInside)
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
        if(gradeNumber <= 9){
            return 12
        }
        else{
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("MyTableViewCell", owner: self, options: nil)?.first as! MyTableViewCell
        let backgroundView = UIView()
        backgroundView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        backgroundView.customBorderRadius(rad:  10)
        cell.selectedBackgroundView = backgroundView
        cell.backgroundColor = UIColor.clear;
        cell.lblNumber.text = String(indexPath.row + 1)
        
        //-- Build Each cell
        cell.lblToppicName.text = TOPIC_DRADES[gradeNumber - 6][indexPath.row + 1]
        
        if(indexPath.row < 4){
            
            cell.lblNumCompleted.text = "3/5 Completed"
            cell.lblNumber.textColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            cell.lblToppicName.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            cell.lblNumCompleted.textColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        }
        
        return cell
    }

    //-- Blur Funcion--
    func animateIn()  {
        self.view.addSubview(addItemView)
        addItemView.center = self.view.center
        addItemView.transform = CGAffineTransform.init(scaleX: 1.2, y: 1.2)
        addItemView.alpha = 0
        myBlurView.alpha = 1
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.touchOnBlur))
        myBlurView.addGestureRecognizer(gesture)
        
        UIView.animate(withDuration: 0.3) {
            self.myBlurView.effect = self.effect
            self.addItemView.alpha = 1
            self.addItemView.transform = CGAffineTransform.identity
            
        }
        effectState = 1
    }
    
    @objc func touchOnBlur(sender : UITapGestureRecognizer) {
        animateOut()
    }

    func animateOut() {
        UIView.animate(withDuration: 0.3, animations: {
            self.addItemView.transform = CGAffineTransform.init(scaleX: 1.2, y: 1.2)
            self.addItemView.alpha = 0
            self.myBlurView.effect = nil
            self.myBlurView.alpha = 0
        }) { (success : Bool) in
            self.addItemView.removeFromSuperview()
            self.effectState = 0
        }
    }
    
    @objc func hideBlur(){
//        showHideMenuLeft()
        if(effectState == 1){
            animateOut()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        animateIn()
        print(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

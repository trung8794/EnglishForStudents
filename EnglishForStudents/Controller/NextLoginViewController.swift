//
//  NextLoginViewController.swift
//  EnglishForStudents
//
//  Created by Nguyen Store on 05/08/2018.
//  Copyright © 2018 Nguyen Store. All rights reserved.
//

import UIKit

class NextLoginViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - IBOutlet
    
    // MARK: - Let
    // MARK: - VAR
     var TableViewInside: UITableView = UITableView()
    var SlideView : UIView = UIView()
    var Mark : UIView! =  UIView()
    var ButtonLeft : UIButton!
    
    @IBOutlet weak var bg_yellow: UIImageView!
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        makeSlideMenu()

    }
    // MARK: - Action
    // MARK: - Function common
    //-- Make slide Menu --
    func makeSlideMenu() {
        setupNavigationBarItems()
        makeSlideOutSide()
        makeMark()
//        makeTableViewInside()
    }
    
    func setupNavigationBarItems(){
       
        ButtonLeft = UIButton(type: .system)
        ButtonLeft.setImage(#imageLiteral(resourceName: "ic_menu2.png"), for: .normal)
        ButtonLeft.adjustsImageSizeForAccessibilityContentSizeCategory = true
        ButtonLeft.frame = CGRect(x: 0, y: 0, width: 22, height: 22)
        //        ButtonLeft.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
        ButtonLeft.contentMode = .scaleToFill
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: ButtonLeft)
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        ButtonLeft.addTarget(self, action: #selector(self.showMenuLeft(_ :)), for: .touchUpInside)
    }
    
    @objc func showMenuLeft(_ sender: UIButton) {

        showHideMenuLeft()
    }
    @objc func handleTap(sender: UITapGestureRecognizer? = nil) {
        showHideMenuLeft()
    }
    
    func makeMark() {
        self.Mark = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        self.Mark.backgroundColor = UIColor(patternImage: UIImage(named: "bg_yellow.png")!)
        self.Mark.contentMode = .scaleToFill
        self.Mark.alpha = 0
        
        //-- create tabGesture
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(sender:)))
        self.Mark.addGestureRecognizer(tap)
        
        self.view.addSubview(self.Mark)
    }
    
   
    
    func showHideMenuLeft() {
        if(self.SlideView.frame.origin.x < 0){
            UIView.animate(withDuration: 1) {
                self.SlideView.frame.origin.x += self.SlideView.frame.width
                self.Mark.alpha = 1
            }
            //            self.Mark.frame.origin.x += self.Mark.frame.width
            
        }else{
            UIView.animate(withDuration: 1) {
                self.SlideView.frame.origin.x -= self.SlideView.frame.width
                self.Mark.alpha = 0
            }
            //            self.Mark.frame.origin.x -= self.Mark.frame.width
            
        }
    }
    func makeSlideOutSide() {
        SlideView = UIView(frame: CGRect(x: -self.view.frame.width * 2 / 3, y: (navigationController?.navigationBar.frame.height)! * 1.5, width: self.view.frame.width * 2 / 3, height: self.view.frame.height - (navigationController?.navigationBar.frame.height)! * 1.5))
        SlideView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        SlideView.customBorderRadius(rad: 5.0)
        navigationController?.view.addSubview(SlideView)
        
    }
    func makeTableViewInside() {
        TableViewInside = UITableView(frame: CGRect(x: 0, y: 10, width:   self.SlideView.frame.width - 20, height: self.SlideView.frame.height - 20))
        TableViewInside.dataSource = self
        TableViewInside.delegate = self
        TableViewInside.register(cellTableView.self, forCellReuseIdentifier: "cell")
        self.SlideView.addSubview(TableViewInside)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableViewInside.dequeueReusableCell(withIdentifier: "cell")
        
        return cell!
    }

    //-- End Make Slide Menu ---------
    
    // MARK: - Table delegate/data source
    // MARK: - text field delegate...
    // MARK: - prepare + delegate
}

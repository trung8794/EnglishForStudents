//
//  NextLoginViewController.swift
//  EnglishForStudents
//
//  Created by Nguyen Store on 05/08/2018.
//  Copyright © 2018 Nguyen Store. All rights reserved.
//

import UIKit

class NextLoginViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {
    
    // MARK: - IBOutlet
    @IBOutlet weak var mySliderFeature: UIScrollView!
    @IBOutlet weak var mySliderTab: UIPageControl!
     @IBOutlet weak var bg_yellow: UIImageView!
    
    @IBOutlet weak var txtShowDetail: UITextView!
    @IBOutlet weak var btnGo: UIButton!
    // MARK: - Let
    // MARK: - VAR
    //----------
    var pageCount : Int = 7
    var myFrame : CGRect = CGRect(x: 0, y: 0, width: 0, height: 0)
    var myTextList : [String] = ["Some detail of Grade 1",
                                 "Some detail of Grade 2",
                                 "Some detail of Grade 3",
                                 "Some detail of Grade 4",
                                 "Some detail of Grade 5",
                                 "Some detail of Grade 6",
                                 "Some detail of Grade 7",
                                 ]
    
    //------------------------
    var TableViewInside: UITableView = UITableView()
    var SlideView : UIView = UIView()
    var Mark : UIImageView! =  UIImageView()
    var ButtonLeft : UIButton!
    
   
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        makeSlideMenu()
        createSliderFeature()
        
    }
    // MARK: - Action
    // MARK: - Function common
    //--Content of Controller----
    func initViews() {
        btnGo.customBorderRadius(rad: 5.0)
        btnGo.customBorderColor(color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
    }
    func createSliderFeature() {
        mySliderTab.numberOfPages = pageCount
        mySliderFeature.contentSize = CGSize(width: mySliderFeature.bounds.width * CGFloat(pageCount), height: mySliderFeature.bounds.height)
        
        for index in 0...pageCount - 1{
            if index == 0{
                myFrame.origin.y = 0
                myFrame.origin.x = mySliderFeature.frame.size.width * CGFloat(index) + 50
                myFrame.size.width = mySliderFeature.frame.size.width - 100
                myFrame.size.height = mySliderFeature.frame.size.height
            }
            else{
                myFrame.origin.y = 20
                myFrame.origin.x = mySliderFeature.frame.size.width * CGFloat(index) - 30
                myFrame.size.width = mySliderFeature.frame.size.width + 60
                myFrame.size.height = mySliderFeature.frame.size.height - 40
            }
            
            
            var indexView :UIView = UIView(frame: myFrame)
            indexView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            
            var indexLabel = UILabel()
            indexLabel.text = String(index)
            indexLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            indexLabel.font = UIFont(name: "Avenir Next Condensed", size: 80)
            indexView.customBorderRadius()
            
            indexView.addSubview(indexLabel)
            self.mySliderFeature.addSubview(indexView)
            
            
            let center_top = NSLayoutConstraint(item: indexLabel, attribute: .centerY, relatedBy: .equal, toItem: indexView, attribute: .centerY, multiplier: 1, constant: 0)
            let center_left = NSLayoutConstraint(item: indexLabel, attribute: .centerX, relatedBy: .equal, toItem: indexView, attribute: .centerX, multiplier: 1, constant: 0)
//            let width = NSLayoutConstraint(item: indexLabel, attribute: .width, relatedBy: .equal, toItem: indexView, attribute: .width, multiplier: 1, constant: 0)
//            let height = NSLayoutConstraint(item: indexLabel, attribute: .height, relatedBy: .equal, toItem: indexView, attribute: .height, multiplier: 1/2, constant: 0)
            indexView.autoresizesSubviews = false
            indexLabel.translatesAutoresizingMaskIntoConstraints = false
            view.addConstraints([center_top, center_left])


            
            
        }
        
        
        mySliderFeature.delegate = self
        mySliderFeature.isPagingEnabled = true
        mySliderFeature.showsVerticalScrollIndicator = false
        mySliderFeature.showsHorizontalScrollIndicator = false
        print("Make done Scroll View")
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var index = Int(scrollView.contentOffset.x / self.mySliderFeature.frame.width)
        mySliderTab.currentPage = index
        let contentX = scrollView.contentOffset.x
        let widthX = self.mySliderFeature.frame.width
        var soDu = contentX / widthX
        print("\(soDu)")
        txtShowDetail.text = myTextList[index] + "\n - Bla bla bla " + "\n - Bla bla bla " + "\n - Bla bla bla "
    }
    //------------------------
    
    //-- Make slide Menu --
    func makeSlideMenu() {
        setupNavigationBarItems()
        makeSlideOutSide()
        makeMark()
        // makeTableViewInside()
    }
    
    func setupNavigationBarItems(){
        
        ButtonLeft = UIButton(type: .system)
        ButtonLeft.setImage(#imageLiteral(resourceName: "ic_menu2.png"), for: .normal)
        ButtonLeft.adjustsImageSizeForAccessibilityContentSizeCategory = true
        ButtonLeft.frame = CGRect(x: 0, y: 0, width: 22, height: 22)
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
        self.Mark.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height )
        self.Mark.image = UIImage(named: "bg_yellow")
        self.Mark.contentMode =  UIViewContentMode.scaleAspectFill
        self.Mark.alpha = 0
        
        //-- create tabGesture
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(sender:)))
        self.Mark.addGestureRecognizer(tap)
        
        self.view.addSubview(self.Mark)
        
        
    }
    
    
    
    func showHideMenuLeft() {
        if(self.SlideView.frame.origin.x < 0){
            UIView.animate(withDuration: 0.7) {
                self.SlideView.frame.origin.x += self.SlideView.frame.width
                self.Mark.alpha = 1
            }
            
        }else{
            UIView.animate(withDuration: 0.7) {
                self.SlideView.frame.origin.x -= self.SlideView.frame.width
                self.Mark.alpha = 0
            }
            
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

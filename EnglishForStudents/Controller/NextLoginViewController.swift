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
    
    //----
    var TableViewInside: UITableView = UITableView()
    var SlideView : UIView = UIView()
    var Mark : UIImageView! =  UIImageView()
    var ButtonLeft : UIButton!
    //----
    var lastContentOffset: CGFloat = 0
    var heightScrollView : CGFloat = 0
    var widthScrollView : CGFloat = 0
    var changeHeight = 0.4
    
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

            var parentView : UIView = UIView(frame: CGRect(x: mySliderFeature.frame.width * CGFloat(index), y: 0, width: mySliderFeature.frame.width, height: mySliderFeature.frame.height))
            
            self.mySliderFeature.addSubview(parentView)
            
            
            var indexView: UIView = UIView()
  
         
            indexView.frame.size.height =  parentView.frame.height - 30
            indexView.frame.size.width =  parentView.frame.width - 50
            indexView.center.y = parentView.center.y
            indexView.center.x = parentView.bounds.width / 2
            indexView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            indexView.alpha = 0.8
            indexView.customBorderRadius()
            parentView.addSubview(indexView)
            
            var indexSubView : UIView = UIView()
            indexSubView.frame.size.height =  150
            indexSubView.frame.size.width =  200
            indexSubView.center.y = indexView.bounds.height / 2
            indexSubView.center.x = indexView.bounds.width / 2
            indexSubView.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
            indexView.addSubview(indexSubView)
            
          
          
            var labelViewNumber: UILabel = UILabel()
            labelViewNumber.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
            labelViewNumber.center = CGPoint(x: indexSubView.frame.width / 2, y: indexSubView.frame.height / 2)
            labelViewNumber.text = String(index)
            labelViewNumber.font = UIFont(name: "Avenir Next Condensed", size: 100)
            labelViewNumber.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            labelViewNumber.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            labelViewNumber.numberOfLines = 0
            labelViewNumber.textAlignment = .center
            indexSubView.addSubview(labelViewNumber)
            
            

            //-- action Tap ---
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
            indexView.addGestureRecognizer(tap)
            indexView.isUserInteractionEnabled = true
            
        }
        
        mySliderFeature.delegate = self
        mySliderFeature.isPagingEnabled = true
        mySliderFeature.showsVerticalScrollIndicator = false
        mySliderFeature.showsHorizontalScrollIndicator = false
        
        heightScrollView = mySliderFeature.frame.height
        widthScrollView = mySliderFeature.frame.width
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        print("Hello World")
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        var index = Int(scrollView.contentOffset.x / self.mySliderFeature.frame.width)
        mySliderTab.currentPage = index
        
//        let contentX = scrollView.contentOffset.x
//        let widthX = self.mySliderFeature.frame.width
//        let tile = contentX / widthX - CGFloat(index)
//        print("Index la : \(index) , contentx/width \(contentX / widthX), title\(tile) , 1- title \(1-tile)")
//
//        //-- change size when scroll--
//        if (lastContentOffset > scrollView.contentOffset.x) {
//            if(index > 0){
//
//                self.view.viewWithTag(100 + index)?.frame.size.height = heightScrollView + 0.004
//                heightScrollView = (self.view.viewWithTag(100 + index)?.frame.height)!
////                self.view.viewWithTag(100 + index)?.frame.size.width = (self.view.viewWithTag(100 + index)?.frame.width)! + (100.0 * tile)
//                print(1 - tile)
//                print("inside : \((self.view.viewWithTag(100 + index)?.frame.height)! - (40 * tile))")
//            }
//        }
//        else if (lastContentOffset < scrollView.contentOffset.x) {
//            // move down
//        }
//        lastContentOffset = scrollView.contentOffset.x
//
//
//
//        //-- last state of View Index ----
//        UIView.animate(withDuration: 0.2) {
//            self.view.viewWithTag(100 + index)?.alpha = 1
//            if contentX / widthX == CGFloat(index) {
//                 self.view.viewWithTag(100 + index)?.frame = CGRect(x: CGFloat(index) * self.mySliderFeature.frame.size.width + 50 , y: 0, width: self.mySliderFeature.frame.size.width - 100, height:self.mySliderFeature.frame.size.height)
//            }
//            for i in 0...self.pageCount{
//                if(i != index && contentX / widthX == CGFloat(index)){
//                    self.view.viewWithTag(100 + i)?.frame = CGRect(x: CGFloat(i) * self.mySliderFeature.frame.size.width - 30 , y: 20, width: self.mySliderFeature.frame.size.width + 60, height:self.mySliderFeature.frame.size.height - 40)
//                    self.view.viewWithTag(100 + i)?.alpha = 0.5
//                }
//            }
//        }
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

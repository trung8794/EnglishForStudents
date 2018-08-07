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
    var pageCount : Int = 5
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
    var listParentViewInsideScroll = Array<UIView>()
    var listSubViewInsideScroll = Array<UIView>()
    var widthIndex : CGFloat = 0
    var heightIndex : CGFloat = 0
    var widthOthers : CGFloat = 0
    var heightOthers : CGFloat = 0
    var lastContentOffset: CGFloat = 0
    

    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        makeSlideMenu()
    }
    override func viewDidAppear(_ animated: Bool) {
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
        mySliderFeature.contentSize = CGSize(width: mySliderFeature.frame.width * CGFloat(pageCount), height: mySliderFeature.frame.height)
        widthIndex = mySliderFeature.frame.width - 100
        heightIndex = mySliderFeature.frame.height
        widthOthers = mySliderFeature.frame.width + 60
        heightOthers = mySliderFeature.frame.height - 60
     
        for index in 0...pageCount - 1{
            let parentView = UIView()
            listParentViewInsideScroll.append(parentView)
            mySliderFeature.addSubview(listParentViewInsideScroll[index])
           listParentViewInsideScroll[index].anchorSizeHeight(height: mySliderFeature.frame.height)
            listParentViewInsideScroll[index].anchorSizeWidth(width: mySliderFeature.frame.width)
            listParentViewInsideScroll[index].anchorToView(top: mySliderFeature.topAnchor, leading: mySliderFeature.leadingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 0, left: mySliderFeature.frame.width * CGFloat(index), bottom: 0, right: 0))
            
            let subView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
            subView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            subView.layer.cornerRadius = 10
            subView.clipsToBounds = true
            subView.alpha = 0.8
            listSubViewInsideScroll.append(subView)
            listParentViewInsideScroll[index].addSubview(listSubViewInsideScroll[index])
            if(index == 0){
                listSubViewInsideScroll[index].anchorToView(top: listParentViewInsideScroll[index].topAnchor, leading: listParentViewInsideScroll[index].leadingAnchor, bottom: listParentViewInsideScroll[index].bottomAnchor, trailing: listParentViewInsideScroll[index].trailingAnchor, padding: UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 50))
            }
            else{
                 listSubViewInsideScroll[index].anchorToView(top: listParentViewInsideScroll[index].topAnchor, leading: listParentViewInsideScroll[index].leadingAnchor, bottom: listParentViewInsideScroll[index].bottomAnchor, trailing: listParentViewInsideScroll[index].trailingAnchor, padding: UIEdgeInsets(top: 30, left: -30, bottom: 30, right: -30))
            }
            listSubViewInsideScroll[index].anchorCenter(to: listParentViewInsideScroll[index], centerX: true, centerY: true)
          
            let numberView = UIView(frame: CGRect(x: 0, y: 0, width: 110, height: 110))
            
            //-- action Tap ---
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
            listSubViewInsideScroll[index].addGestureRecognizer(tap)
            listSubViewInsideScroll[index].isUserInteractionEnabled = true

        }
        
        mySliderFeature.delegate = self
        mySliderFeature.isPagingEnabled = true
        mySliderFeature.showsVerticalScrollIndicator = false
        mySliderFeature.showsHorizontalScrollIndicator = false
        
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        let index = mySliderTab.currentPage
    }
    

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        var index = Int(scrollView.contentOffset.x / self.mySliderFeature.frame.width)
        mySliderTab.currentPage = index
        
        let contentX = scrollView.contentOffset.x
        let widthX = self.mySliderFeature.frame.width
        let tile = contentX / widthX
        if(tile == CGFloat(index)){
            self.listSubViewInsideScroll[index].bounds.size.width = widthIndex
            self.listSubViewInsideScroll[index].bounds.size.height = heightIndex
            for i in 0...pageCount - 1{
                if(i != index){
                    self.listSubViewInsideScroll[i].bounds.size.width = widthOthers
                    self.listSubViewInsideScroll[i].bounds.size.height = heightOthers
                }
            }
        }
        else{
           
            
            if(lastContentOffset > scrollView.contentOffset.x){
                self.listSubViewInsideScroll[index + 1].bounds.size.width = widthIndex + CGFloat(160) * (CGFloat(1) - tile + CGFloat(index));
                self.listSubViewInsideScroll[index + 1].bounds.size.height = heightIndex - CGFloat(60) * (CGFloat(1) - tile + CGFloat(index));
                
                 self.listSubViewInsideScroll[index].bounds.size.width = widthOthers - CGFloat(160) * (CGFloat(1) - tile + CGFloat(index));
                 self.listSubViewInsideScroll[index].bounds.size.height = heightOthers + CGFloat(60) * (CGFloat(1) - tile + CGFloat(index));
            }
            else{
                self.listSubViewInsideScroll[index].bounds.size.width = widthIndex + CGFloat(160) * (tile - CGFloat(index));
                self.listSubViewInsideScroll[index].bounds.size.height = heightIndex - CGFloat(60) * (tile - CGFloat(index));
            
                self.listSubViewInsideScroll[index + 1].bounds.size.width = widthOthers - CGFloat(160) * (tile - CGFloat(index));
                self.listSubViewInsideScroll[index + 1].bounds.size.height = heightOthers + CGFloat(60) * (tile - CGFloat(index));
            }
        }
        lastContentOffset = scrollView.contentOffset.x
        print(lastContentOffset)
    }
    //------------------------
    
    //-- Make slide Menu --
    func makeSlideMenu() {
        setupNavigationBarItems()
        makeSlideOutSide()
//        makeMark()
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

//
//  NextLoginViewController.swift
//  EnglishForStudents
//
//  Created by Nguyen Store on 05/08/2018.
//  Copyright © 2018 Nguyen Store. All rights reserved.
//

import UIKit

class NextLoginViewController: NavigationCustomViewController, UIScrollViewDelegate {
    
    // MARK: - IBOutlet
    @IBOutlet weak var mySliderFeature: UIScrollView!
    @IBOutlet weak var mySliderTab: UIPageControl!
     @IBOutlet weak var bg_yellow: UIImageView!
    
    @IBOutlet weak var BG_View: UIImageView!
    @IBOutlet weak var txtShowDetail: UITextView!
    @IBOutlet weak var btnGo: UIButton!
    // MARK: - Let
    // MARK: - VAR
    //----------
    var pageCount : Int = 7
    var gradeNumber = 6
    var myFrame : CGRect = CGRect(x: 0, y: 0, width: 0, height: 0)
    var myTextList : [String] = ["Some detail of Grade 6",
                                 "Some detail of Grade 7",
                                 "Some detail of Grade 8",
                                 "Some detail of Grade 9",
                                 "Some detail of Grade 10",
                                 "Some detail of Grade 11",
                                 "Some detail of Grade 12",
                                 ]

    var listParentViewInsideScroll = Array<UIView>()
    var listSubViewInsideScroll = Array<UIView>()
    var listNumberInside = Array<UIView>()
    var widthIndex : CGFloat = 0
    var heightIndex : CGFloat = 0
    var widthOthers : CGFloat = 0
    var heightOthers : CGFloat = 0
    var lastContentOffset: CGFloat = 0
    let widthLess : CGFloat = 100
    let widthMore : CGFloat = 60
    let heightLess : CGFloat = 60
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
    override func viewDidAppear(_ animated: Bool) {
        createSliderFeature()
    
    }
    
    // MARK: - Action
    @IBAction func goUnitsAction(_ sender: UIButton) {
        let myShowUnitsView = ShowUnitsViewController(nibName: "ShowUnitsViewController", bundle: nil)
        myShowUnitsView.gradeNumber = String(gradeNumber)
        present(myShowUnitsView, animated: true, completion: nil)
    }

    // MARK: - Function common
    //--Content of Controller----
    func initViews() {
        btnGo.customBorderRadius(rad: 5.0)
        btnGo.customBorderColor(color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
    }
    
    func createSliderFeature() {
        mySliderTab.numberOfPages = pageCount
        mySliderFeature.contentSize = CGSize(width: mySliderFeature.frame.width * CGFloat(pageCount), height: mySliderFeature.frame.height)
        widthIndex = mySliderFeature.frame.width - widthLess
        heightIndex = mySliderFeature.frame.height
        widthOthers = mySliderFeature.frame.width + widthMore
        heightOthers = mySliderFeature.frame.height - heightLess
     
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
            subView.alpha = 0.85
            listSubViewInsideScroll.append(subView)
            listParentViewInsideScroll[index].addSubview(listSubViewInsideScroll[index])
            if(index == 0){
                listSubViewInsideScroll[index].anchorToView(top: listParentViewInsideScroll[index].topAnchor, leading: listParentViewInsideScroll[index].leadingAnchor, bottom: listParentViewInsideScroll[index].bottomAnchor, trailing: listParentViewInsideScroll[index].trailingAnchor, padding: UIEdgeInsets(top: 0, left: widthLess / 2, bottom: 0, right: widthLess / 2))
            }
            else{
                 listSubViewInsideScroll[index].anchorToView(top: listParentViewInsideScroll[index].topAnchor, leading: listParentViewInsideScroll[index].leadingAnchor, bottom: listParentViewInsideScroll[index].bottomAnchor, trailing: listParentViewInsideScroll[index].trailingAnchor, padding: UIEdgeInsets(top: heightLess / 2, left: -widthMore / 2, bottom: heightLess / 2, right: -widthMore / 2))
            }
            listSubViewInsideScroll[index].anchorCenter(to: listParentViewInsideScroll[index], centerX: true, centerY: true)
            //-- 120 190 is size of Number and Text Label inside
            let numberView = SliderSubView(frame: CGRect(x: (widthIndex - CGFloat(120)) / 2, y: (heightIndex - CGFloat(170)) / 2, width: 120 , height: 190))
            numberView.lblNumber.text = String(index + 6)
            subView.addSubview(numberView)
           listNumberInside.append(numberView)
        }
        mySliderFeature.delegate = self
        mySliderFeature.isPagingEnabled = true
        mySliderFeature.showsVerticalScrollIndicator = false
        mySliderFeature.showsHorizontalScrollIndicator = false
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x / self.mySliderFeature.frame.width)
        mySliderTab.currentPage = index
        
        let contentX = scrollView.contentOffset.x
        let widthX = self.mySliderFeature.frame.width
        let tile = contentX / widthX
        if(tile == CGFloat(index)){
            gradeNumber = index + 6
            if( index > 3 && Variables.NAME_BG  == Variables.NAME_BG_LIST[0]){
                Variables.NAME_BG = Variables.NAME_BG_LIST[1]
                UIView.animate(withDuration: 0.5) {
                    self.BG_View.image = UIImage(named: Variables.NAME_BG)
                }
                
            }
            if( index <= 3 && Variables.NAME_BG  == Variables.NAME_BG_LIST[1]){
                Variables.NAME_BG = Variables.NAME_BG_LIST[0]
                UIView.animate(withDuration: 0.5) {
                    self.BG_View.image = UIImage(named: Variables.NAME_BG)
                }
                
            }
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
                self.listSubViewInsideScroll[index + 1].bounds.size.width = widthIndex + CGFloat(widthMore + widthLess) * (CGFloat(1) - tile + CGFloat(index));
                self.listSubViewInsideScroll[index + 1].bounds.size.height = heightIndex - CGFloat(heightLess) * (CGFloat(1) - tile + CGFloat(index));
                
                 self.listSubViewInsideScroll[index].bounds.size.width = widthOthers - CGFloat(widthMore + widthLess) * (CGFloat(1) - tile + CGFloat(index));
                 self.listSubViewInsideScroll[index].bounds.size.height = heightOthers + CGFloat(heightLess) * (CGFloat(1) - tile + CGFloat(index));
            }
            else{
                self.listSubViewInsideScroll[index].bounds.size.width = widthIndex + CGFloat(widthMore + widthLess) * (tile - CGFloat(index));
                self.listSubViewInsideScroll[index].bounds.size.height = heightIndex - CGFloat(heightLess) * (tile - CGFloat(index));
            
                self.listSubViewInsideScroll[index + 1].bounds.size.width = widthOthers - CGFloat(widthMore + widthLess) * (tile - CGFloat(index));
                self.listSubViewInsideScroll[index + 1].bounds.size.height = heightOthers + CGFloat(heightLess) * (tile - CGFloat(index));
            }
        }
        lastContentOffset = scrollView.contentOffset.x
        print(lastContentOffset)
    }
 

    //-- End Make Slide Menu ---------
    
    // MARK: - Table delegate/data source
    // MARK: - text field delegate...
    // MARK: - prepare + delegate
}

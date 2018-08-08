//
//  NavigationCustomViewController.swift
//  EnglishForStudents
//
//  Created by Nguyen Store on 08/08/2018.
//  Copyright © 2018 Nguyen Store. All rights reserved.
//

import UIKit

class NavigationCustomViewController: UIViewController {
    // MARK: - IBOutlet
    // MARK: - Let
    // MARK: - VAR
    var viewNavigation = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    var btnLeftMenu = UIButton(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
    var btnUser = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    var btnTopbarShowText = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
    var sliderMenu = UIView()
    var subSliderMenu = UIView()
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        buildUINavigation()
        buidSlideMenu()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    // MARK: - Action
    @objc func pressLeftMenu(){
        showHideMenuLeft()
    }
    @objc func pressUserButton(){
        print("da cham vao User")
    }
    @objc func pressButtonShowtext(){
        print("da cham vao Text Show")
    }
    
    // MARK: - Function common
   
    
    // MARK: - Table delegate/data source
    
    // MARK: - text field delegate...
    
    // MARK: - prepare + delegate
    func buildUINavigation() {
        self.view.addSubview(viewNavigation)
        viewNavigation.anchorSizeHeight(height: Variables.PADDING_TOP)
        viewNavigation.anchorToView(top: self.view.safeAreaLayoutGuide.topAnchor, leading: self.view.leadingAnchor, bottom: nil, trailing: self.view.trailingAnchor, padding: UIEdgeInsets.zero)
        
        btnLeftMenu.setImage(UIImage(named: "ic_menu2"), for: .normal)
        viewNavigation.addSubview(btnLeftMenu)
        btnLeftMenu.anchorToView(top: nil, leading: viewNavigation.leadingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0))
        btnLeftMenu.anchorCenter(to: viewNavigation, centerX: false, centerY: true)
        btnLeftMenu.anchorSizeHeight(height: 40)
        btnLeftMenu.anchorSizeWidth(width: 40)
        
        btnUser.setImage(UIImage(named: "ic_boy"), for: .normal)
        viewNavigation.addSubview(btnUser)
        btnUser.anchorToView(top: nil, leading: nil, bottom: nil, trailing: viewNavigation.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 25))
        btnUser.anchorCenter(to: viewNavigation, centerX: false, centerY: true)
        btnUser.anchorSizeHeight(height: 40)
        btnUser.anchorSizeWidth(width: 40)
        btnUser.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        btnUser.layer.borderWidth = 1.0
        btnUser.layer.masksToBounds = false
        btnUser.layer.borderColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        btnUser.layer.cornerRadius = 20
        btnUser.clipsToBounds = true
        
        btnTopbarShowText.setTitle(Variables.TEXT_TOP_BAR, for: .normal)
        btnTopbarShowText.titleLabel?.font = Variables.FONT_TEXT_20
        btnTopbarShowText.titleLabel?.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        viewNavigation.addSubview(btnTopbarShowText)
        btnTopbarShowText.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        btnTopbarShowText.anchorToView(top: nil, leading: nil, bottom: nil, trailing: btnUser.leadingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5))
        btnTopbarShowText.anchorCenter(to: viewNavigation, centerX: false, centerY: true)
        
        btnLeftMenu.addTarget(self, action:#selector(pressLeftMenu), for: .touchUpInside)
        btnUser.addTarget(self, action:#selector(pressUserButton), for: .touchUpInside)
        btnTopbarShowText.addTarget(self, action:#selector(pressButtonShowtext), for: .touchUpInside)
    }

    func buidSlideMenu() {
       
        sliderMenu.frame = CGRect(x: -self.view.frame.width, y: Variables.PADDING_TOP * 1.3, width: self.view.frame.width, height: self.view.frame.height - Variables.PADDING_TOP * 1.3)
        view.addSubview(sliderMenu)
        
        subSliderMenu.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        subSliderMenu.frame = CGRect(x: 0, y: 0, width: Variables.WIDTH_SLIDE_MENU, height: sliderMenu.frame.height)
        subSliderMenu.customBorderRadius(rad: 10)
        sliderMenu.addSubview(subSliderMenu)
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeLeft.direction = .left
        swipeLeft.numberOfTouchesRequired = 1
        sliderMenu.addGestureRecognizer(swipeLeft)
    }
    
        func showHideMenuLeft() {
            if(self.sliderMenu.frame.origin.x < 0){
                UIView.animate(withDuration: 0.7) {
                    self.sliderMenu.frame.origin.x += self.sliderMenu.frame.width
                }
            }else{
                UIView.animate(withDuration: 0.7) {
                    self.sliderMenu.frame.origin.x -= self.sliderMenu.frame.width
                }
            }
        }

    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
                if gesture.direction == UISwipeGestureRecognizerDirection.left {
                    if(self.sliderMenu.frame.origin.x >= 0){
                        UIView.animate(withDuration: 0.7) {
                            self.sliderMenu.frame.origin.x -= self.sliderMenu.frame.width
                        }
                    }
                }
        
            }
        
    
 
    

    
    

}

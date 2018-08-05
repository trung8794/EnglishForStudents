//
//  NextLoginViewController.swift
//  EnglishForStudents
//
//  Created by Nguyen Store on 05/08/2018.
//  Copyright © 2018 Nguyen Store. All rights reserved.
//

import UIKit

class NextLoginViewController: UIViewController {

    // MARK: - IBOutlet
    // MARK: - Let
    // MARK: - VAR
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - Action
    // MARK: - Function common
    //-- build navigationBar --
    private func setupNavigationBarItems(){
       
        let ButtonLeft : UIButton = UIButton(type: .system)
        ButtonLeft.setImage(#imageLiteral(resourceName: "ic_menu.png"), for: .normal)
        ButtonLeft.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: ButtonLeft)
        
       
      
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }

    // MARK: - Table delegate/data source
    // MARK: - text field delegate...
    // MARK: - prepare + delegate
}

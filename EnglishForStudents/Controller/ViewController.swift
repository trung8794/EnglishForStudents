//
//  ViewController.swift
//  EnglishForStudents
//
//  Created by Nguyen Store on 05/08/2018.
//  Copyright © 2018 Nguyen Store. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var viewLoginBehind: UIView!
    @IBOutlet weak var btnLogin: UIButton!
    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    // MARK: - Let
    
    // MARK: - VAR
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        changeStyleViews()
        AppUtility.lockOrientation(.portrait)
        
    }
    
    // MARK: - Action
    
    @IBAction func loginAction(_ sender: Any) {
        let myVal = storyboard?.instantiateViewController(withIdentifier: "NextLogin") as! UIViewController
        present(myVal, animated: false, completion: nil)
    }
    
    // MARK: - Function common
    //-- Change Style of Views----
    func changeStyleViews() {
        viewLoginBehind.customBorderRadius()
        btnLogin.customBorderRadius(rad: CGFloat(5))
        txtUsername.customBorderColor()
        txtUsername.customBorderRadius(rad: CGFloat(5))
        txtPassword.customBorderColor()
        txtPassword.customBorderRadius(rad: CGFloat(5))
    }
    //-- lock Orientation ---
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Don't forget to reset when view is being removed
        AppUtility.lockOrientation(.all)
    }
    
    // MARK: - Table delegate/data source
    // MARK: - text field delegate...
    // MARK: - prepare + delegate
  

}


//
//  GetInViewController.swift
//  Spotify-TESTE
//
//  Created by Lucas Nascimento on 06/03/17.
//  Copyright © 2017 Lucas Nascimento. All rights reserved.
//

import UIKit

class GetInViewController: UIViewController {
    
    
    @IBOutlet weak var facebookGetIn: UIButton!
    @IBOutlet weak var getIn: UIButton!
    
    
    @IBOutlet weak var userGetIn: UITextField!
    @IBOutlet weak var passwordGetIn: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let paddingView = UIView(frame:CGRect(x: 0,y: 0,width: 28,height: 20))
        
        userGetIn.leftView = paddingView;
        userGetIn.leftViewMode = UITextFieldViewMode.always
        
        passwordGetIn.leftView = UIView(frame:CGRect(x: 0,y: 0,width: 28,height: 20));
        passwordGetIn.leftViewMode = UITextFieldViewMode.always
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

//
//  SignUpViewController.swift
//  Spotify-TESTE
//
//  Created by Lucas Nascimento on 06/03/17.
//  Copyright © 2017 Lucas Nascimento. All rights reserved.
//

import UIKit
//import FacebookLogin

class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var sexo: UITextField!
    @IBOutlet weak var senha: UITextField!
    @IBOutlet weak var usuario: UITextField!
    @IBOutlet weak var nascimento: UITextField!
    
    @IBOutlet weak var facebook: UIButton!
    @IBOutlet weak var singUp: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let paddingView = UIView(frame:CGRect(x: 0,y: 0,width: 28,height: 20))
        
        email.leftView = paddingView;
        email.leftViewMode = UITextFieldViewMode.always
        
        sexo.leftView = UIView(frame:CGRect(x: 0,y: 0,width: 28,height: 20));
        sexo.leftViewMode = UITextFieldViewMode.always
        
        senha.leftView = UIView(frame:CGRect(x: 0,y: 0,width: 28,height: 20));
        senha.leftViewMode = UITextFieldViewMode.always
        
        usuario.leftView = UIView(frame:CGRect(x: 0,y: 0,width: 28,height: 20));
        usuario.leftViewMode = UITextFieldViewMode.always
        
        nascimento.leftView = UIView(frame:CGRect(x: 0,y: 0,width: 28,height: 20));
        nascimento.leftViewMode = UITextFieldViewMode.always
        
        //        var loginButton = LoginButton(readPermissions: [ .publicProfile ])
        //        loginButton.frame = CGRect(x: 0, y: 0, width: 180, height: 40)
        //        loginButton.center = view.center
        //
        //
        //        loginButton = LoginButton(readPermissions: [ .publicProfile, .email, .userFriends ])
        //
        //        view.addSubview(loginButton)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}

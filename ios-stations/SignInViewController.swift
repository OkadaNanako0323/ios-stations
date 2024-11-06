//
//  SignInViewController.swift
//  ios-stations
//
//  Created by 岡田菜々子 on 2024/11/07.
//

import UIKit

class SignInViewController: UIViewController {
    
    

    @IBOutlet weak var signInUserNameTextField: UITextField!
        

    @IBOutlet weak var singInEmailTextField: UITextField!
    
    
    @IBOutlet weak var singInPasswordTextField: UITextField!
    
    
    
    @IBAction func signInTappedButton(_ sender: Any) {
        //サインインメソッドを呼ぶ
        //成功したら画面遷移
        //失敗したらアラート
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}

//
//  LoginViewController.swift
//  ios-stations
//
//  Created by 岡田菜々子 on 2024/11/07.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var loginEmailTextField: UITextField!
    
    
    @IBOutlet weak var loginPasswordTextField: UITextField!
    
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        //ログインメソッドを呼ぶ
        //成功したら画面遷移
        //失敗したらアラート
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

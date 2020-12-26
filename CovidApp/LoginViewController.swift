//
//  LoginViewController.swift
//  CovidApp
//
//  Created by Gustavo Afonso on 17/12/2020.
//

import Foundation
import UIKit
import MapKit
    
class LoginViewController: UIViewController {
    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let receiverVC = segue.destination as! ViewController
        if let text = txtUser.text {
            receiverVC.text = text
        }
    }
    
    @IBAction func btnLogin(_ sender: Any) {
        if txtUser.text == "Usuario" && txtPass.text == "Pass" {
            //nada
        }
        else {
            let alert = UIAlertController(title: "Login Error", message: "Username or Password invalid", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

//
//  ViewController2.swift
//  CovidApp
//
//  Created by Gustavo Afonso on 08/12/2020.
//

import UIKit

class ViewController2: UIViewController {
    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        definesPresentationContext = true
    }
   
    @IBAction func btnLogin(_ sender: Any) {
        if txtUser.text == "1" && txtPass.text == "1" {
            let alert = UIAlertController(title: "Login Correct", message: "Username and Password correct", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else {
            let alert = UIAlertController(title: "Login Error", message: "Username or Password invalid", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}


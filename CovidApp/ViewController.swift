	//
//  ViewController.swift
//  CovidApp
//
//  Created by Gustavo Afonso on 02/12/2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblCoordenadas: UILabel!
    @IBOutlet weak var lblPoblacion: UILabel!
    @IBOutlet weak var lblProvincia: UILabel!
    @IBOutlet weak var txtCP: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
 
    @IBAction func btnComprobar(_ sender: Any, forEvent event: UIEvent) {
        // Leemos el CSV completo
        let poblaciones = Poblaciones.init()
        
        // Rellenamos el array con las poblaciones
        for item in poblaciones.poblaciones{
            if item.codPostal == txtCP.text {
                lblPoblacion.text = item.nombre
                lblCoordenadas.text = String(item.geopos.latitude) + "," + String(item.geopos.longitude)
                lblProvincia.text = item.nombreProvincia
            }
        }
    }

    @IBAction func btnGoToLogin(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Login") as UIViewController
        present(vc, animated: true, completion: nil)
    }
}

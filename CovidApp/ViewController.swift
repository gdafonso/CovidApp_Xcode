	//
//  ViewController.swift
//  CovidApp
//
//  Created by Gustavo Afonso on 02/12/2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblCoordenadas: UILabel!
    @IBOutlet weak var txtCP: UITextField!
    @IBOutlet weak var lblProvincia: UILabel!
    @IBOutlet weak var lblPoblacion: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
 
    @IBAction func btnComprobar(_ sender: Any, forEvent event: UIEvent) {
        // Leemos el CSV completo
        let fichero = LeerCsv.init()
        let listapoblaciones = fichero.poblaciones
        
        // Rellenamos el array con las poblaciones
        for item in listapoblaciones{
            if item.cp == txtCP.text {
                lblPoblacion.text = item.nombre
                lblCoordenadas.text = String(item.geopos.latitude) + "," + String(item.geopos.longitude)
                lblProvincia.text = item.provincia
            }
        }
    }
}

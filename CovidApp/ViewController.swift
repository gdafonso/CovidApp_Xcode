	//
//  ViewController.swift
//  CovidApp
//
//  Created by Gustavo Afonso on 02/12/2020.
//

import UIKit
import MapKit
    
class ViewController: UIViewController {
    
    @IBOutlet weak var lblCoordenadas: UILabel!
    @IBOutlet weak var lblPoblacion: UILabel!
    @IBOutlet weak var lblProvincia: UILabel!
    @IBOutlet weak var lblComunidad: UILabel!
    @IBOutlet weak var txtCP: UITextField!
    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    @IBOutlet weak var mkmvMap: MKMapView!
    
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
                lblProvincia.text = item.nombreProvincia
                lblComunidad.text = item.nombreComunidad
                let annotation = MKPointAnnotation ()
                let region = MKCoordinateRegion( center: item.geopos, latitudinalMeters: CLLocationDistance(exactly: 5000)!, longitudinalMeters: CLLocationDistance(exactly: 5000)!)
                
                annotation.coordinate = item.geopos
                mkmvMap.centerCoordinate = item.geopos
                mkmvMap.addAnnotation(annotation)
                mkmvMap.setRegion(mkmvMap.regionThatFits(region), animated: true)
            }
        }
    }

    @IBAction func btnGoToLogin(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Login") as UIViewController
        present(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func btnLogin(_ sender: Any) {
        if txtUser.text == "1" && txtPass.text == "1" {
            //Nada que hacer
        }
        else {
            let alert = UIAlertController(title: "Login Error", message: "Username or Password invalid", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

	//
//  ViewController.swift
//  CovidApp
//
//  Created by Gustavo Afonso on 02/12/2020.
//

import Foundation
import UIKit
import MapKit
    
class ViewController: UIViewController {
    @IBOutlet weak var lblPoblacion: UILabel!
    @IBOutlet weak var lblProvincia: UILabel!
    @IBOutlet weak var lblComunidad: UILabel!
    @IBOutlet weak var txtCP: UITextField!
    @IBOutlet weak var mkmvMap: MKMapView!
    @IBOutlet weak var lblTest: UILabel!
    @IBOutlet weak var lblToday_confirmed: UILabel!
    @IBOutlet weak var lblToday_deaths: UILabel!
    @IBOutlet weak var lblToday_hospitalised_patients_with_symptoms: UILabel!
    @IBOutlet weak var lblToday_intensive_care: UILabel!
    @IBOutlet weak var lblToday_new_confirmed: UILabel!
    @IBOutlet weak var lblToday_new_deaths: UILabel!
    @IBOutlet weak var lblToday_new_hospitalised_patients_with_symptoms: UILabel!
    @IBOutlet weak var lblToday_new_intensive_care: UILabel!
    @IBOutlet weak var lblToday_new_open_cases: UILabel!
    @IBOutlet weak var lblToday_new_recovered: UILabel!
    @IBOutlet weak var lblToday_new_total_hospitalised_patients: UILabel!
    @IBOutlet weak var lblToday_open_cases: UILabel!
    @IBOutlet weak var lblToday_recovered: UILabel!
    @IBOutlet weak var lblToday_total_hospitalised_patients: UILabel!
    @IBOutlet weak var lblUrl: UILabel!
    
    var text: String!
    var poblaciones: Poblaciones!
    //var DatosComunidadActual: Datos!
    var utilidades = Utilidades()
    var restricciones = [Restricciones]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblTest.text = text + " introduzca un código postal"
        
        // Leemos el CSV completo
        poblaciones = Poblaciones.init()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let receiverTC = segue.destination as! UITabBarController
        let receiverVC = receiverTC.viewControllers!.first as! RestriccionesViewController
        if let prov = lblProvincia.text {
            receiverVC.provincia = prov
        }
        if let comn = lblComunidad.text {
            receiverVC.comunidad = comn
        }
        if let url_enviar = lblUrl.text {
            receiverVC.url = URL(string: url_enviar)
        }
        if restricciones.count != 0 {
            receiverVC.restricciones = restricciones
        }
        
    }
    
    @IBAction func btnComprobar(_ sender: Any, forEvent event: UIEvent) {
        //var DatosComunidadActual = Datos.init()
        var comunidad = ""
        // Comprobamos el array con el código postal
        for item in poblaciones.poblaciones{
            if item.codPostal == txtCP.text {
                lblPoblacion.text = item.nombre
                lblProvincia.text = item.nombreProvincia
                lblComunidad.text = item.nombreComunidad
                comunidad = item.nombreComunidad
                let annotation = MKPointAnnotation ()
                let region = MKCoordinateRegion( center: item.geopos, latitudinalMeters: CLLocationDistance(exactly: 5000)!, longitudinalMeters: CLLocationDistance(exactly: 5000)!)
                
                annotation.coordinate = item.geopos
                mkmvMap.centerCoordinate = item.geopos
                mkmvMap.addAnnotation(annotation)
                mkmvMap.setRegion(mkmvMap.regionThatFits(region), animated: true)
                
                self.restricciones = item.restricciones
            }
        }


        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let query_date = formatter.string(from: date)
        
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: .main)
        let url = URL(string:   "https://api.covid19tracking.narrativa.com/api/" + query_date + "/country/Spain/region/" + comunidad)!
        self.lblUrl.text = url.absoluteString
        let task = session.dataTask(with: url, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
                guard let data = data else {
                    //completion(nil)
                    return
                }
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    if let dates = json?["dates"] as? [String: Any]{
                        if let day = dates[query_date] as? [String: Any] {
                            if let countries = day["countries"] as? [String: Any] {
                                if let country = countries["Spain"] as? [String: Any] {
                                    if let regions = country["regions"] as? NSArray {
                                        for region in regions {
                                            if let regiontemp = region as? [String: Any] {
                                                    self.lblToday_confirmed.text = String(regiontemp["today_confirmed"] as? Int64 ?? 0)
                                                    self.lblToday_deaths.text = String(regiontemp["today_deaths"] as? Int64 ?? 0)
                                                    self.lblToday_intensive_care.text = String(regiontemp["today_intensive_care"] as? Int64 ?? 0)
                                                    self.lblToday_new_confirmed.text = String(regiontemp["today_new_confirmed"] as? Int64 ?? 0)
                                                    self.lblToday_new_deaths.text = String(regiontemp["today_new_deaths"] as? Int64 ?? 0)
                                                    self.lblToday_new_intensive_care.text = String(regiontemp["today_new_intensive_care"] as? Int64 ?? 0)
                                                    self.lblToday_new_open_cases.text = String(regiontemp["today_new_open_cases"] as? Int64 ?? 0)
                                                    self.lblToday_new_recovered.text = String(regiontemp["today_new_recovered"] as? Int64 ?? 0)
                                                    self.lblToday_new_total_hospitalised_patients.text = String(regiontemp["today_new_total_hospitalised_patients"] as? Int64 ?? 0)
                                                    self.lblToday_open_cases.text = String(regiontemp["today_open_cases"] as? Int64 ?? 0)
                                                    self.lblToday_recovered.text = String(regiontemp["today_recovered"] as? Int64 ?? 0)
                                                    self.lblToday_total_hospitalised_patients.text = String(regiontemp["today_total_hospitalised_patients"] as? Int64 ?? 0)
                                            }
                                        }
                                    }
                                }
                                
                            }
                        }
                    }
                    //print(result)
                } catch { print(error) }
            })
        task.resume()
        
        /*let DatosComunidadActual = utilidades.DatosComunidad(comunidad: comunidad)
        /*DatosComunidadActual = utilidades.DatosComunidad (comunidad: lblComunidad.text)*/
        self.lblToday_confirmed.text = String(DatosComunidadActual.today_confirmed)
        self.lblToday_deaths.text = String(DatosComunidadActual.today_deaths)
        self.lblToday_intensive_care.text = String(DatosComunidadActual.today_intensive_care)
        self.lblToday_new_confirmed.text = String(DatosComunidadActual.today_new_confirmed)
        self.lblToday_new_deaths.text = String(DatosComunidadActual.today_new_deaths)
        self.lblToday_new_intensive_care.text = String(DatosComunidadActual.today_new_intensive_care)
        self.lblToday_new_open_cases.text = String(DatosComunidadActual.today_new_open_cases)
        self.lblToday_new_recovered.text = String(DatosComunidadActual.today_new_recovered)
        self.lblToday_new_total_hospitalised_patients.text = String(DatosComunidadActual.today_new_total_hospitalised_patients)
        self.lblToday_open_cases.text = String(DatosComunidadActual.today_open_cases)
        self.lblToday_recovered.text = String(DatosComunidadActual.today_recovered)
        self.lblToday_total_hospitalised_patients.text = String(DatosComunidadActual.today_total_hospitalised_patients)*/
        
    }
}

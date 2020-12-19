	//
//  ViewController.swift
//  CovidApp
//
//  Created by Gustavo Afonso on 02/12/2020.
//

import UIKit
import MapKit
    
    struct User {
        let name: Int?
        let profileImageURL: URL?
        let reputation: Int?
    }
     
    extension User: Decodable {
        enum CodingKeys: String, CodingKey {
            case reputation
            case name = "today_confirmed"
            case profileImageURL = "profile_image"
        }
    }
     
    struct Question {
        let score: Int
        let title: String
        let date: Int
        let tags: [String]
        let owner: User?
    }
     
    extension Question: Decodable {
        enum CodingKeys: String, CodingKey {
            case score
            case title
            case tags
            case owner
            case date = "today_confirmed"
        }
    }
     
    struct Wrapper: Decodable {
        let items: [Question]
    }
    
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
    
    var text: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblTest.text = text + " introduzca un código postal"
        }
    
    @IBAction func btnComprobar(_ sender: Any, forEvent event: UIEvent) {
        // Leemos el CSV completo
        let poblaciones = Poblaciones.init()
        
        // Rellenamos el array con	 las poblaciones
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


        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let query_date = formatter.string(from: date)
        
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: .main)
        let url = URL(string:   "https://api.covid19tracking.narrativa.com/api/" + query_date + "/country/Spain/region/Canarias")!
        let task = session.dataTask(with: url, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
                guard let data = data else {
                    //completion(nil)
                    return
                }
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                decoder.dateDecodingStrategy = .iso8601
                do {
                    let result = try decoder.decode(Root.self, from: data)
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    if let dates = json?["dates"] as? [String: Any]{
                        if let day = dates[query_date] as? [String: Any] {
                            if let countries = day["countries"] as? [String: Any] {
                                if let country = countries["Spain"] as? [String: Any] {
                                    if let regions = country["regions"] as? NSArray {
                                        for region in regions {
                                            if let regiontemp = region as? [String: Any] {
                                                //if regiontemp["id"] {
                                                    self.lblToday_confirmed.text = String(regiontemp["today_confirmed"] as? Int64 ?? 0)
                                                    self.lblToday_deaths.text = String(regiontemp["today_deaths"] as? Int64 ?? 0)
                                                    self.lblToday_hospitalised_patients_with_symptoms.text = String(regiontemp["today_hospitalised_patients_with_symptoms"] as? Int64 ?? 0)
                                                    self.lblToday_intensive_care.text = String(regiontemp["today_intensive_care"] as? Int64 ?? 0)
                                                    self.lblToday_new_confirmed.text = String(regiontemp["today_new_confirmed"] as? Int64 ?? 0)
                                                    self.lblToday_new_deaths.text = String(regiontemp["today_new_deaths"] as? Int64 ?? 0)
                                                    self.lblToday_new_hospitalised_patients_with_symptoms.text = String(regiontemp["today_new_hospitalised_patients_with_symptoms"] as? Int64 ?? 0)
                                                    self.lblToday_new_intensive_care.text = String(regiontemp["today_new_intensive_care"] as? Int64 ?? 0)
                                                    self.lblToday_new_open_cases.text = String(regiontemp["today_new_open_cases"] as? Int64 ?? 0)
                                                    self.lblToday_new_recovered.text = String(regiontemp["today_new_recovered"] as? Int64 ?? 0)
                                                    self.lblToday_new_total_hospitalised_patients.text = String(regiontemp["today_new_total_hospitalised_patients"] as? Int64 ?? 0)
                                                    self.lblToday_open_cases.text = String(regiontemp["today_open_cases"] as? Int64 ?? 0)
                                                    self.lblToday_recovered.text = String(regiontemp["today_recovered"] as? Int64 ?? 0)
                                                    self.lblToday_total_hospitalised_patients.text = String(regiontemp["today_total_hospitalised_patients"] as? Int64 ?? 0)
                                                //}
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
    }
}

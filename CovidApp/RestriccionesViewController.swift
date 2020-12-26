//
//  RestriccionesViewController.swift
//  CovidApp
//
//  Created by Gustavo Afonso on 23/12/2020.
//

import Foundation
import UIKit

class RestriccionesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var comunidad: String!
    var provincia: String!
    var restricciones = [Restricciones]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return restricciones.count
    }
     
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestriccionCell", for: indexPath) as! TableViewCell
     
        cell.labelCell.text = restricciones[indexPath.row].tipo
        cell.labelCell2.text = restricciones[indexPath.row].descripcion
        cell.imageCell.image = UIImage(named: restricciones[indexPath.row].imagen)
     
        return cell
    }
}

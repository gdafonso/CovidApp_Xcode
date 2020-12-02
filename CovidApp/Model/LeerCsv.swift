//
//  LeerCsv.swift
//  CovidApp
//
//  Created by Gustavo Afonso on 02/12/2020.
//

import Foundation
import CoreLocation

class LeerCsv  {
    
    let defaultValue = 0.0
        
    var poblaciones = [Poblacion]()
    
    func CSVtoArray(){
        
        guard let filepath = Bundle.main.path(forResource: "poblaciones", ofType: "csv") else { return }
    
        var data = ""
        do{
            data = try String(contentsOfFile: filepath, encoding: .utf8)
        } catch {
            print(error)
            return
        }
    
        let rows = data.components(separatedBy: "\n")
    
        for row in rows{
            let columns = row.components(separatedBy: ";")
    
            if columns.count == 4 {
                let nombre = columns[0]
                let postal = columns[1]
                let geopos = CLLocationCoordinate2DMake(Double(columns[2]) ?? 0.0,Double(columns[3]) ?? 0.0)
                let provincia = columns[4]
            
                let poblacion = Poblacion (nombre: nombre, cp: postal, geopos: geopos, provincia: provincia)
                    
                poblaciones.append(poblacion)
            }
        }
    }

    init(){
        CSVtoArray()
    }
}

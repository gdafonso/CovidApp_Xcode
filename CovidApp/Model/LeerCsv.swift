//
//  LeerCsv.swift
//  CovidApp
//
//  Created by Gustavo Afonso on 02/12/2020.
//

import Foundation
import CoreLocation

class LeerCsv  {
    // Creamos el array de poblaciones
    var poblaciones = [Poblacion]()
    
    // Función para guardar los datos en el array
    func CSVtoArray(){
        // Definición del archivo
        guard let filepath = Bundle.main.path(forResource: "poblaciones", ofType: "csv") else { return }
        
        // Intentamos leer el archivo
        var data = ""
        do{
            data = try String(contentsOfFile: filepath, encoding: .utf8)
        } catch {
            print(error)
            return
        }
        
        // Separamos las filas
        let rows = data.components(separatedBy: "\n")
    
        // Por cada fila encontrada
        for row in rows{
            // Separamos las columnas
            let columns = row.components(separatedBy: ";")

            // Si tenemos 5 columnas que es el valor esperado
            if columns.count == 5 {
                // Guardamos las distintas columnas en los atributos que corresponden
                let nombre = columns[1]
                let cp = columns[2]
                let geopos = CLLocationCoordinate2DMake(Double(columns[3].replacingOccurrences(of: ",", with: ".", options: .literal, range: nil)) ?? 0.0,Double(columns[4].replacingOccurrences(of: ",", with: ".", options: .literal, range: nil)) ?? 0.0)
                let provincia = columns[0]
            
                // Creamos la población con todos sus atributos
                let poblacion = Poblacion (nombre: nombre, cp: cp, geopos: geopos, provincia: provincia)
                    
                // Añadimos la población al array
                poblaciones.append(poblacion)
            }
        }
    }

    /// Inicializador desginado
    init(){
        /// Llamada a la función para guardar los datos
        CSVtoArray()
    }
}

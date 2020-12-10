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
        guard let filepath = Bundle.main.path(forResource: "PoblacionesFull", ofType: "csv") else { return }
        
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
            if columns.count == 10 {
                // Guardamos las distintas columnas en los atributos que corresponden
                let codAutonomia = columns[0]
                let codProvincia = columns[1]
                let codMunicipio = columns[2]
                let codDc = columns[3]
                let codIne = columns[4]
                let codPostal = columns[5]
                let nombre = columns[6]
                let nombreComunidad = columns[7]
                let nombreProvincia = columns[8]
                let coordenadas: [String]
                var latitud = ""
                var longitud = ""
                //let coordenadas = columns[9].components(separatedBy: ", ")
                if (columns[9].components(separatedBy: ", ")).count == 2 {
                    coordenadas = columns[9].components(separatedBy: ", ")
                    latitud = coordenadas[0].replacingOccurrences(of: ",", with: ".", options: .literal, range: nil)
                    longitud = coordenadas[1].replacingOccurrences(of: ",", with: ".", options: .literal, range: nil)
                    longitud = String(longitud.dropLast(2))
                }
                else {
                    coordenadas = ["0","0"]
                }
                let geopos = CLLocationCoordinate2DMake(Double(latitud) ?? 0.0,Double(longitud) ?? 0.0)
            
                // Creamos la población con todos sus atributos
                let poblacion = Poblacion (codAutonomia: codAutonomia, codProvincia: codProvincia, codMunicipio: codMunicipio, codDc: codDc, codIne: codIne, codPostal: codPostal, nombre: nombre, nombreComunidad: nombreComunidad, nombreProvincia: nombreProvincia, geopos: geopos)
                    
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

//
//  Utilidades.swift
//  CovidApp
//
//  Created by Gustavo Afonso on 23/12/2020.
//

import Foundation
import CoreLocation
import SwiftUI

public class Utilidades {
    // atributo que contiene una matriz de cada población
    var poblaciones = [Poblacion]()
    var datos = Datos()
    
    func DatosComunidad (comunidad: String) -> Datos {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let query_date = formatter.string(from: date)
        
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: .main)
        let url = URL(string: "https://api.covid19tracking.narrativa.com/api/" + query_date + "/country/Spain/region/" + comunidad)!
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
                                                self.datos = Datos (comunidad: comunidad, today_confirmed: regiontemp["today_confirmed"] as? Int64 ?? 0, today_deaths: regiontemp["today_deaths"] as? Int64 ?? 0, today_intensive_care: regiontemp["today_intensive_care"] as? Int64 ?? 0, today_new_confirmed: regiontemp["today_new_confirmed"] as? Int64 ?? 0, today_new_deaths: regiontemp["today_new_deaths"] as? Int64 ?? 0, today_new_intensive_care: regiontemp["today_new_intensive_care"] as? Int64 ?? 0, today_new_open_cases: regiontemp["today_new_open_cases"] as? Int64 ?? 0, today_new_recovered: regiontemp["today_new_recovered"] as? Int64 ?? 0, today_new_total_hospitalised_patients: regiontemp["today_new_total_hospitalised_patients"] as? Int64 ?? 0, today_open_cases: regiontemp["today_open_cases"] as? Int64 ?? 0, today_recovered: regiontemp["today_recovered"] as? Int64 ?? 0, today_total_hospitalised_patients: regiontemp["today_total_hospitalised_patients"] as? Int64 ?? 0)
                                            }
                                        }
                                    }
                                }
                                
                            }
                        }
                    }
                } catch { print(error) }
            })
        task.resume()
        return datos
    }
    
    // Función para guardar los datos en el array
    func CSVtoArray() {
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
                
                var restricciones: [Restricciones] = []
                
                for _ in 1...3 {
                    let restrict = creaRestriccion(id: Int(columns[5]) ?? 0)
                    restricciones.append(restrict)
                }
            
                // Creamos la población con todos sus atributos
                let poblacion = Poblacion (codAutonomia: columns[0], codProvincia: columns[1], codMunicipio: columns[2], codDc: columns[3], codIne: columns[4], codPostal: columns[5], nombre: columns[6], nombreComunidad: columns[7], nombreProvincia: columns[8], geopos: CLLocationCoordinate2DMake(Double(latitud) ?? 0.0,Double(longitud) ?? 0.0), restricciones: restricciones)
                    
                // Añadimos la población al array
                poblaciones.append(poblacion)
            }
        }
    }
    
    /*
         Método que crea un objeto de tipo restricción
         que será añadido a la ciudad que se está creando
         */
    func creaRestriccion(id: Int) -> Restricciones {
            
        // Obtenemos aleatoriamente el tipo de restricción
        let tipoRest = Restriccion.get
        var desc: String = ""
        var imagen: String = ""
                
        // Según el tipo de restricción que hemos
        // obtenido asociamos una descripción
        switch tipoRest{
            case "Protección":
                desc = "Se necesitan medidas de protección adicionales"
                imagen = "mujer-mascara-medica-equipaje-smartphone-mientras-sube-escaleras-pandemia_23-2148789873.jpg"
            case "Temporales":
                desc = "Toque de queda a las 22:00"
                imagen =  "covid-19-concepto-salud-distanciamiento-social-chica-morena-atractiva-mascara-medica-que-senala-dedo-cara-blanco_1258-19147.jpg"
            case "Restauracion":
                desc = "La hostelería debe cerrar a las 18:00"
                imagen = "dos-colegas-tocandose-codos-al-aire-libre-pandemia_23-2148666394.jpg"
            case "Reuniones":
                desc = "La reuniones se limitan a un máximo de seis personas"
                imagen = "vista-frontal-joven-mujer-sosteniendo-globos-colores_179666-8916.jpg"
            case "Otros":
                desc = "Otras restricciones"
                imagen = "doctor-sostenga-antiseptico-mascaras-su-mano_1157-31550.jpg"
            default:
                desc = ""
        }
                
        // Variable que almacena los campos de la restricción
        let restriccion = Restricciones(id: id, tipo: tipoRest, descripcion: desc, imagen: imagen)
            
        return restriccion
    }
    
    init(){
            CSVtoArray()
    }
    
}

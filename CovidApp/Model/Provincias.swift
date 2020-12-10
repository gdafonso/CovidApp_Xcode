//
//  Provincias.swift
//  CovidApp
//
//  Created by Gustavo Afonso on 02/12/2020.
//

import Foundation

class DatosProvincias {        
    init() {
        var provincias = [Provincia]()
        // Leemos el CSV completo
        let poblaciones = Poblaciones.init()
        
        // Rellenamos el array con las provincias (falta comprobar que no se repitan)
        for item in poblaciones.poblaciones {
            let provincia = Provincia(casosNuevos: Int.random(in: 0...500), casosTotales: Int.random(in: 0...10000), fallecidos: Int.random(in: 0...200), hospitalizados: Int.random(in: 0...500), uci: Int.random(in: 0...100), provincia: item.nombreProvincia)
            provincias.append(provincia)
        }
    }
    
}

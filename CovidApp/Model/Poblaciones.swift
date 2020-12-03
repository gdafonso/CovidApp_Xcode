//
//  Poblaciones.swift
//  CovidApp
//
//  Created by Gustavo Afonso on 02/12/2020.
//

import Foundation

class Poblaciones {
    // Definición de la colección de poblaciones de tipo población
    private var _poblaciones: [Poblacion] = []
    
    // Métodos para la colección
    var poblaciones: [Poblacion] {
        get {
            return _poblaciones
        }
        set {
            return _poblaciones = newValue
        }
    }

    // Incializador desginado
    init() {
        // Lectura del fichero CSV con los datos
        let fichero = LeerCsv.init()
        
        // Para cada población
        for item in fichero.poblaciones {
            //poblaciones.append(item)
        }
    }    
}

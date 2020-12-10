//
//  Poblaciones.swift
//  CovidApp
//
//  Created by Gustavo Afonso on 02/12/2020.
//

import Foundation

/// Clase Poblaciones que define el conjunto de poblaciones
class Poblaciones {
    /// Definición de la colección de poblaciones de tipo población
    private var _poblaciones: [Poblacion] = []
    
    /// Métodos para la colección de poblaciones
    var poblaciones: [Poblacion] {
        /// Método get
        get {
            return _poblaciones
        }
        /// Método set
        set {
            return _poblaciones = newValue
        }
    }

    /// Incializador desginado
    init() {
        /// Lectura del fichero CSV con los datos
        let fichero = LeerCsv.init()
        
        /// Para cada población
        for item in fichero.poblaciones {
            // TODO: Completar acción
            //poblaciones.append(item)
        }
    }    
}

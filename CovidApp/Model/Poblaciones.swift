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
    private var _poblaciones = [Poblacion]()
    
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

    /// Inicializador desginado
    init(){
        /// Llamada a la función para guardar los datos
        let p = Utilidades.init()
        let lista = p.poblaciones
                
        // Rellenamos el array con las poblaciones
        for item in lista{
            poblaciones.append(item)
        }
    }
}

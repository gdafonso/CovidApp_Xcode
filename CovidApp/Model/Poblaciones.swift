//
//  Poblaciones.swift
//  CovidApp
//
//  Created by Gustavo Afonso on 02/12/2020.
//

import Foundation

class Poblaciones {
    private var _lista: [Poblacion]
    
    var lista: [Poblacion] {
        get {
            return _lista
        }
        set {
            return _lista = newValue
        }
    }

    init() {
        //cargar fichero CSV con poblacion y provincia
        
    }
}

//
//  Poblaciones.swift
//  CovidApp
//
//  Created by Gustavo Afonso on 02/12/2020.
//

import Foundation

class Poblaciones {
    private var _poblaciones: [Poblacion] = []
    
    var poblaciones: [Poblacion] {
        get {
            return _poblaciones
        }
        set {
            return _poblaciones = newValue
        }
    }

    init() {
        //cargar fichero CSV con poblacion y provincia
        let fichero = LeerCsv.init()
        let listapoblaciones = fichero.poblaciones
        
        for item in listapoblaciones {
            //poblaciones.append(item)
        }
    }
}

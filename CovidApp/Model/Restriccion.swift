//
//  Restriccion.swift
//  CovidApp
//
//  Created by Gustavo Afonso on 03/12/2020.
//

import Foundation

enum Restriccion {
    case Temporal
    case Restauracion
    case Reuniones
    case Proteccion
    case Otros
    
    init() {
        self = .Otros
    }
}

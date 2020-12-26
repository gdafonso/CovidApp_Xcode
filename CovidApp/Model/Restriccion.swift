//
//  Restriccion.swift
//  CovidApp
//
//  Created by Gustavo Afonso on 03/12/2020.
//

import Foundation

enum Restriccion: String, CaseIterable {
    // Atributtos de la clase de tipo Enum
    case Temporal = "Temporales"
    case Restauracion = "Restauración"
    case Reuniones = "Reuniones"
    case Proteccion = "Protección"
    case Otros = "Otros"
    
    static var get: String{
            return allCases.randomElement()!.rawValue
        }
    
    init() {
        self = Restriccion.Otros
    }
}

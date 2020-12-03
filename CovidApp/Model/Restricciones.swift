//
//  Restricciones.swift
//  CovidApp
//
//  Created by Gustavo Afonso on 02/12/2020.
//

import Foundation

class Restricciones{
    private var _id: Int = 0
    private var _tipo: Restriccion
    private var _descripcion: String = ""
    
    var id: Int {
        get{
            return _id
        }
        set{
            return _id = newValue
        }
    }
    var descripcion: String {
        get{
            return _descripcion
        }
        set{
            return _descripcion = newValue
        }
    }
    var tipo: Restriccion {
        get{
            return _tipo
        }
        set{
            return _tipo = newValue
        }
    }
    
    internal init(id: Int, tipo: Restriccion, descripcion: String) {
        self._id = id
        self._tipo = tipo
        self._descripcion = descripcion
    }
}

//
//  Restricciones.swift
//  CovidApp
//
//  Created by Gustavo Afonso on 02/12/2020.
//

import Foundation

class Restricciones{
    // Atributos de la clase
    private var _id: Int = 0
    private var _tipo: String
    private var _descripcion: String = ""
    private var _imagen: String = ""
    
    // Métodos para el atributo id
    var id: Int {
        get{
            return _id
        }
        set{
            return _id = newValue
        }
    }
    
    // Métodos para el atributo descripcion
    var descripcion: String {
        get{
            return _descripcion
        }
        set{
            return _descripcion = newValue
        }
    }
    
    // Métodos para el atributo tipo
    var tipo: String {
        get{
            return _tipo
        }
        set{
            return _tipo = newValue
        }
    }
    
    var imagen: String {
        get{
            return _imagen
        }
        set{
            return _imagen = newValue
        }
    }
    
    //Inicializador designado
    internal init(id: Int, tipo: String, descripcion: String, imagen: String) {
        self._id = id
        self._tipo = tipo
        self._descripcion = descripcion
        self._imagen = imagen
    }
    
    //Inicializador de conveniencia
    convenience init () {
        self.init (id: 0, tipo: "Otros", descripcion: "", imagen: "")
    }
}

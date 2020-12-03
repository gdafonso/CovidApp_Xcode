//
//  Provincia.swift
//  CovidApp
//
//  Created by Gustavo Afonso on 02/12/2020.
//

import Foundation

class Provincia{
    // Atributos de la clase
    private var _casosNuevos: Int
    private var _casosTotales: Int
    private var _fallecidos: Int
    private var _hospitalizados: Int
    private var _uci: Int    
    private var _provincia: String
    
    // Métodos para el atributo casosNuevos
    var casosNuevos: Int {
        get{
            return _casosNuevos
        }
        set{
            return _casosNuevos = newValue
        }
    }
    
    // Métodos para el atributo casosTotales
    var casosTotales: Int {
        get{
            return _casosTotales
        }
        set{
            return _casosTotales = newValue
        }
    }
    
    // Métodos para el atributo fallecidos
    var fallecidos: Int {
        get{
            return _fallecidos
        }
        set{
            return _fallecidos = newValue
        }
    }
    
    // Métodos para el atributo hospitalizados
    var hospitalizados: Int {
        get{
            return _hospitalizados
        }
        set{
            return _hospitalizados = newValue
        }
    }
    
    // Métodos para el atributo uci
    var uci: Int {
        get{
            return _uci
        }
        set{
            return _uci = newValue
        }
    }
    
    // Métodos para el atributo provincia
    var provincia: String {
        get{
            return _provincia
        }
        set{
            return _provincia = newValue
        }
    }
    
    //Inicializador designado
    init(casosNuevos: Int, casosTotales: Int, fallecidos: Int, hospitalizados: Int, uci: Int, provincia: String) {
        // Guardamos datos aleatorios en cada una de los atributos
        self._casosNuevos = Int.random(in: 0...500)
        self._casosTotales = Int.random(in: 0...10000)
        self._fallecidos = Int.random(in: 0...200)
        self._hospitalizados = Int.random(in: 0...500)
        self._uci = Int.random(in: 0...100)
        self._provincia = provincia
    }
    
    //Inicializador de conveniencia
    convenience init () {
        self.init (casosNuevos: 0, casosTotales: 0, fallecidos: 0, hospitalizados: 0, uci: 0, provincia: "")
    }
}

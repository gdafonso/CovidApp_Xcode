//
//  Provincia.swift
//  CovidApp
//
//  Created by Gustavo Afonso on 02/12/2020.
//

import Foundation

class Provincia{
    
    private var _casosNuevos: Int
    private var _casosTotales: Int
    private var _fallecidos: Int
    private var _hospitalizados: Int
    private var _uci: Int
    
    private var _provincias: [String] = []
    
    var casosNuevos: Int {
        get{
            return _casosNuevos
        }
        set{
            return _casosNuevos = newValue
        }
    }
    var casosTotales: Int {
        get{
            return _casosTotales
        }
        set{
            return _casosTotales = newValue
        }
    }
    var fallecidos: Int {
        get{
            return _fallecidos
        }
        set{
            return _fallecidos = newValue
        }
    }
    var hospitalizados: Int {
        get{
            return _hospitalizados
        }
        set{
            return _hospitalizados = newValue
        }
    }
    var uci: Int {
        get{
            return _uci
        }
        set{
            return _uci = newValue
        }
    }
    
    var provincias: [String] {
        get{
            return _provincias
        }
        set{
            return _provincias = newValue
        }
    }
    
    init(casosNuevos: Int, casosTotales: Int, fallecidos: Int, hospitalizados: Int, uci: Int) {
        
        self._casosNuevos = Int.random(in: 0...50)
        self._casosTotales = Int.random(in: 0...100)
        self._fallecidos = Int.random(in: 0...50)
        self._hospitalizados = Int.random(in: 0...80)
        self._uci = Int.random(in: 0...30)
        
        // Leemos el CSV completo
        let fichero = LeerCsv.init()
        let listapoblaciones = fichero.poblaciones
        
        // Rellenamos el array con las poblaciones
        for item in listapoblaciones{
            provincias.append(item.provincia)
        }
    }
}

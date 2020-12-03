//
//  Poblacion.swift
//  CovidApp
//
//  Created by Gustavo Afonso on 02/12/2020.
//

import Foundation
import CoreLocation

class Poblacion {
    // Atributos de la clase
    private var _nombre: String
    private var _cp: String
    private var _geopos: CLLocationCoordinate2D //Tipo CLLocation para guardar las coordenadas lat y lon
    private var _provincia: String
    
    // Métodos para el atributo nombre
    var nombre: String {
        get {
            return _nombre
        }
        set {
            return _nombre = newValue
        }
    }

    // Métodos para el atributo código postal
    var cp: String {
        get {
            return _cp
        }
        set {
            return _cp = newValue
        }
    }
    
    // Métodos para el atributo de las coordenadas
    var geopos: CLLocationCoordinate2D {
        get {
            return _geopos
        }
        set {
            return _geopos = newValue
        }
    }
    
    // Métodos para el atributo provincia
    var provincia: String {
        get {
            return _provincia
        }
        set {
            return _provincia = newValue
        }
    }

    // Inicializador designado
    init (nombre: String, cp: String, geopos: CLLocationCoordinate2D, provincia: String) {
        self._nombre = nombre
        self._cp = cp
        self._geopos = geopos
        self._provincia = provincia
    }
    
    // Inicializador de conveniencia
    convenience init() {
        self.init(nombre: "", cp: "", geopos: CLLocationCoordinate2DMake(0.0, 0.0), provincia: "")
        }

}

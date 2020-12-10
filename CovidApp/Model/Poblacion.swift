//
//  Poblacion.swift
//  CovidApp
//
//  Created by Gustavo Afonso on 02/12/2020.
//

import Foundation
import CoreLocation

//
// MARK: - Clase Población
//

/// Clase Población de que define los datos de la población elegida
class Poblacion {
    /// Nombre de la población
    private var _nombre: String
    /// Código postal de la población
    private var _cp: String
    /// Coordenadas de la población en 2D (latitud y longitud)
    private var _geopos: CLLocationCoordinate2D
    /// Provincia a la que pertenece la población
    private var _provincia: String
    
    /// Definición de los métodos para el atributo nombre
    var nombre: String {
        /// Método get
        get {
            return _nombre
        }
        /// Método set
        set {
            return _nombre = newValue
        }
    }

    /// Definición de los métodos para el atributo código postal
    var cp: String {
        /// Método get
        get {
            return _cp
        }
        /// Método set
        set {
            return _cp = newValue
        }
    }
    
    /// Definición de los métodos para el atributo de las coordenadas
    var geopos: CLLocationCoordinate2D {
        /// Método get
        get {
            return _geopos
        }
        /// Método set
        set {
            return _geopos = newValue
        }
    }
    
    /// Definición de los métodos para el atributo provincia
    var provincia: String {
        /// Método get
        get {
            return _provincia
        }
        /// Método set
        set {
            return _provincia = newValue
        }
    }

    /**
     Inicializador designado
     
     Establece los datos pasados como parámetros
     
     - Parameters:
        - nombre: String que indica el nombre de la población
        - cp: String con el código postal de la población
        - geopos: CLLocation de coordenadas 2D que indica la latitud y longitud de la población
        - provincia: String con la provincia a la que pertenece la población
    */
    init (nombre: String, cp: String, geopos: CLLocationCoordinate2D, provincia: String) {
        /// Asignación de valores
        self._nombre = nombre
        self._cp = cp
        self._geopos = geopos
        self._provincia = provincia
    }
    
    /**
        Inicializador de conveniencia
        
        No lleva parámetros
    */
    convenience init() {
        // Asignación de parámetros por defecto
        self.init(nombre: "", cp: "", geopos: CLLocationCoordinate2DMake(0.0, 0.0), provincia: "")
        }

}

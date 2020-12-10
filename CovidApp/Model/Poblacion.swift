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
    private var _codAutonomia: String
    private var _codProvincia: String
    private var _codMunicipio: String
    private var _codDc: String
    private var _codIne: String
    private var _codPostal: String
    private var _nombre: String
    private var _nombreComunidad: String
    private var _nombreProvincia: String
    private var _geopos: CLLocationCoordinate2D
    
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
    var codPostal: String {
        /// Método get
        get {
            return _codPostal
        }
        /// Método set
        set {
            return _codPostal = newValue
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
    var nombreProvincia: String {
        /// Método get
        get {
            return _nombreProvincia
        }
        /// Método set
        set {
            return _nombreProvincia = newValue
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
    init (codAutonomia: String, codProvincia: String, codMunicipio: String, codDc: String, codIne: String, codPostal: String, nombre: String, nombreComunidad: String, nombreProvincia: String, geopos: CLLocationCoordinate2D) {
        /// Asignación de valores
        self._codAutonomia = codAutonomia
        self._codProvincia = codProvincia
        self._codMunicipio = codMunicipio
        self._codDc = codDc
        self._codIne = codIne
        self._codPostal = codPostal
        self._nombre = nombre
        self._nombreComunidad = nombreComunidad
        self._nombreProvincia = nombreProvincia
        self._geopos = geopos
    }
    
    /**
        Inicializador de conveniencia
        
        No lleva parámetros
    */
    convenience init() {
        // Asignación de parámetros por defecto
        self.init(codAutonomia: "", codProvincia: "", codMunicipio: "", codDc: "", codIne: "", codPostal: "", nombre: "", nombreComunidad: "", nombreProvincia: "", geopos: CLLocationCoordinate2DMake(0.0, 0.0))
        }

}

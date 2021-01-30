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
    private var _url: URL
    private var _geopos: CLLocationCoordinate2D
    private var _restricciones:[Restricciones]
    
    /// Definición de los métodos para el atributo nombre
    var codAutonomia: String {
        /// Método get
        get {
            return _codAutonomia
        }
        /// Método set
        set {
            return _codAutonomia = newValue
        }
    }
    
    /// Definición de los métodos para el atributo nombre
    var codProvincia: String {
        /// Método get
        get {
            return _codProvincia
        }
        /// Método set
        set {
            return _codProvincia = newValue
        }
    }
    
    /// Definición de los métodos para el atributo nombre
    var codMunicipio: String {
        /// Método get
        get {
            return _codMunicipio
        }
        /// Método set
        set {
            return _codMunicipio = newValue
        }
    }

    /// Definición de los métodos para el atributo nombre
    var codDc: String {
        /// Método get
        get {
            return _codDc
        }
        /// Método set
        set {
            return _codDc = newValue
        }
    }
    
    /// Definición de los métodos para el atributo nombre
    var codIne: String {
        /// Método get
        get {
            return _codIne
        }
        /// Método set
        set {
            return _codIne = newValue
        }
    }
    
    /// Definición de los métodos para el atributo nombre
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

    /// Definición de los métodos para el atributo nombre
    var nombreComunidad: String {
        /// Método get
        get {
            return _nombreComunidad
        }
        /// Método set
        set {
            return _nombreComunidad = newValue
        }
    }
    
    /// Definición de los métodos para el atributo nombre
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
    
    /// Definición de los métodos para el atributo URL
    var url: URL {
        /// Método get
        get {
            return _url
        }
        /// Método set
        set {
            return _url = newValue
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
    
    var restricciones:[Restricciones] {
            get{
                return _restricciones
            }
            set {
                return _restricciones = newValue
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
    init (codAutonomia: String, codProvincia: String, codMunicipio: String, codDc: String, codIne: String, codPostal: String, nombre: String, nombreComunidad: String, nombreProvincia: String, url: URL, geopos: CLLocationCoordinate2D, restricciones: [Restricciones]) {
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
        self._url = url
        self._geopos = geopos
        self._restricciones = restricciones
    }
    
    /**
        Inicializador de conveniencia
        
        No lleva parámetros
    */
    convenience init() {
        // Asignación de parámetros por defecto
        self.init(codAutonomia: "", codProvincia: "", codMunicipio: "", codDc: "", codIne: "", codPostal: "", nombre: "", nombreComunidad: "", nombreProvincia: "", url: URL(string: "")!, geopos: CLLocationCoordinate2DMake(0.0, 0.0), restricciones: [])
        }

}

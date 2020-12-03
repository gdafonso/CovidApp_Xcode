//
//  Poblacion.swift
//  CovidApp
//
//  Created by Gustavo Afonso on 02/12/2020.
//

import Foundation
import CoreLocation

class Poblacion {
    private var _nombre: String
    private var _cp: String
    private var _geopos: CLLocationCoordinate2D
    private var _provincia: String
    
    var nombre: String {
        get {
            return _nombre
        }
        set {
            return _nombre = newValue
        }
    }

    var cp: String {
        get {
            return _cp
        }
        set {
            return _cp = newValue
        }
    }
    
    var geopos: CLLocationCoordinate2D {
        get {
            return _geopos
        }
        set {
            return _geopos = newValue
        }
    }

    var provincia: String {
        get {
            return _provincia
        }
        set {
            return _provincia = newValue
        }
    }

    init (nombre: String, cp: String, geopos: CLLocationCoordinate2D, provincia: String) {
        self._nombre = nombre
        self._cp = cp
        self._geopos = geopos
        self._provincia = provincia
    }
    

}

//
//  Datos.swift
//  CovidApp
//
//  Created by Gustavo Afonso on 23/12/2020.
//

class Datos{
    // Atributos de la clase
    private var _comunidad: String
    private var _today_confirmed: Int64
    private var _today_deaths: Int64
    private var _today_intensive_care: Int64
    private var _today_new_confirmed: Int64
    private var _today_new_deaths: Int64
    private var _today_new_intensive_care: Int64
    private var _today_new_open_cases: Int64
    private var _today_new_recovered: Int64
    private var _today_new_total_hospitalised_patients: Int64
    private var _today_open_cases: Int64
    private var _today_recovered: Int64
    private var _today_total_hospitalised_patients: Int64
    
    // Métodos para el atributo provincia
    var comunidad: String {
        get{
            return _comunidad
        }
        set{
            return _comunidad = newValue
        }
    }
    
    var today_confirmed: Int64 {
        get{
            return _today_confirmed
        }
        set{
            return _today_confirmed = newValue
        }
    }
    var today_deaths: Int64 {
        get{
            return _today_deaths
        }
        set{
            return _today_deaths = newValue
        }
    }
    var today_intensive_care: Int64 {
        get{
            return _today_intensive_care
        }
        set{
            return _today_intensive_care = newValue
        }
    }
    var today_new_confirmed: Int64 {
        get{
            return _today_new_confirmed
        }
        set{
            return _today_new_confirmed = newValue
        }
    }
    var today_new_deaths: Int64 {
        get{
            return _today_new_deaths
        }
        set{
            return _today_new_deaths = newValue
        }
    }
    var today_new_intensive_care: Int64 {
        get{
            return _today_new_intensive_care
        }
        set{
            return _today_new_intensive_care = newValue
        }
    }
    var today_new_open_cases: Int64 {
        get{
            return _today_new_open_cases
        }
        set{
            return _today_new_open_cases = newValue
        }
    }
    var today_new_recovered: Int64 {
        get{
            return _today_new_recovered
        }
        set{
            return _today_new_recovered = newValue
        }
    }
    var today_new_total_hospitalised_patients: Int64 {
        get{
            return _today_new_total_hospitalised_patients
        }
        set{
            return _today_new_total_hospitalised_patients = newValue
        }
    }
    var today_open_cases: Int64 {
        get{
            return _today_open_cases
        }
        set{
            return _today_open_cases = newValue
        }
    }
    var today_recovered: Int64 {
        get{
            return _today_recovered
        }
        set{
            return _today_recovered = newValue
        }
    }
    var today_total_hospitalised_patients: Int64 {
        get{
            return _today_total_hospitalised_patients
        }
        set{
            return _today_total_hospitalised_patients = newValue
        }
    }
    
    //Inicializador designado
    init(comunidad: String, today_confirmed: Int64, today_deaths: Int64, today_intensive_care: Int64, today_new_confirmed: Int64, today_new_deaths: Int64, today_new_intensive_care: Int64, today_new_open_cases: Int64, today_new_recovered: Int64, today_new_total_hospitalised_patients: Int64, today_open_cases: Int64, today_recovered: Int64, today_total_hospitalised_patients: Int64) {
        self._comunidad = comunidad
        self._today_confirmed = today_confirmed
        self._today_deaths = today_deaths
        self._today_intensive_care = today_intensive_care
        self._today_new_confirmed = today_new_confirmed
        self._today_new_deaths = today_new_deaths
        self._today_new_intensive_care = today_new_intensive_care
        self._today_new_open_cases = today_new_open_cases
        self._today_new_recovered = today_new_recovered
        self._today_new_total_hospitalised_patients = today_new_total_hospitalised_patients
        self._today_open_cases = today_open_cases
        self._today_recovered = today_recovered
        self._today_total_hospitalised_patients = today_total_hospitalised_patients
    }
    
    //Inicializador de conveniencia
    convenience init () {
        self.init(comunidad: "", today_confirmed: 0, today_deaths: 0, today_intensive_care: 0, today_new_confirmed: 0, today_new_deaths: 0, today_new_intensive_care: 0, today_new_open_cases: 0, today_new_recovered: 0, today_new_total_hospitalised_patients: 0, today_open_cases: 0, today_recovered: 0, today_total_hospitalised_patients: 0)
    }
}

//
//  Provincia.swift
//  CovidApp
//
//  Created by Gustavo Afonso on 02/12/2020.
//

import Foundation

class Provincia{
    // Atributos de la clase
    private var _provincia: String
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
    var provincia: String {
        get{
            return _provincia
        }
        set{
            return _provincia = newValue
        }
    }
    
    //Inicializador designado
    init(provincia: String, today_confirmed: Int64, today_deaths: Int64, today_intensive_care: Int64, today_new_confirmed: Int64, today_new_deaths: Int64, today_new_intensive_care: Int64, today_new_open_cases: Int64, today_new_recovered: Int64, today_new_total_hospitalised_patients: Int64, today_open_cases: Int64, today_recovered: Int64, today_total_hospitalised_patients: Int64) {
        self._provincia = provincia
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
        self.init(provincia: "", today_confirmed: 0, today_deaths: 0, today_intensive_care: 0, today_new_confirmed: 0, today_new_deaths: 0, today_new_intensive_care: 0, today_new_open_cases: 0, today_new_recovered: 0, today_new_total_hospitalised_patients: 0, today_open_cases: 0, today_recovered: 0, today_total_hospitalised_patients: 0)
    }
}

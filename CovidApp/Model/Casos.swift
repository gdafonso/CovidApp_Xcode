//
//  Casos.swift
//  CovidApp
//
//  Created by Gustavo Afonso on 18/12/2020.
//

import Foundation

struct Root: Decodable {
    let dates: CovidDates!
    let total: CovidTotal!
    let metadata: CovidMetadata!
    let updated_at: String!
}
struct CovidDates: Decodable {
    let date: [CovidDate]!
}
struct CovidDate: Decodable {
    let countries: [CovidCountries]!
    let info: CovidInfo!
}
struct CovidCountries: Decodable {
    let country: CovidCountry!
}
struct CovidCountry: Decodable {
    let date: String!
    let id: String!
    let links: [CovidLinks]!
    let name: String!
    let name_es: String!
    let name_it: String!
    let regions: [CovidRegions]!
    let source: String!
    let today_confirmed: Int64!
    let today_deaths: Int64!
    let today_hospitalised_patients_with_symptoms: Int64!
    let today_intensive_care: Int64!
    let today_new_confirmed: Int64!
    let today_new_deaths: Int!
    let today_new_hospitalised_patients_with_symptoms: Int!
    let today_new_intensive_care: Int!
    let today_new_open_cases: Int!
    let today_new_recovered: Int!
    let today_new_total_hospitalised_patients: Int!
    let today_open_cases: Int!
    let today_recovered: Int!
    let today_total_hospitalised_patients: Int!
    let today_vs_yesterday_confirmed: Int!
    let today_vs_yesterday_deaths: Int!
    let today_vs_yesterday_hospitalised_patients_with_symptoms: Int!
    let today_vs_yesterday_intensive_care: Int!
    let today_vs_yesterday_open_cases: Int!
    let today_vs_yesterday_recovered: Int!
    let today_vs_yesterday_total_hospitalised_patients: Int!
    let yesterday_confirmed: Int!
    let yesterday_deaths: Int!
    let yesterday_hospitalised_patients_with_symptoms: Int!
    let yesterday_intensive_care: Int!
    let yesterday_open_cases: Int!
    let yesterday_recovered: Int!
    let yesterday_total_hospitalised_patients: Int!
}
struct CovidRegions: Decodable{
    let date: String!
    let id: String!
    let links: [CovidLinks]!
    let name: String!
    let name_es: String!
    let name_it: String!
    let sub_regions: [CovidRegions]!
    let source: String!
    let today_confirmed: Int!
    let today_deaths: Int!
    let today_hospitalised_patients_with_symptoms: Int!
    let today_intensive_care: Int!
    let today_new_confirmed: Int!
    let today_new_deaths: Int!
    let today_new_hospitalised_patients_with_symptoms: Int!
    let today_new_intensive_care: Int!
    let today_new_open_cases: Int!
    let today_new_recovered: Int!
    let today_new_total_hospitalised_patients: Int!
    let today_open_cases: Int!
    let today_recovered: Int!
    let today_total_hospitalised_patients: Int!
    let today_vs_yesterday_confirmed: Int!
    let today_vs_yesterday_deaths: Int!
    let today_vs_yesterday_hospitalised_patients_with_symptoms: Int!
    let today_vs_yesterday_intensive_care: Int!
    let today_vs_yesterday_open_cases: Int!
    let today_vs_yesterday_recovered: Int!
    let today_vs_yesterday_total_hospitalised_patients: Int!
    let yesterday_confirmed: Int!
    let yesterday_deaths: Int!
    let yesterday_hospitalised_patients_with_symptoms: Int!
    let yesterday_intensive_care: Int!
    let yesterday_open_cases: Int!
    let yesterday_recovered: Int!
    let yesterday_total_hospitalised_patients: Int!
}
struct CovidInfo: Decodable {
    let date: String!
    let date_generation: String!
    let yesterday: String!
}
struct CovidTotal: Decodable {
    let date: String!
    let name: String!
    let name_es: String!
    let name_it: String!
    let rid: String!
    let source: String!
    let today_confirmed: Int64!
    let today_deaths: Int64!
    let today_new_confirmed: Int!
    let today_new_deaths: Int!
    let today_new_open_cases: Int!
    let today_new_recovered: Int!
    let today_open_cases: Int!
    let today_recovered: Int!
    let today_vs_yesterday_confirmed: Int!
    let today_vs_yesterday_deaths: Int!
    let today_vs_yesterday_open_cases: Int!
    let today_vs_yesterday_recovered: Int!
    let yesterday_confirmed: Int!
    let yesterday_deaths: Int!
    let yesterday_open_cases: Int!
    let yesterday_recovered: Int!
    let updated_at: String!
}
struct CovidLinks: Decodable {
    let href: String!
    let rel: String!
    let type: String!
}
struct CovidMetadata: Decodable {
    let by: String!
    let url: [String]!
}

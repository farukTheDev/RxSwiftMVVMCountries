//
//  Country.swift
//  RxSwiftMVVMCountries
//
//  Created by Ömer Faruk KISIK on 16.01.2022.
//

import Foundation

struct Country: Codable {
    let name: CountryName
    let capital: [String] = []
    let population: Int
    let flags: CountryFlag
}

struct CountryFlag: Codable {
    var png: String
    var svg: String
}

struct CountryName: Codable {
    var common: String
    var official: String
}

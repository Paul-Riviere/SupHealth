//
//  Summary.swift
//  Model Generated using http://www.jsoncafe.com/
//  Created on June 15, 2020

import Foundation

struct Summary : Codable {

    let global : Global?
    let countries : [Country]?
    let date : String?

    enum CodingKeys: String, CodingKey {
        case global = "Global"
        case countries = "Countries"
        case date = "Date"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        countries = try values.decodeIfPresent([Country].self, forKey: .countries)
        global = try values.decodeIfPresent(Global.self, forKey: .global)
        date = try values.decodeIfPresent(String.self, forKey: .date)
    }

}


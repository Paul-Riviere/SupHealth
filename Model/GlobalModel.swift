//
//  Global.swift
//  Model Generated using http://www.jsoncafe.com/
//  Created on June 15, 2020

import Foundation

struct Global : Codable {

        let newConfirmed : Int?
        let newDeaths : Int?
        let newRecovered : Int?
        let totalConfirmed : Int?
        let totalDeaths : Int?
        let totalRecovered : Int?

        enum CodingKeys: String, CodingKey {
                case newConfirmed = "NewConfirmed"
                case newDeaths = "NewDeaths"
                case newRecovered = "NewRecovered"
                case totalConfirmed = "TotalConfirmed"
                case totalDeaths = "TotalDeaths"
                case totalRecovered = "TotalRecovered"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                newConfirmed = try values.decodeIfPresent(Int.self, forKey: .newConfirmed)
                newDeaths = try values.decodeIfPresent(Int.self, forKey: .newDeaths)
                newRecovered = try values.decodeIfPresent(Int.self, forKey: .newRecovered)
                totalConfirmed = try values.decodeIfPresent(Int.self, forKey: .totalConfirmed)
                totalDeaths = try values.decodeIfPresent(Int.self, forKey: .totalDeaths)
                totalRecovered = try values.decodeIfPresent(Int.self, forKey: .totalRecovered)
        }

}

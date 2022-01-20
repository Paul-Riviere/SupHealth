//
//  Country.swift
//  Model Generated using http://www.jsoncafe.com/
//  Created on June 15, 2020

import Foundation

struct Country : Codable {

        let country : String?
        let countryCode : String?
        let date : String?
        let newConfirmed : Int?
        let newDeaths : Int?
        let newRecovered : Int?
        let slug : String?
        let totalConfirmed : Int?
        let totalDeaths : Int?
        let totalRecovered : Int?

        enum CodingKeys: String, CodingKey {
                case country = "Country"
                case countryCode = "CountryCode"
                case date = "Date"
                case newConfirmed = "NewConfirmed"
                case newDeaths = "NewDeaths"
                case newRecovered = "NewRecovered"
                case slug = "Slug"
                case totalConfirmed = "TotalConfirmed"
                case totalDeaths = "TotalDeaths"
                case totalRecovered = "TotalRecovered"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                country = try values.decodeIfPresent(String.self, forKey: .country)
                countryCode = try values.decodeIfPresent(String.self, forKey: .countryCode)
                date = try values.decodeIfPresent(String.self, forKey: .date)
                newConfirmed = try values.decodeIfPresent(Int.self, forKey: .newConfirmed)
                newDeaths = try values.decodeIfPresent(Int.self, forKey: .newDeaths)
                newRecovered = try values.decodeIfPresent(Int.self, forKey: .newRecovered)
                slug = try values.decodeIfPresent(String.self, forKey: .slug)
                totalConfirmed = try values.decodeIfPresent(Int.self, forKey: .totalConfirmed)
                totalDeaths = try values.decodeIfPresent(Int.self, forKey: .totalDeaths)
                totalRecovered = try values.decodeIfPresent(Int.self, forKey: .totalRecovered)
        }

}

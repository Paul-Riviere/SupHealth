//
//  Util.swift
//  SupHealth
//
//  Created by Student Supinfo on 20/06/2020.
//  Copyright © 2020 Student Supinfo. All rights reserved.
//

import Foundation

public func countryStringToflag(country:String) -> String {
    let base : UInt32 = 127397
    var s = ""
    for v in country.unicodeScalars {
        s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
    }
    return String(s)
}

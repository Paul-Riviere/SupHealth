//
//  SharedData.swift
//  SupHealth
//
//  Created by Student Supinfo on 17/06/2020.
//  Copyright © 2020 Student Supinfo. All rights reserved.
//

import Foundation

public class SharedData {
    public static let sharedInstance = SharedData()
    
    var sumary: Summary?
    var showFavorites = false
    
    private init() {
        // init() en private pour être sûr de garder la même instance
    }
}

//
//  CountryDetailsViewController.swift
//  SupHealth
//
//  Created by Student Supinfo on 17/06/2020.
//  Copyright © 2020 Student Supinfo. All rights reserved.
//

import UIKit

class CountryDetailsViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var LabelCountryName: UILabel!
    @IBOutlet weak var LabelNewConfirmed: UILabel!
    @IBOutlet weak var LabelNewDeaths: UILabel!
    @IBOutlet weak var LabelNewRecovered: UILabel!
    @IBOutlet weak var LabelTotalConfirmed: UILabel!
    @IBOutlet weak var LabelTotalDeaths: UILabel!
    @IBOutlet weak var LabelTotalRecovered: UILabel!
    @IBOutlet weak var SwitchFavorites: UISwitch!
    
    
    var countryCode = String()
    var countryName = String()
    var newConfirmed = Int()
    var newDeaths = Int()
    var newRecovered = Int()
    var totalConfirmed = Int()
    var totalDeaths = Int()
    var totalRecovered = Int()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let favorites = UserDefaults.standard.array(forKey: "favorites") as? [String]
        if favorites!.contains(self.countryCode) {
            self.SwitchFavorites.setOn(true, animated: true)
        }
        self.LabelCountryName.text = countryStringToflag(country: countryCode) + "   " + countryName
        self.LabelNewConfirmed.text! = "New confirmed : " + "\((self.newConfirmed) as Int)"
        self.LabelNewDeaths.text! = "New deaths : " + "\((self.newDeaths) as Int)"
        self.LabelNewRecovered.text! = "New recovered : " + "\((self.newRecovered) as Int)"
        self.LabelTotalConfirmed.text! = "Total confirmed : " + "\((self.totalConfirmed) as Int)"
        self.LabelTotalDeaths.text! = "Total deaths : " + "\((self.totalDeaths) as Int)"
        self.LabelTotalRecovered.text! = "Total recovered : " + "\((self.totalRecovered) as Int)"
    }
    

    @IBAction func onSwitchFavoritesChanged(_ sender: Any) {
        var favorites = UserDefaults.standard.array(forKey: "favorites") as? [String]
        if self.SwitchFavorites.isOn {
            if favorites!.contains(self.countryCode) == false {
                favorites!.append(self.countryCode)
            }
        } else {
            favorites!.remove(at: (favorites?.firstIndex(of: self.countryCode))!)
            UserDefaults.standard.set(favorites, forKey: "favorites")
        }
        UserDefaults.standard.set(favorites, forKey: "favorites")
        print(UserDefaults.standard.array(forKey: "favorites") as? [String])
    }
    
}

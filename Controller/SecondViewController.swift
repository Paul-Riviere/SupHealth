//
//  SecondViewController.swift
//  SupHealth
//
//  Created by Student Supinfo on 17/06/2020.
//  Copyright © 2020 Student Supinfo. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var SwitchFavorites: UISwitch!
    @IBOutlet weak var TableViewCountries: UITableView!
    
    
    var cellSelected: Country?
    // par défaut les pays à afficher sont tous les pays et pas seulement les favoris
    var countriesToDisplay: [Country]?
    var favoriteCountriesRows: [Country] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // premier lancement de l'app
        if UserDefaults.standard.array(forKey: "favorites") == nil {
            let favorites: [String] = []
            UserDefaults.standard.set(favorites, forKey: "favorites")
        }
        // tester valeur du switch pour savoir quoi charger
        self.countriesToDisplay = SharedData.sharedInstance.sumary?.countries!
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.SwitchFavorites.setOn(SharedData.sharedInstance.showFavorites, animated: true)
    }
    
    @IBAction func onSwitchChange(_ sender: Any) {
        if self.SwitchFavorites.isOn {
            SharedData.sharedInstance.showFavorites = true
            self.countriesToDisplay = self.favoriteCountriesRows
            self.TableViewCountries.reloadData()
        } else {
            SharedData.sharedInstance.showFavorites = false
            self.favoriteCountriesRows = []
            self.countriesToDisplay = SharedData.sharedInstance.sumary?.countries
            self.TableViewCountries.reloadData()
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (countriesToDisplay!.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CountryTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CountryCell") as! CountryTableViewCell
        
        let cellule = countriesToDisplay![indexPath.row]
        cell.setCell(cellLabel: (cellule.country)!, cellCountryCode: (cellule.countryCode)!)
        
        if self.SwitchFavorites.isOn == false {
            let favorites = UserDefaults.standard.array(forKey: "favorites") as? [String]
            // si le pays est dans les favoris, on pousse la ligne dans le tableau des favoris
            if favorites!.contains(cellule.countryCode!) {
                self.favoriteCountriesRows.append(cellule)
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.cellSelected = countriesToDisplay![indexPath.row]
        self.performSegue(withIdentifier: "DetailsSegue", sender: self)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailsSegue" {
            let countryDetailsController = segue.destination as! CountryDetailsViewController
            countryDetailsController.countryCode = self.cellSelected?.countryCode! as! String
            countryDetailsController.countryName = self.cellSelected?.country! as! String
            countryDetailsController.newConfirmed = self.cellSelected?.newConfirmed! as! Int
            countryDetailsController.newDeaths = self.cellSelected?.newDeaths! as! Int
            countryDetailsController.newRecovered = self.cellSelected?.newRecovered! as! Int
            countryDetailsController.totalConfirmed = self.cellSelected?.totalConfirmed! as! Int
            countryDetailsController.totalDeaths = self.cellSelected?.totalDeaths! as! Int
            countryDetailsController.totalRecovered = self.cellSelected?.totalRecovered! as! Int
        }
    }
}


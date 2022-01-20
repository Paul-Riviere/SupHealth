//
//  FirstViewController.swift
//  SupHealth
//
//  Created by Student Supinfo on 17/06/2020.
//  Copyright © 2020 Student Supinfo. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    // MARK: OUTLETS
    @IBOutlet weak var LabelNewConfirmed: UILabel!
    @IBOutlet weak var LabelNewDeaths: UILabel!
    @IBOutlet weak var LabelNewRecovered: UILabel!
    @IBOutlet weak var LabelTotalConfirmed: UILabel!
    @IBOutlet weak var LabelTotalDeaths: UILabel!
    @IBOutlet weak var LabelTotalRecovered: UILabel!
    @IBOutlet weak var LabelDate: UILabel!
    
    
    let networkManager = NetworkManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager.downloadData(completion: {succeed, sumary in
            
            // On garde en mémoire les données récupérées pour ne pas avoir à appeler
            // De nouveau l'API sur le deuxième onglet
            SharedData.sharedInstance.sumary = sumary
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZ"
            let stringToDateFormat = dateFormatter.date(from: (sumary?.date)!)!
            dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
            let dateToStringFormat = dateFormatter.string(from: stringToDateFormat)
            
            self.LabelDate.text! = "Date : " + "\(dateToStringFormat)"
            self.LabelNewConfirmed.text! = "New confirmed : " + "\((sumary?.global?.newConfirmed)! as Int)"
            self.LabelNewDeaths.text! = "New deaths : " + "\((sumary?.global?.newDeaths)! as Int)"
            self.LabelNewRecovered.text! = "New recovered : " + "\((sumary?.global?.newRecovered)! as Int)"
            self.LabelTotalConfirmed.text! = "Total confirmed : " + "\((sumary?.global?.totalConfirmed)! as Int)"
            self.LabelTotalDeaths.text! = "Total deaths : " + "\((sumary?.global?.totalDeaths)! as Int)"
            self.LabelTotalRecovered.text! = "Total recovered : " + "\((sumary?.global?.totalRecovered)! as Int)"
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}


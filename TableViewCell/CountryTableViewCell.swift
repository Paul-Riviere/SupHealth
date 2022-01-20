//
//  CountryTableViewCell.swift
//  SupHealth
//
//  Created by Student Supinfo on 17/06/2020.
//  Copyright © 2020 Student Supinfo. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var LabelCountry: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(cellLabel: String, cellCountryCode: String) {
        self.LabelCountry.text = countryStringToflag(country: cellCountryCode) + "   " + cellLabel
    }

}

//
//  PatientSearchTableViewCell.swift
//  DoctorSwift
//
//  Created by Apple on 14/01/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class PatientSearchTableViewCell: UITableViewCell {
    @IBOutlet weak var Namelbl: UILabel!
    // weak var delegate: MyCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func functionToCall() {
        //This function will be called when you post the notification
    }
    func buttonTapped(name: Array<SearchResult>) {
       print(name)
        //do whatever you need
    }
    func student(name: SearchResult) {
       //Namelbl.text=name.name
        print(name.name!)
        
    }
}


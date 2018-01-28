//
//  DBXDualPhoneNumberTableViewCell.swift
//  DoctorSwift
//
//  Created by Apple on 24/01/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class DBXDualPhoneNumberTableViewCell: UITableViewCell {

    @IBOutlet weak var phonetxt: UITextField!
    @IBOutlet weak var codetxt: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

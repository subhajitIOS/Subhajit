//
//  DBXProfileTextFieldTableViewCell.swift
//  DoctorSwift
//
//  Created by Apple on 24/01/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class DBXProfileTextFieldTableViewCell: UITableViewCell {

    @IBOutlet weak var aTextFiled: UITextField!
    @IBOutlet weak var phototsAttachedLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

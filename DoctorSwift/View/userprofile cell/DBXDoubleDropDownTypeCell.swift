//
//  DBXDoubleDropDownTypeCell.swift
//  DoctorSwift
//
//  Created by Apple on 22/01/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class DBXDoubleDropDownTypeCell: UITableViewCell {
    @IBOutlet weak var secondTxt: UITextField!
    
    @IBOutlet weak var firstDropdownImage: UIImageView!
    @IBOutlet weak var secondDropdownImage: UIImageView!
    @IBOutlet weak var secondBoredrView: UIView!
    @IBOutlet weak var secondSeparator: UIView!
    @IBOutlet weak var firstTxt: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func updateDropDown(firsttext: String, secondText: String){
        if firsttext == "Gender" || firsttext == "Height" || firsttext == "Blood Group" {
            firstTxt.placeholder = firsttext
        }
        else{
         firstTxt.text =  firsttext
        }
  
       secondTxt.text = secondText
        
    }
    func updatetextFieldHidden(){
        
        secondTxt.isHidden = true
        secondBoredrView.isHidden = true
        secondDropdownImage.isHidden = true
        secondSeparator.isHidden = false
        
    }
 func unHideDropDownIcons()
    {
        firstTxt.placeholder = NSLocalizedString("Gender", comment: "Gender")
        secondTxt.placeholder = NSLocalizedString("Practising Since", comment: "Practising Since")
        firstTxt.isEnabled = true
         secondTxt.isEnabled = true
  firstTxt.isHidden = false
         secondTxt.isHidden = false
   firstDropdownImage.isHidden = true
   secondDropdownImage.isHidden = false
 
    }
}

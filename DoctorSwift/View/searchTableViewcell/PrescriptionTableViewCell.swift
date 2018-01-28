//
//  PrescriptionTableViewCell.swift
//  DoctorSwift
//
//  Created by Apple on 19/01/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class PrescriptionTableViewCell: UITableViewCell {

    @IBOutlet weak var uploadedBy: UILabel!
    @IBOutlet weak var doctorName: UILabel!
    @IBOutlet weak var date: UILabel!
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
   
    func student(response: DocumentResponse) {
        
       
        let first = response.doctorName! + ", " + response.doctorSpeciality!
        
        doctorName.text = first
        
        if (response.isOriginalUser != 0) {
            uploadedBy.text = "Uploaded by Patient"
        }
        else{
             uploadedBy.text = ""
        }
        
//        if (!record.isOriginalUser) {
//            NSString *doctorId=[NSString stringWithFormat:@"%ld",(long)record.doctorId];
//
//            if ([doctorId isEqualToString:[[DBXUser sharedUser] doctorId]]) {
//
//                self.doctortype.text=[[NSString stringWithFormat:@"Uploaded by Patient"] capitalizedString];
//            }
//            else{
//                self.doctortype.text=[[NSString stringWithFormat:@"Shared by chat"] capitalizedString];
//            }
//
//        }
//        else{
//            self.doctortype.text=@"";
//        }
        //Namelbl.text=name.name
        //print(name.name!)
        
    }
}

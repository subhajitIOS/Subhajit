//
//  ReportTableViewCell.swift
//  DoctorSwift
//
//  Created by Apple on 19/01/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class ReportTableViewCell: UITableViewCell {
    @IBOutlet weak var centerNamelbl: UILabel!
    
    @IBOutlet weak var dateAndTypelbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        dateAndTypelbl.text = nil
         centerNamelbl.text = nil
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func student(response: DocumentResponse) {
        
         
 
}
    func dateFromMilliseconds(ms: Int) -> NSDate {
        return NSDate(timeIntervalSince1970:Double(ms) / 1000.0)
    }
}

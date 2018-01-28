//
//  DBXProfileHeaderView.swift
//  DoctorSwift
//
//  Created by Apple on 24/01/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
protocol HeaderViewCellDelegate : class {
    func HeaderViewCellDelegate(str:Int)
   
}
class DBXProfileHeaderView: UIView {
    @IBOutlet weak var clinicNameButton: UIButton!
    weak var delegate: HeaderViewCellDelegate?
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var profileImageView: UIImageView!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    func updateClinicName(str:String){
    }
    @IBAction func editButtonAction(_ sender: Any) {
    }
    
    @IBAction func expandActionButtonAction(_ sender: UIButton) {
        
        delegate?.HeaderViewCellDelegate(str: self.tag)
       // expandActionButtonActionDelegate
    }
}

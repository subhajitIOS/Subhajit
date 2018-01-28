//
//  DBXFilterHeaderView.swift
//  DoctorSwift
//
//  Created by Apple on 19/01/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
protocol FilterDelegate : class {
    
    func filterSetForDropdown(str:Int)
}
class DBXFilterHeaderView: UIView {
     weak var delegate: FilterDelegate?
    @IBAction func dropDown(_ sender: UIButton) {
        
        
        print(sender.tag)
        
       
        
        
        delegate?.filterSetForDropdown(str:sender.tag )
       
    }
    
    @IBOutlet weak var dropDownButton: UIButton!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

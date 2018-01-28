//
//  DBXTextTokenzierCell.swift
//  DoctorSwift
//
//  Created by Apple on 23/01/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class DBXTagTokenzierCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var tagView: TaglistCollection!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func buttonTapped(name:String) {
        
        self.tagView.setupTagCollection()
        self.tagView.delegate = self as? TagViewDelegate
        
        self.tagView.backgroundColor = UIColor.clear
         self.tagView.tagBorderColor = UIColor.gray
         self.tagView.isDeleteEnabled = true
        self.tagView.closeIconTint = UIColor.gray
         self.tagView.allowSingleSelection = true
         self.tagView.allowMultipleSelection = true
        self.tagView.selectionTagTextColor = UIColor.white
         self.tagView.isShadowEnabled = false
      // self.tagView.shadowOpacity = 5.0
         //self.tagView.shadowRadius = 3.0
       //self.tagView.shadowColor = UIColor.brown
        self.tagView.closeIconHeight = 10
       self.tagView.tagBorderWidth = 2
      
        self.tagView.tagSpacing = 0
         self.tagView.closeIconWidth = 10
        
        let array = name.components(separatedBy: ",")
        for item in array{
            print(item)
        
        self.tagView.appendTag(tagName: item)
        self.tagView.appendTag(tagName: item)
        }
     
       // self.tagView = self.tagView.copyAllTags()
        
        
      //  self.tagView.textFont = UIFont.systemFont(ofSize: 15.0, weight: .heavy)
       
        //do whatever you need
    }
    
}

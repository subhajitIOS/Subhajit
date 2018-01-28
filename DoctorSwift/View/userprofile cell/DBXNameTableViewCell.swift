//
//  DBXNameTableViewCell.swift
//  DoctorSwift
//
//  Created by Apple on 22/01/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class DBXNameTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    @IBOutlet weak var lastNametxt: UITextField!
    @IBOutlet weak var firstNametxt: UITextField!
    @IBOutlet weak var profileImageView: UIImageView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
     func buttonTapped(name:UserProfile) {
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2.0
        profileImageView.clipsToBounds = true
        self.downloadImage(name.imageUrl!, inView: profileImageView)
       // let fileUrl = NSURL(fileURLWithPath: name.imageUrl!)
        
    }
    
    func updateFirstName(name:String){
        
        print(name)
        firstNametxt.text = name
    }
    func updateLastName(name:String){
      lastNametxt.text = name
    }
    func downloadImage(_ uri : String, inView: UIImageView){
        
        let url = URL(string: uri)
        
        let task = URLSession.shared.dataTask(with: url!) {responseData,response,error in
            if error == nil{
                if let data = responseData {
                    
                    DispatchQueue.main.async {
                        inView.image = UIImage(data: data)
                    }
                    
                }else {
                    print("no data")
                }
            }else{
                print(error!)
            }
        }
        
        task.resume()
        
    }

}

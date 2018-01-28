//
//  DBXProfileImagesTableViewCell.swift
//  DoctorSwift
//
//  Created by Apple on 24/01/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class DBXProfileImagesTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource  {
    @IBOutlet weak var collectionVie: UICollectionView!
    
   
    var setArrayCount:Int = 0
 
    var doctorInfos : ClinicInfos?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func configure(placeholder: ClinicInfos) {
        
        
        
       doctorInfos = placeholder
       // print(doctorInfos?.clinicImages)
        
        
        
        let nibCell = UINib(nibName: "detaCollectionViewCell", bundle: nil)
        collectionVie.register(nibCell, forCellWithReuseIdentifier: "detaCollectionViewCell")
        
        collectionVie.delegate = self
        collectionVie.dataSource = self
        setArrayCount = (placeholder.clinicImages?.count)!
        //
        //
        
        
        collectionVie.reloadData()
        print("dsgdsdhsfhfgdfghdfhg")
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return setArrayCount
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detaCollectionViewCell", for: indexPath) as! detaCollectionViewCell
        
        let sts = doctorInfos?.clinicImages![indexPath.row]
        
        let str :String = (sts?.imageLink)!
        print(str)
        
        
        self.downloadImage(str, inView:  cell.image)
       // cell.image.image = UIImage(named:array[indexPath.row])
        
        return cell
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

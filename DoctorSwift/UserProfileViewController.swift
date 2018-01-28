//
//  UserProfileViewController.swift
//  DoctorSwift
//
//  Created by Apple on 22/01/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController ,DoctorDataTaskModelDelegate{
    @IBOutlet weak var profileTableview: UITableView!
    var year:Int = 0
    var userProfile : Array<UserProfile>?

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileTableview.register(UINib(nibName: "DBXDoubleDropDownTypeCell", bundle: nil), forCellReuseIdentifier: "DBXDoubleDropDownTypeCell")
        profileTableview.register(UINib(nibName: "DBXNameTableViewCell", bundle: nil), forCellReuseIdentifier: "DBXNameTableViewCell")
        profileTableview.register(UINib(nibName: "DBXProfileAdditionalInfoCell", bundle: nil), forCellReuseIdentifier: "DBXProfileAdditionalInfoCell")
         profileTableview.register(UINib(nibName: "DBXContactNoTypeCell", bundle: nil), forCellReuseIdentifier: "DBXContactNoTypeCell")
        
         profileTableview.register(UINib(nibName: "DBXTagTokenzierCell", bundle: nil), forCellReuseIdentifier: "DBXTagTokenzierCell")
        
         dataTaskModel.delegate = self
        
      
        profileTableview.separatorColor = UIColor.clear
        
        getUserProfile()
        //tblList.rowHeight = 104;
        //dataTaskModel.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    fileprivate func getUserProfile()  {
        
        
        
        let param = NSMutableDictionary()
       
        
        param["familyMemberId"] = "8354"
        param["isFamilyMember"] = "0"
        param["userId"] = "12985"
       
        
        
        dataTaskModel.ProfileInfo(parameter: param)
        
        
        
        
    }
    func didRecieveResponseOfProfileInfo(json: NSMutableDictionary){
        
        
print(json)
        
   userProfile = UserProfile.modelsFromDictionaryArray(array: json["userProfile"] as! NSArray)
        
     
 
       year = 11
       
  profileTableview.reloadData()
        
        
       
        DoctorSingleton.sharedInstance.activityLoader.hideActivityIndicator()
        
        
        
        
        
        
    }
    func didRecieveErrorOfProfileInfo(error json: NSMutableDictionary){
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func dateFromMilliseconds(ms: Int) -> NSDate {
        return NSDate(timeIntervalSince1970:Double(ms) / 1000.0)
    }
}
extension UserProfileViewController: UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // print(v?.reminderDrugs?.count)
        
        return year
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == DBXUserProfileCellType.DBXNameCellIndex.rawValue {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DBXNameTableViewCell", for: indexPath) as! DBXNameTableViewCell
           
            let sts:UserProfile = userProfile![0]
            cell.buttonTapped(name:sts)
            cell.updateFirstName(name:sts.firstName!)
            cell.updateLastName(name: sts.lastName!)
            
            return cell;
        }
        else if DBXUserProfileCellType.DBXGenderCellIndex.rawValue <= indexPath.row && DBXUserProfileCellType.DBXRelationCellIndex.rawValue >= indexPath.row {
            
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "DBXDoubleDropDownTypeCell", for: indexPath) as! DBXDoubleDropDownTypeCell
            let sts:UserProfile = userProfile![0]
            
            
            if(DBXUserProfileCellType.DBXGenderCellIndex.rawValue == indexPath.row){
                
                
                let  str = dateFromMilliseconds(ms:sts.dob!)
                let dateFormatter = DateFormatter()
                
                dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
                dateFormatter.dateFormat = "dd-MMM-yyyy"
                let resultString = dateFormatter.string(from: str as Date)
                
              
                
                cell.updateDropDown(firsttext: (true == sts.sex?.isEmpty) ? "Gender" :sts.sex!, secondText: (true == resultString.isEmpty) ? "Date of Birth" :resultString)
            }
            else if(DBXUserProfileCellType.DBXHeightCellIndex.rawValue == indexPath.row){
                
                
                
              
                cell.updateDropDown(firsttext: (true == sts.height?.isEmpty) ? "Height" :sts.height!, secondText:(true == sts.weight?.isEmpty) ? "Weight" :sts.weight!)
            }
           else if(DBXUserProfileCellType.DBXRelationCellIndex.rawValue == indexPath.row){
                cell.updateDropDown(firsttext: (true == sts.bloodGroup?.isEmpty) ? "Blood Group" :sts.bloodGroup!, secondText: "")
                cell.updatetextFieldHidden()
            }
           
      return cell
        }
        
        else if DBXUserProfileCellType.DBXAdditionalInfoCellIndex.rawValue == indexPath.row {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DBXProfileAdditionalInfoCell", for: indexPath) as! DBXProfileAdditionalInfoCell
            return cell
        }
        else if DBXUserProfileCellType.DBXAllergiesCellIndex.rawValue == indexPath.row {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DBXTagTokenzierCell", for: indexPath) as! DBXTagTokenzierCell
                        let str = userProfile![0]
            
                        cell.buttonTapped(name:str.allergies!)
                        return cell
        }
        else if DBXUserProfileCellType.DBXSurgeriesCellIndex.rawValue == indexPath.row {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DBXTagTokenzierCell", for: indexPath) as! DBXTagTokenzierCell
            let str = userProfile![0]
            
            cell.buttonTapped(name:str.surgeries!)
            return cell
        }
        
//        else if indexPath.row == 2{
//
//            let cell = tableView.dequeueReusableCell(withIdentifier: "DBXTagTokenzierCell", for: indexPath) as! DBXTagTokenzierCell
//            let str = userProfile![0]
//
//            cell.buttonTapped(name:str.allergies!)
//            return cell
//        }
//        else if indexPath.row == 3{
//            let cell = tableView.dequeueReusableCell(withIdentifier: "DBXContactNoTypeCell", for: indexPath) as! DBXContactNoTypeCell
//                        return cell
//        }
      
//            let cell = tableView.dequeueReusableCell(withIdentifier: "DBXContactNoTypeCell", for: indexPath) as! DBXContactNoTypeCell
//            return cell
//        }
//        else if indexPath.row == 3{

            let cell = tableView.dequeueReusableCell(withIdentifier: "DBXProfileAdditionalInfoCell", for: indexPath) as! DBXProfileAdditionalInfoCell
            return cell
//        }
//
//
        
        //        let rect = CGRect(origin: .zero, size: CGSize(width: cell.frame.width, height: 100))
        //        let dynamicLabel: UILabel = UILabel()
        //        dynamicLabel.frame = rect
        
        
       
        
       
        
    }



    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        
        if indexPath.row == 0 {
             return 100.0;
        }
        return 50.0;//Choose your custom row height
}
}


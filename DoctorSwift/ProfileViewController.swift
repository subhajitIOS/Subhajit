//
//  ProfileViewController.swift
//  DoctorSwift
//
//  Created by Apple on 24/01/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController,DoctorDataTaskModelDelegate,HeaderViewCellDelegate,UITextFieldDelegate {
    
    
    @IBOutlet weak var profileTableView: UITableView!
    var textFieldArray: NSArray?
    var genderArray:NSArray?
    var cellTypes:NSArray?
     var headerType:Int = 0
    var  textFiledPlaceHoldersArry:NSMutableArray?
    var cellTypesCompleteList:NSMutableArray?
    var textViewDictionary = [String: AnyObject].self
    var addClinicFieldsArray:NSArray?
    var doctorInfos : DoctorInfos?
    var numberOfRows:Int = 0
      var numberOfRowsFirstSection:Int = 0
     var numberOfRowsSecondSection:Int = 0
    var selectedIndex:Int = -1
    override func viewDidLoad() {
        super.viewDidLoad()
         profileTableView.register(UINib(nibName: "DBXDoubleDropDownTypeCell", bundle: nil), forCellReuseIdentifier: "DBXDoubleDropDownTypeCell")
        
         profileTableView.register(UINib(nibName: "DBXAddressTableViewCell", bundle: nil), forCellReuseIdentifier: "DBXAddressTableViewCell")
         profileTableView.register(UINib(nibName: "DBXProfileImagesTableViewCell", bundle: nil), forCellReuseIdentifier: "DBXProfileImagesTableViewCell")
         profileTableView.register(UINib(nibName: "DBXDualPhoneNumberTableViewCell", bundle: nil), forCellReuseIdentifier: "DBXDualPhoneNumberTableViewCell")
          profileTableView.register(UINib(nibName: "PatientSearchTableViewCell", bundle: nil), forCellReuseIdentifier: "PatientSearchTableViewCell")
        
        
         profileTableView.register(UINib(nibName: "DBXProfileHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "DBXProfileHeaderView")
        
        
          profileTableView.register(UINib(nibName: "DBXDualPhoneNumberTableViewCell", bundle: nil), forHeaderFooterViewReuseIdentifier: "DBXDualPhoneNumberTableViewCell")
        
        profileTableView.register(UINib(nibName: "DBXProfileImagesTableViewCell", bundle: nil), forHeaderFooterViewReuseIdentifier: "DBXProfileImagesTableViewCell")
        
        
        
     
dataTaskModel.delegate = self
        
        
        getDoctorProfil()
        
       // profileTableView.tableHeaderView = viewset
        
        
        // Do any additional setup after loading the view.
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

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if let headerView = profileTableView.tableHeaderView {
            
            let height = headerView.systemLayoutSizeFitting(UILayoutFittingCompressedSize).height
            var headerFrame = headerView.frame
            
            //Comparison necessary to avoid infinite loop
            if height != headerFrame.size.height {
                
                headerFrame.size.height = 150.0
                headerView.frame = headerFrame
                profileTableView.tableHeaderView = headerView
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func configurecell()  {
       
        
        textFieldArray = NSArray(objects:"DoctorName", "Speciality", "Degree Images", "Email ID",  "Mobile Number", "Primary Number", "", "Qualification", "Medical Registration No.")
         genderArray = NSArray(objects:"Male", "Female", "Others")
        
         addClinicFieldsArray = NSArray(objects:"Clinic Name", "Clinic Primary Number", "Clinic Phone Number", "Timings", "", "City", "Locality", "Landmark", "Address", "Zip Code")
        
        cellTypesCompleteList = NSMutableArray(objects:DBXEditProfileCellType.DBXEditProfileCellTypeDoctorName,DBXEditProfileCellType.DBXEditProfileCellTypeSpeciality,DBXEditProfileCellType.DBXEditProfileCellTypeCaptureDegree,DBXEditProfileCellType.DBXEditProfileCellTypeEmailID,DBXEditProfileCellType.DBXEditProfileCellTypeMobileNumber,DBXEditProfileCellType.DBXEditProfileCellTypePrimaryContactNumber,DBXEditProfileCellType.DBXEditProfileCellTypeDoubleDropDown,DBXEditProfileCellType.DBXEditProfileCellTypeQualifiation,DBXEditProfileCellType.DBXEditProfileCellTypeMedicalRegistrationNo)
        
        
        
        
         cellTypes = NSArray(objects:DBXClinicCellType.DBXClinicCellTypeClinicName,DBXClinicCellType.DBXClinicCellTypeClinicPrimaryNumber,DBXClinicCellType.DBXClinicCellTypeAddClinicPhoneNumber,DBXClinicCellType.DBXClinicCellTypeAddTimings,DBXClinicCellType.DBXClinicCellTypeClinicPhotos,DBXClinicCellType.DBXClinicCellTypeCity,DBXClinicCellType.DBXClinicCellTypeLocality,DBXClinicCellType.DBXClinicCellTypeLandmark,DBXClinicCellType.DBXClinicCellTypeAddress,DBXClinicCellType.DBXClinicCellTypeZip)
//doctorInfos = DoctorInfos(dictionary: dictionary["doctorInfos"] as! NSDictionary)
        
    }

    fileprivate func getDoctorProfil()  {
        
        
        
        let param = NSMutableDictionary()
        
        
        param["doctorId"] = "15177"
       
        
        dataTaskModel.getDoctorProfile(parameter: param)
        
        
        
       
        
    }
    func didRecieveResponseOfDoctorInfo(json: NSMutableDictionary){
        
        print(json)
        
       doctorInfos = DoctorInfos(dictionary: json["doctorInfos"] as! NSDictionary)
        
        print(doctorInfos?.clinicInfos?.count)
        
        
        let intset:Int
        intset = (doctorInfos?.clinicInfos?.count)!
        numberOfRows = intset + 1
        
        
        let size = cellTypes?.count
        
        let viewset = (Bundle.main.loadNibNamed("DBXProfileHeaderView", owner: self, options: nil)![0] as? DBXProfileHeaderView)
        
        self.downloadImage((doctorInfos?.doctorImageUrl)!, inView:  (viewset?.profileImageView)!)
        viewset?.profileImageView.layer.cornerRadius = (viewset?.profileImageView.frame.size.width)! / 2.0
        viewset?.profileImageView.clipsToBounds = true
        profileTableView.tableHeaderView = viewset
        profileTableView.separatorColor = UIColor.clear
        configurecell()
        numberOfRowsSecondSection = (cellTypes?.count)!
        numberOfRowsFirstSection = (cellTypesCompleteList?.count)!
        
        profileTableView.reloadData()
        
        DoctorSingleton.sharedInstance.activityLoader.hideActivityIndicator()
        
        
        
        
        
        
    }
    func textFieldDataWithTextField(activeTextField:UITextField, isFromCell:Bool){
        switch activeTextField.tag {
        case DBXEditProfileCellType.DBXEditProfileCellTypeDoctorName.rawValue:
            !isFromCell ?  (doctorInfos?.firstName = activeTextField.text): (activeTextField.text = doctorInfos?.firstName)
            break;
        case DBXEditProfileCellType.DBXEditProfileCellTypeSpeciality.rawValue:
            !isFromCell ? (doctorInfos?.doctorSpecialization = activeTextField.text): (activeTextField.text = doctorInfos?.doctorSpecialization)
            break;
        case DBXEditProfileCellType.DBXEditProfileCellTypeCaptureDegree.rawValue:
            break;
        case DBXEditProfileCellType.DBXEditProfileCellTypeEmailID.rawValue:
            !isFromCell ?(doctorInfos?.email = activeTextField.text): (activeTextField.text = doctorInfos?.email)
            break;
        case DBXEditProfileCellType.DBXEditProfileCellTypeMobileNumber.rawValue:
            
           
            !isFromCell ?(doctorInfos?.mobileNumber = activeTextField.text): (activeTextField.text = doctorInfos?.mobileNumber)
            break;
        case DBXEditProfileCellType.DBXEditProfileCellTypePrimaryContactNumber.rawValue:
           
            doctorInfos?.primaryContactNumber = activeTextField.text
            break;
        case DBXEditProfileCellType.DBXEditProfileCellTypeDoubleDropDown.rawValue:
            if (activeTextField.placeholder == "Practising Since") {
                
                
                
                if (!isFromCell) {
                    doctorInfos?.practicingSince = activeTextField.text;
                } else {
                    
                    
                    activeTextField.text = !(doctorInfos?.practicingSince == "") ? doctorInfos?.practicingSince : doctorInfos?.experience
                    
//                    print(activeTextField)
//
//
//                    print(activeTextField.text!)
                    
                    doctorInfos?.practicingSince = activeTextField.text
//                    activeTextField.text = ![_profileObject.practicingSince isEqualToString:@""] ? _profileObject.practicingSince : [DBXUtilities calculateDateFromExperience:_profileObject.experience];
//                    _profileObject.practicingSince = activeTextField.text;
                    
                    
                    
                    doctorInfos?.practicingSince = activeTextField.text;
                }
            }
            else{
                !isFromCell ? (doctorInfos?.gender = activeTextField.text): (activeTextField.text = doctorInfos?.gender)
            }
            break;
        case DBXEditProfileCellType.DBXEditProfileCellTypeQualifiation.rawValue:
            !isFromCell ?(doctorInfos?.qualification = activeTextField.text): (activeTextField.text = doctorInfos?.qualification)
            break;
        case DBXEditProfileCellType.DBXEditProfileCellTypeMedicalRegistrationNo.rawValue:
          
           
           
            !isFromCell ?(doctorInfos?.medicalRegisterNo = activeTextField.text ): (activeTextField.text = doctorInfos?.medicalRegisterNo)
            break;
            
        default:
            break;
        }
    }
    func clinicDataWithTextField(activeTextField:UITextField, isFromCell:Bool, infoClinic:ClinicInfos){
        switch activeTextField.tag {
        case DBXClinicCellType.DBXClinicCellTypeClinicName.rawValue:
            !isFromCell ?  (infoClinic.name = activeTextField.text): (activeTextField.text = infoClinic.name )
            break;
        case DBXClinicCellType.DBXClinicCellTypeClinicPrimaryNumber.rawValue:
            !isFromCell ? (infoClinic.mobileNumber = activeTextField.text): (activeTextField.text = infoClinic.mobileNumber)
            break;
        case DBXClinicCellType.DBXClinicCellTypeClinicPhotos.rawValue:
            break;
        case DBXClinicCellType.DBXClinicCellTypeAddClinicPhoneNumber.rawValue:
            !isFromCell ?(infoClinic.landLine = activeTextField.text): (activeTextField.text = infoClinic.landLine)
            break;
        case DBXClinicCellType.DBXClinicCellTypeAddTimings.rawValue:
            
            
           // !isFromCell ?(infoClinic.addTiming = activeTextField.text): (activeTextField.text = infoClinic.addTiming)
            break;
        case DBXClinicCellType.DBXClinicCellTypeCity.rawValue:
            
            !isFromCell ?(infoClinic.cityName = activeTextField.text): (activeTextField.text = infoClinic.cityName)
            break;
        
        case DBXClinicCellType.DBXClinicCellTypeLocality.rawValue:
            !isFromCell ?(infoClinic.locality = activeTextField.text): (activeTextField.text = infoClinic.locality)
            break;
        case DBXClinicCellType.DBXClinicCellTypeLandmark.rawValue:
            
            
            
            !isFromCell ?(infoClinic.landmark = activeTextField.text ): (activeTextField.text = infoClinic.landmark)
            break;
        case DBXClinicCellType.DBXClinicCellTypeZip.rawValue:
            
            let x : Int = infoClinic.zipCode!
            var myString = String(x)
            
            !isFromCell ?(myString = activeTextField.text! ): (activeTextField.text! = myString)
            break;
            
        default:
            break;
        }
    }
    
    func dateFromMilliseconds(ms: Int) -> NSDate {
        return NSDate(timeIntervalSince1970:Double(ms) / 1000.0)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func HeaderViewCellDelegate(str: Int) {
        
        
        if (selectedIndex == str) {
            selectedIndex = -1;
        }
        else{
            selectedIndex = str;
        }
        
        profileTableView.reloadSections(IndexSet(integer: str), with: .automatic)
        
        
        
         let stst:Int = (addClinicFieldsArray?.count)!
        
        
       
        if selectedIndex != -1 {
//            let indexPath = NSIndexPath(forRow: (stst-1), inSection: selectedIndex)
//            profileTableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: UITableViewScrollPosition.top, animated: true)
            
            let indexPath = IndexPath(row:  (stst-1), section: selectedIndex)
            //profileTableView.scrollToRow(at: indexPath, at: .top, animated: true)
            
            
            //let indexPath = IndexPath(row: 9 , section: 1)
        profileTableView.reloadData()
            profileTableView.scrollToRow(at: indexPath, at: UITableViewScrollPosition.top, animated: true)
            
//            profileTableView.scrollToRow(at: path, at: UITableViewScrollPositionTop, animated: true)
        }
        
        
       
    
        
//        if (selectedIndex != -1) {
//            [_aTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:addClinicFieldsArray.count - 1 inSection:selectedIndex] atScrollPosition:UITableViewScrollPositionTop animated:YES];
//        }
    }
    
    
    func noteLabelViewForContactNumbersWithText(str:String)->UIView{
        let rightView = UIView(frame: CGRect(x: 0, y: 0, width: 125, height: 40))
        
        let label = UILabel(frame: rightView.frame)
   
        label.text = str
        label.textColor = UIColor.gray
        
        //let fontSize = self.label.font.pointSize;
        label.font = UIFont(name: "HelveticaNeue", size: 12)
        //label.font = UIFont(name:"Roboto-Regular" , size:5.0)
        label.textAlignment = .right
         rightView.addSubview(label)
    return rightView;
    }
}
extension ProfileViewController: UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return numberOfRowsFirstSection
        }
        
        // print(v?.reminderDrugs?.count)
        
        return numberOfRowsSecondSection
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return numberOfRows
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
        if indexPath.row == DBXEditProfileCellType.DBXEditProfileCellTypeDoubleDropDown.rawValue {
             let cell = tableView.dequeueReusableCell(withIdentifier: "DBXDoubleDropDownTypeCell", for: indexPath) as! DBXDoubleDropDownTypeCell
            cell.firstTxt.delegate = self
              cell.secondTxt.delegate = self
            cell.firstTxt.tag = indexPath.row
             cell.secondTxt.tag = indexPath.row
            
            cell.firstTxt.placeholder = "Gender"
            cell.secondTxt.placeholder = "Practising Since"
        cell.firstTxt.text = doctorInfos?.gender
//            let  str = dateFromMilliseconds(ms:(doctorInfos?.createdDate)!)
//            let dateFormatter = DateFormatter()
//
//            dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
//            dateFormatter.dateFormat = "dd-MMM-yyyy"
//            let resultString = dateFormatter.string(from: str as Date)
             //cell.secondTxt.text = resultString
            
            
//             textFieldDataWithTextField(activeTextField:cell.firstTxt, isFromCell: true)
            
             textFieldDataWithTextField(activeTextField:cell.secondTxt, isFromCell: true)
//            textFieldDataWithTextField(activeTextField:cell.secondTxt, isFromCell: true)
            
            
            cell.firstTxt.isUserInteractionEnabled = false
              cell.secondTxt.isUserInteractionEnabled = false
           
           // cell.unHideDropDownIcons()
          //  cell.updatetextFieldHidden()
//            [doubleDropDownTypeCell.firstTextField setUserInteractionEnabled:NO];
//            [doubleDropDownTypeCell.secondTextField setUserInteractionEnabled:NO];
//            [doubleDropDownTypeCell unHideDropDownIcons];
//            doubleDropDownTypeCell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell
        }
            
           
            
        else if indexPath.row == DBXEditProfileCellType.DBXEditProfileCellTypeDoctorName.rawValue || indexPath.row == DBXEditProfileCellType.DBXEditProfileCellTypeEmailID.rawValue || indexPath.row == DBXEditProfileCellType.DBXEditProfileCellTypeMedicalRegistrationNo.rawValue || indexPath.row == DBXEditProfileCellType.DBXEditProfileCellTypeMobileNumber.rawValue || indexPath.row == DBXEditProfileCellType.DBXEditProfileCellTypeSpeciality.rawValue || indexPath.row == DBXEditProfileCellType.DBXEditProfileCellTypeQualifiation.rawValue{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "DBXProfileTextFieldTableViewCell", for: indexPath) as! DBXProfileTextFieldTableViewCell
            cell.aTextFiled.delegate = self
            cell.aTextFiled.tag = indexPath.row
            cell.aTextFiled.isEnabled = false
            let sts :String = textFieldArray![indexPath.row] as! String
            let myString = String(describing: doctorInfos?.firstName)
            cell.aTextFiled.text = myString
            cell.aTextFiled.placeholder = sts
             cell.aTextFiled.rightView = nil;
            textFieldDataWithTextField(activeTextField: cell.aTextFiled, isFromCell: true)
            if indexPath.row == DBXEditProfileCellType.DBXEditProfileCellTypeMobileNumber.rawValue{
                
                
                cell.aTextFiled.rightView =  noteLabelViewForContactNumbersWithText(str:"Not visible to patients.")
                cell.aTextFiled.rightViewMode = .always
            }
           
            
            
            
            cell.aTextFiled.isUserInteractionEnabled = false
           // cell.phototsAttachedLabel.text = "Tap here to view the attached photos"

        
      
      return cell
        
       
        }
        
        else if indexPath.row == DBXEditProfileCellType.DBXEditProfileCellTypeCaptureDegree.rawValue{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "DBXProfileCaptureTableViewCell", for: indexPath) as! DBXProfileTextFieldTableViewCell
            
            cell.aTextFiled.delegate = self
            cell.aTextFiled.tag = indexPath.row
            cell.aTextFiled.isEnabled = false
            let sts :String = textFieldArray![indexPath.row] as! String
            
            cell.aTextFiled.placeholder = sts
            cell.phototsAttachedLabel.text = "Tap here to view the attached photos"
            
            
            
            return cell
            
            
            }
        else if indexPath.row == DBXEditProfileCellType.DBXEditProfileCellTypePrimaryContactNumber.rawValue{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "DBXDualPhoneNumberTableViewCell", for: indexPath) as! DBXDualPhoneNumberTableViewCell
            
        
            
            cell.phonetxt.text = doctorInfos?.primaryContactNumber
            cell.phonetxt.rightView =  noteLabelViewForContactNumbersWithText(str:"Visible to patients.")
            cell.phonetxt.rightViewMode = .always
            
        
//            textFieldDataWithTextField(activeTextField: cell.phonetxt, isFromCell: true)
            
//            cell.co
//            textFieldDataWithTextField(activeTextField: cell.aTextFiled, isFromCell: true)
//            cell.aTextFiled.delegate = self
//            cell.aTextFiled.tag = indexPath.row
//            cell.aTextFiled.isEnabled = false
//            let sts :String = textFieldArray![indexPath.row] as! String
//
//            cell.aTextFiled.placeholder = sts
            // cell.phototsAttachedLabel.text = "Tap here to view the attached photos"
            
            
            
            return cell
            
            
            }
        }
     

        if indexPath.row == DBXClinicCellType.DBXClinicCellTypeClinicPhotos.rawValue {
            
        
         let cell = tableView.dequeueReusableCell(withIdentifier: "DBXProfileImagesTableViewCell", for: indexPath) as! DBXProfileImagesTableViewCell
        
        let clinicDetails = doctorInfos?.clinicInfos![0]
        
        cell.configure(placeholder: clinicDetails!)
            return cell
        
        }
      else  if (indexPath.row == DBXClinicCellType.DBXClinicCellTypeClinicName.rawValue||indexPath.row == DBXClinicCellType.DBXClinicCellTypeClinicPrimaryNumber.rawValue||indexPath.row == DBXClinicCellType.DBXClinicCellTypeAddClinicPhoneNumber.rawValue||indexPath.row == DBXClinicCellType.DBXClinicCellTypeAddTimings.rawValue||indexPath.row == DBXClinicCellType.DBXClinicCellTypeCity.rawValue||indexPath.row == DBXClinicCellType.DBXClinicCellTypeLocality.rawValue||indexPath.row == DBXClinicCellType.DBXClinicCellTypeLandmark.rawValue||indexPath.row == DBXClinicCellType.DBXClinicCellTypeZip.rawValue)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DBXProfileTextFieldTableViewCell", for: indexPath) as! DBXProfileTextFieldTableViewCell

            cell.aTextFiled.delegate = self
            cell.aTextFiled.tag = indexPath.row
            cell.aTextFiled.isEnabled = false
            let sts :String = addClinicFieldsArray![indexPath.row] as! String

            cell.aTextFiled.placeholder = sts
//            let myString = String(describing: doctorInfos?.qualification)
//            cell.aTextFiled.text = myString

            let str = doctorInfos?.clinicInfos![0]
            clinicDataWithTextField(activeTextField: cell.aTextFiled, isFromCell: true,infoClinic:str! )


            cell.aTextFiled.rightView = nil;
            cell.aTextFiled.isUserInteractionEnabled = false
      return cell
        }
        
        else if  indexPath.row == DBXClinicCellType.DBXClinicCellTypeAddress.rawValue{
            let cell = tableView.dequeueReusableCell(withIdentifier: "DBXAddressTableViewCell", for: indexPath) as! DBXAddressTableViewCell
             let str = doctorInfos?.clinicInfos![0]
            cell.addresscell.text = str?.addressDetail
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "PatientSearchTableViewCell", for: indexPath) as! PatientSearchTableViewCell
      
    return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
         if section == 0{
            return 0
        }
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {  if indexPath.section == 0{
        
         return 50.0;
        }
        
    else{
        
        
        if selectedIndex == indexPath.section{
            
        
        if indexPath.row == DBXClinicCellType.DBXClinicCellTypeClinicPhotos.rawValue{
        return 100.0;
        }
        else{
        return 50.0;
            }
        }
        return 0
    }
        
       //Choose your custom row height
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    
        
        if section == 0{
          
            
            //        viewset?.delegate = self
            //        viewset?.dropDownButton.tag = section
            //
            //        print(viewset!)
            //        viewset?.viewWithTag(section)
            
            return nil
        }
        
        let viewset = (Bundle.main.loadNibNamed("DBXProfileHeaderView", owner: self, options: nil)![1] as? DBXProfileHeaderView)
        viewset?.tag = section
        viewset?.delegate = self
//        viewset?.dropDownButton.tag = section
//        
//        print(viewset!)
//        viewset?.viewWithTag(section)
        
        return viewset
        
}
}

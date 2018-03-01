//
//  ViewController.swift
//  DoctorSwift
//
//  Created by Apple on 14/01/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,DoctorDataTaskModelDelegate,UISearchBarDelegate {
    func buttonTapped() {
        
    }
    
 var year:Int = 0
    @IBOutlet weak var tblList: UITableView!
    var directionToHead = DBXPatientHeaderType.DBXPatientHeaderTypeInteractions
    @IBOutlet weak var searchBar: UISearchBar!
    var isSearch : Bool = false
    var arrCountry = ["Afghanistan", "Algeria", "Bahrain","Brazil", "Cuba", "Denmark","Denmark", "Georgia", "Hong Kong", "Iceland", "India", "Japan", "Kuwait", "Nepal"];
    var arrFilter:[String] = []
    // var searchResult : SearchResult? = nil
    var searchResult : Array<SearchResult>?
    override func viewDidLoad() {
        super.viewDidLoad()
        tblList.register(UINib(nibName: "DBXPatientCell", bundle: nil), forCellReuseIdentifier: "DBXPatientCell")
        tblList.rowHeight = 104;
        dataTaskModel.delegate = self
        searchBar.delegate = self
       // tblList.tableFooterView = UIView()
        tblList.backgroundColor = UIColor(red: 245.0/255, green: 245.0/255, blue: 245.0/255, alpha: 1.0)

        // Do any additional setup after loading the view, typically from a nib.
    }
    //MARK: UISearchbar delegate
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        isSearch = true;
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        isSearch = false;
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        isSearch = false;
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("searchText \(String(describing: searchBar.text))")
        
//        print(searchBar.text!)
//        if searchBar.text?.characters == 0 {
//            isSearch = false;
//
//        } else {
        
        
//        let number =searchBar.text
//        let numberCharacters = NSCharacterSet.decimalDigitCharacterSet().invertedSet
//        if !number.isEmpty && number.rangeOfCharacterFromSet(numberCharacters) == nil {
//            // string is a valid number
//        } else {
//            // string contained non-digit characters
//        }
//
        let someString = searchBar.text
        let numberCharacters = NSCharacterSet.decimalDigits
        
        if someString?.rangeOfCharacter(from: numberCharacters) != nil
        {
            print("String contains numbers")
            
        }
        else if someString?.rangeOfCharacter(from: numberCharacters) == nil
        {
            print("String doesn't contains numbers")
            
        }
        
        
        getUserProfile1(no1:searchBar.text! as NSString)
       // }
        searchBar.resignFirstResponder()
        isSearch = false;
    }
    func validate(value: String) -> Bool {
        let PHONE_REGEX = "^((\\+)|(00))[0-9]{6,14}$";    let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: value)
        return result
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        
       
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    fileprivate func getUserProfile1(no1:NSString)  {
        
        
        
        let param = NSMutableDictionary()
        
        
        param["doctorId"] = "14120"
        param["deviceType"] = "IOS"
        param["version"] = "1.6"
        param["mobileNumber"] = no1
        
      
        dataTaskModel.getUserProfile(parameter: param, myProfile: false)
        
    
        
        
    }
    func didRecieveResponseOfUserInfo(json: NSMutableDictionary){
        print(json)
     searchResult = SearchResult.modelsFromDictionaryArray(array: json["searchResult"] as! NSArray)
        print(searchResult ?? "");
        year = (searchResult?.count)!
        let searchResutser = searchResult![1]
        print(searchResutser.dateOfBirth ?? "")
        print(searchResutser.name!)
        print(searchResutser.familyMemberId ?? "")
        print(searchResutser.age ?? "")
        print(searchResutser.allergies!)
        print(searchResutser.mobileNumber ?? "")
        
        
    tblList.reloadData()
        
      
        
        DoctorSingleton.sharedInstance.activityLoader.hideActivityIndicator()
        
        
        
        
        
        
    }
}
extension HomeViewController: UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // print(v?.reminderDrugs?.count)
        
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return year
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DBXPatientCell", for: indexPath) as! DBXPatientCell
        
        if let contentView = cell.viewWithTag(100){
            contentView.layer.masksToBounds = false
            contentView.layer.shadowColor = UIColor.black.cgColor
            contentView.layer.shadowOpacity = 0.2
            contentView.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
            contentView.layer.shadowRadius = 0.1
            contentView.layer.cornerRadius = 5.0
        }
        if let rightView = cell.viewWithTag(10){
          rightView.clipsToBounds=true;
            rightView.layer.cornerRadius = 5.0
        }
        if let prescribe = cell.viewWithTag(11){
           prescribe.layer.borderWidth = 1.0
            prescribe.clipsToBounds=true;
            prescribe.layer.cornerRadius = 5.0
          
            prescribe.layer.borderColor = UIColor(red: 35.0/255, green: 163.0/255, blue: 159.0/255, alpha: 1.0).cgColor
        }
        if let addbutton = cell.viewWithTag(12){
            addbutton.layer.borderWidth = 1.0
            addbutton.clipsToBounds=true;
            addbutton.layer.cornerRadius = 5.0
            
            addbutton.layer.borderColor = UIColor(red: 35.0/255, green: 163.0/255, blue: 159.0/255, alpha: 1.0).cgColor
        }
        


        
//        let listInfo = searchResult![indexPath.row]
//        print(listInfo)
//        cell.Namelbl.text = listInfo.name
//        cell.buttonTapped(name:[listInfo])
//         cell.student(name:listInfo)
 
       
        
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 104.0;//Choose your custom row height
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       let vw = UIView()
        vw.backgroundColor = UIColor(red: 245.0/255, green: 245.0/255, blue: 245.0/255, alpha: 1.0)
       
        return vw
    }
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 7
    }
}


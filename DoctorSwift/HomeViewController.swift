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
        tblList.register(UINib(nibName: "PatientSearchTableViewCell", bundle: nil), forCellReuseIdentifier: "PatientSearchTableViewCell")
        tblList.rowHeight = 104;
        dataTaskModel.delegate = self
        searchBar.delegate = self
        

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
//
        getUserProfile1(no1:searchBar.text! as NSString)
       // }
        searchBar.resignFirstResponder()
        isSearch = false;
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
extension HomeViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // print(v?.reminderDrugs?.count)
        
        return year
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PatientSearchTableViewCell", for: indexPath) as! PatientSearchTableViewCell
        
        
        //        let rect = CGRect(origin: .zero, size: CGSize(width: cell.frame.width, height: 100))
        //        let dynamicLabel: UILabel = UILabel()
        //        dynamicLabel.frame = rect
        
        
        let listInfo = searchResult![indexPath.row]
        print(listInfo)
        cell.Namelbl.text = listInfo.name
        cell.buttonTapped(name:[listInfo])
         cell.student(name:listInfo)
 
       
        
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 104.0;//Choose your custom row height
    }
}


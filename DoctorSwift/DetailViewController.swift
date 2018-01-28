//
//  DetailViewController.swift
//  DoctorSwift
//
//  Created by Apple on 17/01/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,DoctorDataTaskModelDelegate,interactionsFilterDelegate {
    
    
   
    
  let MyCollectionViewCellId: String = "DetailCollectionViewCell"
    @IBOutlet weak var headerCollectionView: UICollectionView!
    @IBOutlet weak var tblList: UITableView!
    let array:[String] = ["INVESTIGATIONS", "REPORTS", "PRESCRIPTIONS"]
    var headerType:Int = 2
    var rowCount:Int = 0
    var start:Int = 0
     var limit:Int = 20
    
    var headerid:Int = 0
     var userInfo = NSMutableDictionary()
   var cowboyUsersArray = NSMutableArray()
  
    var documentResponse : Array<DocumentResponse>?

    var moreRecords : Int? = 1
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        let editImage    = UIImage(named: "menu_add_icon")!
        let searchImage  = UIImage(named: "menu_filter_icon")!
        
        let backImage = UIImage(named:"menu_back_arrow_icon")!
        
//
//        let editButton   = UIBarButtonItem(image: editImage,  style: .plain, target: self, action: Selector(("didTapEditButton:")))
//        let searchButton = UIBarButtonItem(image: searchImage,  style: .plain, target: self, action: Selector(("didTapSearchButton:")))
//
//        navigationItem.rightBarButtonItems = [editButton, searchButton]
        
         let BackI:UIBarButtonItem = UIBarButtonItem(image: backImage, style: UIBarButtonItemStyle.plain, target: self, action: #selector(DetailViewController.backTapped))
        
        let rightAddBarButtonItem:UIBarButtonItem = UIBarButtonItem(image: editImage, style: UIBarButtonItemStyle.plain, target: self, action: #selector(DetailViewController.addTapped))
        // 2
        let rightSearchBarButtonItem:UIBarButtonItem = UIBarButtonItem(image: searchImage, style: UIBarButtonItemStyle.plain, target: self, action: #selector(DetailViewController.searchTapped))
        // 3
        self.navigationItem.setRightBarButtonItems([rightAddBarButtonItem,rightSearchBarButtonItem], animated: true)
        
        self.navigationItem.setLeftBarButton(BackI, animated: true)
        
        // Do any additional setup after loading the view, typically from a nib.
    
    // 4
   
        
        
        
        
        headerType = DBXPatientHeaderType.DBXPatientHeaderTypePrescription.rawValue
        dataTaskModel.delegate = self
        let nibCell = UINib(nibName: MyCollectionViewCellId, bundle: nil)
        headerCollectionView.register(nibCell, forCellWithReuseIdentifier: MyCollectionViewCellId)
        
        tblList.register(UINib(nibName: "PatientSearchTableViewCell", bundle: nil), forCellReuseIdentifier: "PatientSearchTableViewCell")
          tblList.register(UINib(nibName: "PrescriptionTableViewCell", bundle: nil), forCellReuseIdentifier: "PrescriptionTableViewCell")
          tblList.register(UINib(nibName: "ReportTableViewCell", bundle: nil), forCellReuseIdentifier: "ReportTableViewCell")
        
        
        
        tblList.estimatedRowHeight = 44
        tblList.rowHeight = UITableViewAutomaticDimension
       
        headerCollectionView.delegate=self
        headerCollectionView.dataSource=self
        
        headerType = 2
        fetchHealthRecordsList(str: DBXPatientHeaderType(rawValue: 2)!)
       tblList.reloadData()

        // Do any additional setup after loading the view.
    }
    @objc func backTapped(sender:UIButton) {
        print("search pressed")
    }
    // 5
    @objc func addTapped (sender:UIButton) {
        let newViewController = interactionsFilterViewViewController(nibName: "interactionsFilterViewViewController", bundle: nil)
        newViewController.delegate = self
        
        // Present View "Modally"
        self.present(newViewController, animated: true, completion: nil)
        print("add pressed")
    }
    @objc func searchTapped (sender:UIButton) {
        print("add pressed")
    }
   
        
    override func viewWillAppear(_ animated: Bool) {
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCellId, for: indexPath) as! DetailCollectionViewCell
        
        
//        dynamicLabel.text = array[indexPath.row]
//         cell.contentView.addSubview(dynamicLabel)
        
        
//        print(array[indexPath.row]);
//
//        let rect = CGRect(origin: .zero, size: CGSize(width: cell.frame.width, height: cell.frame.height))
//        let dynamicLabel: UIImageView = UIImageView()
//        dynamicLabel.frame = rect
//        dynamicLabel.image = UIImage(named:array[indexPath.row])
//
//
//        // label.tag = indexPath.row
//        cell.contentView.addSubview(dynamicLabel)
        
        // cell.image.image = UIImage(named:array[indexPath.row])
        
        cell.ssssssss.text = array[indexPath.row]
       
       
        cell.placeholderView.isHidden = (indexPath.row != headerType)
       // cell.placeholderView.backgroundColor = UIColor.red
        
       
        return cell
    }

func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    headerType = indexPath.row
    moreRecords = 1
    cowboyUsersArray = NSMutableArray()
    start = 0
    limit = 5
    fetchHealthRecordsList(str: DBXPatientHeaderType(rawValue: headerType)!)
    headerCollectionView.reloadData()
    // handle tap events
    //    print("You selected cell #\(indexPath.item)!")
    //
    //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //    let vc = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
    //    //vc.listArray=array as! NSMutableArray
    //    navigationController?.pushViewController(vc,
    //                                             animated: true)
}
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
       var bounds = UIScreen.main.bounds
        var width = bounds.size.width
        
        print(width)
        var myCGFloat: CGFloat = ((width - 8)/3)
print(myCGFloat)
        Int(floor(myCGFloat)) // 3
        Int(ceil(myCGFloat))
      
        
        return CGSize.init(width:myCGFloat, height: 40)
    }
    
    
    
    fileprivate func fetchHealthRecordsList(str:DBXPatientHeaderType)  {
        
         //headerType = DBXPatientHeaderType.DBXPatientHeaderTypePrescription.rawValue
        print(str.rawValue)
        let param = NSMutableDictionary()
       headerid = str.rawValue
        var sts:Int = 0
        if str.rawValue == 0{
            sts = 6
        }
        else if str.rawValue == 1{
            sts = 4
        }
        else{
            sts = 5
        }
        
        
        if moreRecords == 1{
            param["doctorId"] = "14120"
            param["documentId"] = "0"
            param["familyMemberId"] = "101"
             param["start"] = start
            param["limit"] = limit
            param["userId"] = "5594"
            param["typeId"] = sts
            
         dataTaskModel.HealthRecordsList(parameter: param, myProfile: false)
        }
      
     
        
       
        
        
        
        
    }
    fileprivate func fetchHealthRecordsListset()  {
        
        
        //headerType = DBXPatientHeaderType.DBXPatientHeaderTypeReports.rawValue
        let param = NSMutableDictionary()
         var sts:Int = 0
        if headerid == 0{
            sts = 6
        }
        else if headerid == 1{
            sts = 4
        }
        else{
            sts = 5
        }
        
        
       
        
          if moreRecords == 1{
        param["doctorId"] = "14120"
        param["documentId"] = "0"
        param["familyMemberId"] = "101"
        param["start"] = start
        param["limit"] = limit
        param["userId"] = "5594"
        param["typeId"] = sts
        
        
        
        
        
        
        dataTaskModel.HealthRecordsList(parameter: param, myProfile: false)
        
        }
        
        
    }
    func didRecieveResponseOfHealthRecords(json: NSMutableDictionary){
        
        print(json);
 
       // headerType = DBXPatientHeaderType.DBXPatientHeaderTypeReports.rawValue
        moreRecords = json["moreRecords"] as? Int
        
       // var a:[Any] = json["DocumentResponse"];
        
        
//        var b:NSMutableArray = ["a","b","c"];
//        var c:NSMutableArray = NSMutableArray();
//        c.addObjects(from: a as [AnyObject])
//
        
        
//     let   documentResponsesets = DocumentResponse.modelsFromDictionaryArray(array: json["DocumentResponse"] as! NSArray)
        
       cowboyUsersArray.addObjects(from: ((json["DocumentResponse"] as! NSArray) as! [NSDictionary]))
        
        
//          userInfo = (json.value(forKey: "DocumentResponse")as! NSDictionary).mutableCopy() as! NSMutableDictionary
        documentResponse = DocumentResponse.modelsFromDictionaryArray(array: cowboyUsersArray as NSArray)
    
        //documentResponseset?.append(documentResponse)
        rowCount = cowboyUsersArray.count
        start = rowCount
        limit = rowCount+20
        
        
      //  let searchResutser = documentResponse![11]
        
        
        //let ssss =  searchResutser.diseaseList![1]
        
//        let dictionarysetss = NSMutableArray()
//        for set in(searchResutser.diseaseList)!{
//
//
//            print(set.dictionaryRepresentation() )
//
//            //dictionary .setValue(item.dictionaryRepresentation(), forKey: "reminderList")
//            dictionarysetss.add(set.dictionaryRepresentation())
//        }
//
//        print(dateFromMilliseconds(ms: searchResutser.createdDate!))
//
//        let  str = dateFromMilliseconds(ms: searchResutser.createdDate!)
//
//
//
//
//        let dateFormatter = DateFormatter()
//        let tempLocale = dateFormatter.locale // save locale temporarily
//        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
//        dateFormatter.dateFormat = "dd-MMM-yyyy"
//
//
//
//
//        let resultString = dateFormatter.string(from: str as Date)
//
//        print(resultString)
      
//        print(dictionarysetss)
//
//        let  setdatav = [dictionarysetss .value(forKey: "name")]
//        print(setdatav)
//
//        print(searchResutser.doctorSpeciality!)
//
//
        
       
            self.tblList.reloadData()
        
//
//
        DispatchQueue.main.async {
        self.tblList.reloadData()
        }
      
      
        DoctorSingleton.sharedInstance.activityLoader.hideActivityIndicator()
        
        
        
        
        
        
    }
    func convertDateFormater( date: String) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss z"
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return  dateFormatter.string(from: date!)
        
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
    func playVideoButtonDidSelect(str: NSString) {
        
    }
    
}

extension DetailViewController: UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // print(v?.reminderDrugs?.count)
        
        return rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch headerType {
        case DBXPatientHeaderType.DBXPatientHeaderTypeInteractions.rawValue:
            
            
            
            
            
        print(headerType)
            let cell = tableView.dequeueReusableCell(withIdentifier: "PatientSearchTableViewCell", for: indexPath) as! PatientSearchTableViewCell
            
            
            //        let rect = CGRect(origin: .zero, size: CGSize(width: cell.frame.width, height: 100))
            //        let dynamicLabel: UILabel = UILabel()
            //        dynamicLabel.frame = rect
            
            
//            let listInfo = documentResponse![indexPath.row]
//            //        print(listInfo)
//            cell.Namelbl.text = listInfo.doctorSpeciality
            //        cell.buttonTapped(name:[listInfo])
            //        cell.student(name:listInfo)
            //
            
            
            
            return cell
            
 
        case DBXPatientHeaderType.DBXPatientHeaderTypePrescription.rawValue:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "PrescriptionTableViewCell", for: indexPath) as! PrescriptionTableViewCell
            
            
            //        let rect = CGRect(origin: .zero, size: CGSize(width: cell.frame.width, height: 100))
            //        let dynamicLabel: UILabel = UILabel()
            //        dynamicLabel.frame = rect
            
            
//            let listInfo = documentResponse![indexPath.row]
//            print(listInfo)
//
//
//            cell.student(response:listInfo )
//            cell.setNeedsUpdateConstraints()
//            cell.updateConstraintsIfNeeded()
            return cell
 
        case DBXPatientHeaderType.DBXPatientHeaderTypeReports.rawValue:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReportTableViewCell", for: indexPath) as! ReportTableViewCell
            
            
            //        let rect = CGRect(origin: .zero, size: CGSize(width: cell.frame.width, height: 100))
            //        let dynamicLabel: UILabel = UILabel()
            //        dynamicLabel.frame = rect
            
            
            let listInfo = documentResponse![indexPath.row]
            //        print(listInfo)
           // cell.Namelbl.text = listInfo.reportType
            //        cell.buttonTapped(name:[listInfo])
            
            
            
            
            let  str = dateFromMilliseconds(ms: listInfo.createdDate!)
            let dateFormatter = DateFormatter()
            
            dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
            dateFormatter.dateFormat = "dd-MMM-yyyy"
            let resultString = dateFormatter.string(from: str as Date)
            
            let myString: String? = listInfo.reportType
            
           
            
            if (myString ?? "").isEmpty {
              
                
            }
            else{
               print("subhajit")
                let secondText = resultString + ", " + listInfo.reportType!
                cell.dateAndTypelbl.text = secondText
            }
            
            
            
            //print(listInfo.reportType!)
           
            
//             cell.dateAndTypelbl.text = "তৃণমূল ছাত্র পরিষদের নেতা তথা ছাত্র সংসদের সাধারণ সম্পাদক শাহিদ হাসান খান ছাত্র সংসদের মধ্যেই নিগ্রহ করছেন কলেজের এক ছাত্রীকে। সিসিটিভি ক্যামেরায় ধরাও পড়েছে এই দৃশ্য। নিগৃহীতার অভিযোগ এবং সংবাদমাধ্যমের চড়া আলোকপাত শেষ পর্যন্ত কঠিন করে তুলল পরিস্থিতি, গ্রেফতার হলেন অভিযুক্ত, জেল হেফাজতে গেলেন।"
             let myStringset: String? = listInfo.doctorName
            if (myStringset ?? "").isEmpty {
                
                
            }
            else{
                print("subhajit")
                let secondText = listInfo.doctorName! + ", " + listInfo.doctorSpeciality!
                cell.centerNamelbl.text = secondText
            }
            
           
                 //  cell.student(response:listInfo)
            //
//            cell.setNeedsUpdateConstraints()
//            cell.updateConstraintsIfNeeded()
            
            
            return cell

            
        default:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReportTableViewCell", for: indexPath) as! ReportTableViewCell
            
            
            //        let rect = CGRect(origin: .zero, size: CGSize(width: cell.frame.width, height: 100))
            //        let dynamicLabel: UILabel = UILabel()
            //        dynamicLabel.frame = rect
            
            
           //let listInfo = documentResponse![indexPath.row]
//            //        print(listInfo)
//            cell.Namelbl.text = listInfo.diagName
            //        cell.buttonTapped(name:[listInfo])
               // cell.student(response:listInfo)
            //
            
            
            
            return cell
            
        }
    }
     func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
     
        if (indexPath.row == (documentResponse?.count)! - 2) {
             print("displaycell")
             fetchHealthRecordsListset()
        }
  
        
        
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView){
        
        print("scroll down")
          tblList.reloadData()
    }
    func scrollToBottom(){
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: (self.documentResponse?.count)!-1, section: 0)
            self.tblList.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
//    {
//        return UITableViewAutomaticDimension;//Choose your custom row height
//    }
    
}

//
//  interactionsFilterViewViewController.swift
//  DoctorSwift
//
//  Created by Apple on 18/01/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
protocol interactionsFilterDelegate : class {
   
    func playVideoButtonDidSelect(str:NSString)
}
class interactionsFilterViewViewController: UIViewController,DoctorDataTaskModelDelegate,FilterDelegate {
   
    
   
    
    var list : Array<List>?
      var diagnosticlist : Array<List>?
    var countArrayForDoctor:Int = 0
     var countArrayForDiagnostic:Int = 0
    
    @IBOutlet weak var tableList: UITableView!
    weak var delegate: interactionsFilterDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
//         tblList.register(UINib(nibName: "PatientSearchTableViewCell", bundle: nil), forCellReuseIdentifier: "PatientSearchTableViewCell")
         tableList.register(UINib(nibName: "PatientSearchTableViewCell", bundle: nil), forCellReuseIdentifier: "PatientSearchTableViewCell")
        tableList.register(UINib(nibName: "DBXFilterHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "DBXFilterHeaderView")
        tableList.estimatedRowHeight = 40
        dataTaskModel.delegate = self
fetchHealthRecordsList()
        fetchHealthRecordsDiagnosticList()
        // Do any additional setup after loading the view.
    }

    @IBAction func cancelClick(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    fileprivate func fetchHealthRecordsDiagnosticList()  {
        
        let param = NSMutableDictionary()
        
        
        
        
        
        param["doctorId"] = "14120"
        param["familyMemberId"] = "101"
        param["typeId"] = "2"
        param["documentType"] = "4"
        param["userId"] = "5594"
        
        
        
        
        dataTaskModel.fetchHealthRecordsDiagnosticList(parameter: param)
        
        
        
        
    }
    func didRecievefetchHealthRecordsDiagnosticList(json: NSMutableDictionary){
        
        
        diagnosticlist = List.modelsFromDictionaryArray(array: json["List"] as! NSArray)
        
        countArrayForDiagnostic = (diagnosticlist?.count)!
        DoctorSingleton.sharedInstance.activityLoader.hideActivityIndicator()
        
        tableList.reloadData()
        
        
        
        
    }
    
    
    
    fileprivate func fetchHealthRecordsList()  {
       
        let param = NSMutableDictionary()
        
       
        
        
        
        param["doctorId"] = "14120"
        param["familyMemberId"] = "101"
        param["typeId"] = "1"
        param["documentType"] = "5"
         param["userId"] = "5594"
      

        
        
        dataTaskModel.familymemberInfoList(parameter: param)
        
        
        
        
    }
    func didRecieveFamilymemberList(json: NSMutableDictionary){
        
      
        list = List.modelsFromDictionaryArray(array: json["List"] as! NSArray)
        
        countArrayForDoctor = (list?.count)!
        DoctorSingleton.sharedInstance.activityLoader.hideActivityIndicator()
        
      // tableList.reloadData()
        
        
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func filterSetForDropdown(str: Int) {
        
        if str == 0{
            countArrayForDoctor = (list?.count)!
            countArrayForDiagnostic = 0
        }else{
            countArrayForDiagnostic = (diagnosticlist?.count)!
            countArrayForDoctor = 0
        }
    tableList.reloadData()
    }

}

extension interactionsFilterViewViewController: UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return countArrayForDoctor
        }
       
        // print(v?.reminderDrugs?.count)
        
        return countArrayForDiagnostic
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
       
        return 2
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PatientSearchTableViewCell", for: indexPath) as! PatientSearchTableViewCell
            
            let listInfo = list![indexPath.row]
            
            cell.Namelbl.text = listInfo.name
            
            //        let rect = CGRect(origin: .zero, size: CGSize(width: cell.frame.width, height: 100))
            //        let dynamicLabel: UILabel = UILabel()
            //        dynamicLabel.frame = rect
            
            
            
            
            
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "PatientSearchTableViewCell", for: indexPath) as! PatientSearchTableViewCell
        
        let listInfo = diagnosticlist![indexPath.row]
        
        cell.Namelbl.text = listInfo.name
        
        //        let rect = CGRect(origin: .zero, size: CGSize(width: cell.frame.width, height: 100))
        //        let dynamicLabel: UILabel = UILabel()
        //        dynamicLabel.frame = rect
        
        
        
        
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 46.0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 104.0;//Choose your custom row height
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let viewset = (Bundle.main.loadNibNamed("DBXFilterHeaderView", owner: self, options: nil)![0] as? DBXFilterHeaderView)
        
        viewset?.delegate = self
        viewset?.dropDownButton.tag = section

        print(viewset!)
      viewset?.viewWithTag(section)
       
        return viewset
//        let vw = UIView()
//        vw.backgroundColor = UIColor.red
//
//        return vw
    }
}

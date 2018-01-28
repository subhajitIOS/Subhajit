//
//  RecordViewController.swift
//  DoctorSwift
//
//  Created by Apple on 27/01/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class RecordViewController: UIViewController ,UITableViewDelegate{
    var year:Int = 1
    
    @IBOutlet weak var recordTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        recordTableView.delegate = self
        recordTableView.dataSource = self
         recordTableView.register(UINib(nibName: "DBXRecordInteractionCell", bundle: nil), forCellReuseIdentifier: "DBXRecordInteractionCell")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension RecordViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // print(v?.reminderDrugs?.count)
        
        return year
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DBXRecordInteractionCell", for: indexPath) as! DBXRecordInteractionCell
        
        cell.reloadInput()
        //        let rect = CGRect(origin: .zero, size: CGSize(width: cell.frame.width, height: 100))
        //        let dynamicLabel: UILabel = UILabel()
        //        dynamicLabel.frame = rect
        
        
      
        
        
        
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 130.0;//Choose your custom row height
    }
}

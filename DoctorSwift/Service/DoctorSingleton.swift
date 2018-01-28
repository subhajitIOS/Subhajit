//
//  CBSingleton.swift
//  cowboyspot
//
//  Created by AMIR on 7/24/17.
//  Copyright © 2017 Offsureit. All rights reserved.
//

import UIKit







class DoctorSingleton: NSObject {
    
    
//   fileprivate let keychainWrapper = KeychainWrapper(serviceName: KeychainWrapper.standard.serviceName, accessGroup: "group.deviceGroup")
    
   fileprivate let transition = CATransition()
    
    
    //MARK: Shared Instance
    
    static let sharedInstance : DoctorSingleton =
    {
        let instance = DoctorSingleton(array: [])
 
        
        return instance
    }()
    
    //MARK: Local Variable
    
    var emptyStringArray : [String]
    
    //MARK: Init
    
    init( array : [String]) {
        
        emptyStringArray = array
    }
    
    
    fileprivate let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil) as UIStoryboard?
 
    fileprivate let toastLabel = UILabel()
    
    var tasks = NSMutableArray()
    
    var activityLoader = ActivityLoaderView()
    
    var feedType:Int = 0
    
    
//    var completionHandler: AWSS3TransferUtilityUploadCompletionHandlerBlock?
//
//    let transferUtility = AWSS3TransferUtility.default()
    
    
    //MARK: Get initial view controller
    
    /**
      Initialize view controller base on user id.
     
     - Returns: It will return UIViewController
     
    */
    
    
   
    
    
    
    //MARK: Initialize AWS cognito
    
    /**
     Initialize AWS cognito.

     */

   
    
    //MARK: Get image data
    
    
   func getImageData(image: UIImage, withSize: CGFloat, withCompresion: CGFloat) -> NSData  {
        
        
        let width = image.size.width;
        let height = image.size.height;
        let maxSize = withSize;
        
        var newHeight = CGFloat(0.0)
        var newWidth = CGFloat(0.0)
        
        // If any side exceeds the maximun size, reduce the greater side to 1200px and proportionately the other one
        if(height > maxSize || width > maxSize)
        {
            if(height > width)
            {
                newHeight = maxSize;
                let quotient = height / maxSize;
                newWidth = width / quotient;
            }
            else if(width >= height)
            {
                newWidth = maxSize;
                let quotient = width / maxSize;
                newHeight = height / quotient;
            }
        }
        
        // Resize the image
        let newSize = CGSize(width: newWidth, height: newHeight)
        
        UIGraphicsBeginImageContext(newSize);
        
        image.draw(in: CGRect(x: 0, y: 0, width:newSize.width, height: newSize.height  ))
    
        UIGraphicsEndImageContext();
        
        return UIImageJPEGRepresentation(image, withCompresion)! as NSData
        
    }
    
    
    
    //MARK: Upload file to AWS cognito
    
    /**
       Upload file to AWS cognito.

     
     */
    
    
   
    
    fileprivate  func generateImageUrl(imageName: String, imageData: NSData) -> NSURL
    {
        
        let fileURL = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(imageName)
        
        do {
            try imageData.write(to: fileURL!, options: .atomic)
            return fileURL! as NSURL
            
        } catch {
            print(error)
            return fileURL! as NSURL
        }
  
    }


    fileprivate func removeImageWithUrl(imageName: String)
    {
       let fileURL = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(imageName)
        do {
            try FileManager.default.removeItem(at: fileURL!)
        } catch
        {
            print(error)
        }
    }
    

    
    

    
    
    //MARK: Set Dictionay value for key
    
    /**
     Saving and removing value in local preference.
     
     
     - Parameter value: It's a Dictionay to be saved in local preference.
     - Parameter key: It's a string to be used for saving value in local preference.
     
     */
    
    func setDictionaryValue(value: NSDictionary, key: String)  {
        
        UserDefaults.standard.set(value, forKey: key)
        
    }
    
    
    
    
    
    /**
     Saving and removing value in local preference.
     
     
     - Parameter key: It's a string to be used for getting value from local preference.
     
     - Returns: It will return a Dictionay value from local preference.
     
     */
    
    func getDictionaryValue(key: String) -> NSDictionary
    {
        
        if let value = UserDefaults.standard.dictionary(forKey: key)
        {
            return value as NSDictionary
        }
        
        return NSDictionary()
        
    }
    

    
    
    //MARK: Set String value for key
    
    /**
     Saving and removing value in local preference.
     
     
     - Parameter value: It's a string to be saved in local preference.
     - Parameter key: It's a string to be used for saving value in local preference.
     
     */
    
    func setValue(value: String, key: String)
    {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    //MARK: Remove value for key
    
    
    /**
     Removing value from local preference.
     
     
     - Parameter key: It's a string to be used for removing value from local preference.
     
     */
    
    func removeValue(key: String)
    {
        UserDefaults.standard.removeObject(forKey:key)
    }
    
    
    //MARK: Get value for key
    
    /**
     Saving and removing value in local preference.
     
     
     - Parameter key: It's a string to be used for getting value from local preference.
     
     - Returns: It will return a string value from local preference.
     
     */
    
    func getValue(key: String) -> String
    {
        
        if let value = UserDefaults.standard.string(forKey: key)
        {
            return value
        }
        
        return ""
        
        
    }


    
    //MARK: Get device id
    
//    func getDeviceID() -> String {
//        
//        
//      var deviceId = keychainWrapper.string(forKey: DEVICE_ID)
//        
//        
//        if(deviceId.characters.count == 0){
//  
//            deviceId = createDeviceID()
//            if(keychainWrapper.set(deviceId, forKey: DEVICE_ID)){
//                
//            }
//            else{
//                
//            }
//        }
//        
//    return deviceId
//        
//    }
    
   private func createDeviceID() -> String {
        let uuid: CFUUID = CFUUIDCreate(nil)
        let cfStr: CFString = CFUUIDCreateString(nil, uuid)
        
        let swiftString: String = cfStr as String
        return swiftString
    }
    

    //MARK: Add corner radious
    
    func addCornerRadius(view: UIView, cornerRadious: CGFloat)
    {
        view.layer.cornerRadius = cornerRadious
        view.clipsToBounds = true
    }
    
    
    //MARK: Add border
    func addBorder(view: UIView, borderWidth:CGFloat , borderColor: UIColor)
    {
        view.layer.borderColor = borderColor.cgColor
        view.layer.borderWidth = borderWidth
    }
    
    
    func addTransition(fromLeftSide: Bool, withDuration: TimeInterval) -> CATransition
    {
        
        transition.duration = withDuration
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        transition.type = kCATransitionPush;
        if fromLeftSide
        {
            transition.subtype = kCATransitionFromLeft;
        }
        else
        {
            transition.subtype = kCATransitionFromRight;
        }
        
        return transition
        
    }
    
    
    
    //MARK: Cancel all previous data task
    
    /**
     Cancel all previous data task operations.
     
     */
    
    func cancelPreviousRequest(){

        for task in self.tasks{
            
            let task = task as! URLSessionTask
            
            if(task.state == .running){
                task.cancel()
            }
            
            self.tasks.remove(task)
        }
        
        
    }

    
    
    
    
    //MARK: Show Alert on current view controller
    
    /**
     Show toast in a view.
     
     - Parameter message:  It's a string to be used for message.
     - Parameter inViewController: It's an UIViewController where alert to be shown.
     
     */
    
    
    func showAlert(message : String, inViewController: UIViewController, alertType: ResponseFlag, completion: @escaping ( _ buttonClick: Bool) -> ()){
        
        switch alertType {
            
        case ResponseFlag.LOGIN_ANOTHER:
            
            showAlertWithTwoOption(message: message, inViewController: inViewController, buttonOneCaption: "Cancel", buttonTwoCaption: "Logout", completion: { (buttonClick) in
                completion(buttonClick)
            })

            break
        case ResponseFlag.LOCATION_ENABLE:
            
            showAlertWithTwoOption(message: message, inViewController: inViewController, buttonOneCaption: "Allow", buttonTwoCaption: "Cancel", completion: { (buttonClick) in
                completion(buttonClick)
            })
            
            break
            
        case ResponseFlag.POST_UPLOAD_SUCCESS:
            
            showAlertWithOneOption(message: message, inViewController: inViewController, buttonOneCaption: "Ok", style: .default,  completion: { (buttonClick) in
                completion(buttonClick)
            })
            
            break
        case ResponseFlag.SESSION_EXPIRE:
            
            showAlertWithOneOption(message: message, inViewController: inViewController, buttonOneCaption: "Ok", style: .destructive, completion: { (buttonClick) in
                completion(buttonClick)
            })
            
            break
            
        default:
            
            showAlertWithOneOption(message: message, inViewController: inViewController, buttonOneCaption: "Ok", style: .default,  completion: { (buttonClick) in
                completion(buttonClick)
            })
            
            break
            
        }

        
        
    }
    
    fileprivate  func showAlertWithOneOption(message: String,inViewController: UIViewController, buttonOneCaption: String, style: UIAlertActionStyle, completion: @escaping ( _ buttonClick: Bool) -> ()){
        
        let alert = UIAlertController(title: "Cowboy Spot", message: message, preferredStyle: .alert)

        let okButton = UIAlertAction(title: buttonOneCaption, style: style, handler:{ (alert: UIAlertAction!) in
            
            completion(true)
            
        })

        alert.addAction(okButton)
        
        inViewController.present(alert, animated: true, completion: nil)
        
    }


    
    fileprivate func showAlertWithTwoOption(message: String,inViewController: UIViewController, buttonOneCaption: String, buttonTwoCaption: String, completion: @escaping ( _ buttonClick: Bool) -> ()){
        
        let alert = UIAlertController(title: "Cowboy Spot", message: message, preferredStyle: .alert)
        

        let cancelButton = UIAlertAction(title: buttonOneCaption, style: UIAlertActionStyle.cancel)
        { _ in
            completion(false)
            
        }
        
        let okButton = UIAlertAction(title: buttonTwoCaption, style: .destructive, handler:{ (alert: UIAlertAction!) in
            
           completion(true)
            
        })

        alert.addAction(cancelButton)
        alert.addAction(okButton)
        
        inViewController.present(alert, animated: true, completion: nil)
        
    }
    
    
    
    //MARK: Show Toast on current view controller
    
    /**
     Show toast in a view.
     
     - Parameter message:  It's a string to be used for message.
     - Parameter inView: It's an UIView where toast to be shown.
     
     */
    
    func showToast(message : String, inView: UIView) {
        
        toastLabel.frame = CGRect(x: 0, y: inView.frame.size.height - 50, width: UIScreen.main.bounds.width, height: 50)
        
        toastLabel.backgroundColor = UIColor.black
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont.systemFont(ofSize: 15.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        
        toastLabel.layer.zPosition = 1
        
        toastLabel.clipsToBounds  =  true
        
        inView.addSubview(toastLabel)
        UIView.animate(withDuration: 1.0, delay: 3.0, options: .curveEaseOut, animations: {
            
            self.toastLabel.alpha = 0.0
            
        }, completion: {(isCompleted) in
            
            self.toastLabel.removeFromSuperview()
            
        })
        
    }

    
    
    //MARK: Show time ago
    
    
    func getTimeAgo(timeStamp: String) -> String {
    
        var timeStamp = timeStamp
        timeStamp = timeStamp.replacingOccurrences(of: "-", with: "")
        var time: String = ""

        let postTime:Int = Int(timeStamp)!
        var timeBefore = Int(postTime / 3600)
       
        if(timeBefore <= 0) {
            timeBefore = postTime / 60
            
            if(timeBefore <= 0){
                time = String(format: "%d sec", timeBefore)
            }
            else{
                if(timeBefore == 1){
                    time = String(format: "%d min", timeBefore)
                }
                else{
                   time = String(format: "%d mins", timeBefore)
                }
                
            }
            
        }
        else if(timeBefore<24){
            
            if(timeBefore==1){
               time = String(format: "%d hr", timeBefore)
                
            }
            else{
                time = String(format: "%d hrs", timeBefore)
                
            }
            
        }
        else{
            if(timeBefore % 24 == 0 && timeBefore / 24 == 1){
                time="Yesterday";
            }
            else if(timeBefore>24 && timeBefore<48){
                time="1 day ago";
            }
            else{
               
                if(timeBefore / 24 >= 30){
                    
                    if(timeBefore/24==30)
                    {
                        time="1 month ago";
                    }
                    else{
                        
                        if(((timeBefore / 24) / 30) < 12){
                            
                              time = String(format: "%d month ago", (timeBefore / 24) / 30)

                        }
                        else{
                            
                            if(((timeBefore / 24) / 30) == 12)
                            {
                                time="1 year ago";
                            }
                            else
                            {
                                if(((timeBefore / 24) / 30) / 12 == 1)
                                {
                                    time="1 year ago";
                                }
                                else{
                                    
                                     time = String(format: "%d years ago", (((timeBefore / 24) / 30) / 12))
                                }
                               
                            }
                        }
                    }
                }
                else
                {
                    time = String(format: "%d days ago", timeBefore / 24)
                }
            }
        }

        return time;
    
    }
    

}

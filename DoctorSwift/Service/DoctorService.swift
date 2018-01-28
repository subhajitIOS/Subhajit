//
//  CBService.swift
//  cowboyspot
//
//  Created by AMIR on 9/11/17.
//  Copyright © 2017 Offsureit. All rights reserved.
//

import Foundation

class DoctorService {
    
    static let sharedInstance = DoctorService()
    
    let errorDict = NSMutableDictionary()
    
    /**
     Server request and response method.
     
     
     - Parameter requestType: The HTTP request type string.
     - Parameter requestAPI: The request API string.
     - Parameter parameter: The parameter dictionary .
     
     - Parameter completion: The success handler closure.
     - Parameter failure: The failure handler closure.
     
     - Parameter json: The sucess json dictionary.
     - Parameter error: The error json dictionary.
     
     
     - Returns: Pass server response whether its success or not.
     
     */
    
    func getServerResponse(requestType : String, requestAPI: String, parameter: NSMutableDictionary, completion: @escaping ( _ json: NSMutableDictionary) -> () , failure: @escaping (_ error:   NSMutableDictionary) -> ())
    {
        
        
        let request = DoctorRequestModel.sharedInstance.makeRequest(requestType: RequestType(rawValue: requestType)!, requestAPI: requestAPI, parameter : parameter)
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
           
        
            if let httpResponse = response as? HTTPURLResponse
            {
                print("success \(httpResponse.statusCode)")
                
                if httpResponse.statusCode == SUCCESS_RESPONSE
                {
                    guard error == nil else
                    {
                        DispatchQueue.main.async {
                            
                           self.errorDict[ERROR_MESSAGE] = error?.localizedDescription
                            
                           failure(self.errorDict)
                            
                        }
                        return
                    }
                    
                    guard let data = data else {
                        
                        DispatchQueue.main.async {
                            
                           self.errorDict[ERROR_MESSAGE] = error?.localizedDescription
                            
                            failure(self.errorDict)
                            
                        }
                        return
                    }
                    
                    do {
                        
                        if data.count == 0 // Check only status code
                        {
                            DispatchQueue.main.async {
                                
                                let responseDict = NSMutableDictionary()
                          
                                completion(responseDict)
                                
                            }
                            
                        }
                            
                        else if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? NSMutableDictionary
                        {
                            DispatchQueue.main.async {
   
                                var responseDict: NSMutableDictionary = NSMutableDictionary(dictionary: json)
                                
                                responseDict = responseDict.mutableCopy() as! NSMutableDictionary
                                
                                completion(responseDict)
                            }
                        }
                    } catch let error {
                        
                        DispatchQueue.main.async {

                            self.errorDict[ERROR_MESSAGE] = error.localizedDescription
                            failure(self.errorDict)
                            
                        }
                    }
                    
                }
                    
                    
                else if (httpResponse.statusCode == SERVER_ERROR){
                    
                   self.errorDict[ERROR_CODE] = SERVER_ERROR
                   self.errorDict[ERROR_MESSAGE] = error?.localizedDescription
                    
                    failure(self.errorDict)
                }
                else
                {
                    DispatchQueue.main.async {
                        
                    self.errorDict[ERROR_CODE] = SERVER_ERROR
                    self.errorDict[ERROR_MESSAGE] = error?.localizedDescription
                        failure(self.errorDict)
                        
                    }
                }
                
            }
            else
            {
                
                DispatchQueue.main.async {
                    

                  self.errorDict[ERROR_CODE] = SERVER_ERROR
                  self.errorDict[ERROR_MESSAGE] = error?.localizedDescription
                    failure(self.errorDict)
                    
                }
            }
            
            
            
        })
        
        dataTask.resume()
        
        DoctorSingleton.sharedInstance.tasks.add(dataTask)
        
    }
    
    
}

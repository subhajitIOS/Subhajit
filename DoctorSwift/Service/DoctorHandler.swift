//
//  CBHandler.swift
//  cowboyspot
//
//  Created by AMIR on 9/11/17.
//  Copyright © 2017 Offsureit. All rights reserved.
//

import Foundation



class DoctorHandler {
    
    static let sharedInstance = DoctorHandler()
    
    /**
     Server request and response handler method.
     
     
     - Parameter requestType: The HTTP request type string.
     - Parameter requestAPI: The request API string.
     - Parameter parameter: The parameter dictionary .
     
     - Parameter success: The success handler closure.
     - Parameter failure: The failure handler closure.
     
     - Parameter json: The sucess json dictionary.
     - Parameter error: The error json dictionary.
     
     
     - Returns: Get Server response whether its success or not and send back to the model.
     
     */
    
    
    public func requestServer(requestType : String, requestAPI: String, parameter: NSMutableDictionary, success: @escaping ( _ json: NSMutableDictionary) -> () , failure: @escaping (_ error: NSDictionary) -> () )
    {
        
       // WigWagSingleton.sharedInstance.increaseNetworkActivityIndicatorCount()
        
        DoctorService.sharedInstance.getServerResponse(requestType: requestType, requestAPI: requestAPI, parameter: parameter, completion: { json in
            
          //  WigWagSingleton.sharedInstance.decreaseNetworkActivityIndicatorCount()
            
            success(json)
            
        }, failure: {  error in
            
          //  WigWagSingleton.sharedInstance.decreaseNetworkActivityIndicatorCount()
            
            failure(error )
            
        })
        
        
    }
    
    
    
}

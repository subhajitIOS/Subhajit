//
//  CBRequestModel.swift
//  cowboyspot
//
//  Created by AMIR on 9/11/17.
//  Copyright © 2017 Offsureit. All rights reserved.
//

import Foundation

class DoctorRequestModel {
    
    
    
    static let sharedInstance = DoctorRequestModel()
    
    
    
    //MARK: Make HTTP request
    
    /**
     Make HTTP request method.
     
     
     - Parameter requestType: The HTTP request type string.
     - Parameter requestAPI: The request API string.
     - Parameter parameter: The parameter dictionary .
     
     - Returns: It will return NSMutableURLRequest.
     
     */
    
    
    
    func makeRequest(requestType: RequestType, requestAPI: String, parameter : NSMutableDictionary) -> NSMutableURLRequest
    {
        
        switch requestType {
        case .GET:
            return  getRequest(requestAPI: requestAPI, parameter : parameter )
            
        case .POST:
            return postRequest(requestAPI: requestAPI, parameter : parameter)
            
        case .HEADER_REQUEST:
            return headerRequest(requestAPI: requestAPI, parameter : parameter)
            
        case .DELETE:
            return deleteRequest(requestAPI: requestAPI, parameter : parameter)
            
        case .PATCH:
            return petchRequest(requestAPI: requestAPI, parameter : parameter)
            
        default:
            return NSMutableURLRequest()
            
        }
    }
    
    
    
    //MARK GET Request
    
    /**
     Make HTTP GET request method.
     
     - Parameter requestAPI: The request API string.
     - Parameter parameter: The parameter dictionary .
     
     - Returns: It will return NSMutableURLRequest.
     
     */
    
    func getRequest(requestAPI: String ,parameter : NSMutableDictionary) ->
        NSMutableURLRequest{
            
            var request = NSMutableURLRequest()
            
            let parameter = makeParam(requestAPI: requestAPI,parameter : parameter)
            
            let paramUrl = String(format:"%@%@",BASE_URL,parameter)
            
            if let encoded = paramUrl.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed),
                let url = URL(string: encoded)
            {
                request = NSMutableURLRequest(url: url)
            }
            
            
            request.httpMethod = RequestType.GET.rawValue
           
//            request.addValue("0386a50b-b249-488f-9e12-9df62ecb476f1509803452999", forHTTPHeaderField: "accessToken")
//               request.addValue("application/json", forHTTPHeaderField: "Accept")
//                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
           // request.addValue(AUTHORIZATION_KEY, forHTTPHeaderField: AUTHORIZATION)

            
            return request
    }
    
    
    //MARK: POST Request
    
    /**
     Make HTTP POST request method.
     
     - Parameter requestAPI: The request API string.
     - Parameter parameter: The parameter dictionary .
     
     - Returns: It will return NSMutableURLRequest.
     
     */
    
    func postRequest(requestAPI: String , parameter : NSMutableDictionary) -> NSMutableURLRequest{
        
        
        let request = NSMutableURLRequest(url: NSURL(string: BASE_URL + requestAPI )! as URL)
        request.httpMethod = RequestType.POST.rawValue
        request.httpBody = makeJSONParam(parameter : parameter) as Data
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(AUTHORIZATION_KEY, forHTTPHeaderField: AUTHORIZATION)
      
        return request
        
    }
    
    
    //MARK: Header Request
    
    /**
     Make HTTP GET request method.
     
     - Parameter requestAPI: The request API string.
     - Parameter parameter: The parameter dictionary .
     
     - Returns: It will return NSMutableURLRequest with authorization header.
     
     */
    
    func headerRequest(requestAPI: String , parameter : NSMutableDictionary) -> NSMutableURLRequest {
        
        let request = NSMutableURLRequest(url: NSURL(string: BASE_URL + requestAPI )! as URL)
        request.httpMethod = RequestType.GET.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(parameter.allValues.first as! String, forHTTPHeaderField: parameter.allKeys.first as! String)
        
        return request
        
    }
    
    
    
    //MARK: DELETE Request
    
    /**
     Make HTTP DELETE request method.
     
     - Parameter requestAPI: The request API string.
     - Parameter parameter: The parameter dictionary .
     
     - Returns: It will return NSMutableURLRequest with authorization header.
     
     */
    
    func deleteRequest(requestAPI: String , parameter : NSMutableDictionary) -> NSMutableURLRequest {
        
        
        let request = NSMutableURLRequest(url: NSURL(string: BASE_URL + requestAPI )! as URL)
        request.httpMethod = RequestType.DELETE.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return request
        
    }
    
    
    //MARK: PETCH Request
    
    /**
     Make HTTP PETCH request method.
     
     - Parameter requestAPI: The request API string.
     - Parameter parameter: The parameter dictionary for updation resource.
     
     - Returns: It will return NSMutableURLRequest with authorization header.
     
     */
    
    func petchRequest(requestAPI: String , parameter : NSMutableDictionary) -> NSMutableURLRequest {
        
        
        
        let encoded = requestAPI.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!
        
        
        let request = NSMutableURLRequest(url: NSURL(string: BASE_URL + encoded )! as URL)
        request.httpMethod = RequestType.PATCH.rawValue
        
        request.httpBody = makeJSONParam(parameter: parameter)
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
//        let accessToken = WigWagSingleton.sharedInstance.getValue(key: ACCESS_TOKEN)
//        
//        if accessToken.characters.count > 0
//        {
//            let tokenType = WigWagSingleton.sharedInstance.getValue(key: TOKEN_TYPE)
//            let headerValue = String(format:"%@ %@",tokenType,accessToken)
//            
//            request.addValue(headerValue, forHTTPHeaderField: AUTHORIZATION)
//        }
        
        return request
        
    }
    
    
    
    //MARK: Make JSON Parameter
    
    /**
     Make JSON data.
     
     - Parameter parameter: The parameter dictionary for making valid json data .
     
     - Returns: It will return JSON data.
     
     */
    
    func makeJSONParam(parameter : NSMutableDictionary) -> Data {
        
        let jsonData = try? JSONSerialization.data(withJSONObject: parameter, options: .prettyPrinted)
        
        return jsonData! as Data
        
    }
    
    
    //MARK: Make String Parameter
    
    /**
     Make JSON string.
     
     - Parameter requestAPI: The request API string.
     - Parameter parameter: The parameter dictionary for making json string .
     
     - Returns: It will return JSON string.
     
     */
    
    func makeParam(requestAPI: String , parameter : NSMutableDictionary) -> String {
        
        let param = (parameter.flatMap({ (key, value) -> String in
            return "\(key)=\(value)"
        }) as Array).joined(separator: "&")
        
        return requestAPI + param
        
    }
    
    
    
}

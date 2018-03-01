//
//  CBDataTaskModel.swift
//  cowboyspot
//
//  Created by AMIR on 9/11/17.
//  Copyright © 2017 Offsureit. All rights reserved.
//

import Foundation



@objc protocol DoctorDataTaskModelDelegate: class {
    
    // Facebook auth delegate
    
    @objc optional func didRecieveResponseOfFacebookAuth(json: NSMutableDictionary)
    @objc optional func didRecieveErrorOfFacebookAuth(error: NSMutableDictionary)
    
    // User registration delegate
    
    @objc optional func didRecieveResponseOfUserRegistration(json: NSMutableDictionary)
    @objc optional func didRecieveErrorOfUserRegistration(error: NSMutableDictionary)
    
    @objc optional func didRecieveResponseOfDrugList(json: NSMutableDictionary)
    @objc optional func didRecieveErrorOfDruglist(error: NSMutableDictionary)
    
    
    // User information delegate
    
    @objc optional func didRecieveResponseOfUserInfo(json: NSMutableDictionary)
    @objc optional func didRecieveErrorOfUserInfo(error: NSMutableDictionary)
    
    //Doctor info
    @objc optional func didRecieveResponseOfDoctorInfo(json: NSMutableDictionary)
    @objc optional func didRecieveErrorOfDoctorInfo(error: NSMutableDictionary)
    
    //health reads
    @objc optional func didRecieveResponseOfHealthRecords(json: NSMutableDictionary)
    @objc optional func didRecieveErrorOfHealthRecords(error: NSMutableDictionary)
    
    
    // User settings update delegate
    
    @objc optional func didRecieveResponseOfUserSettings(json: NSMutableDictionary)
    @objc optional func didRecieveErrorOfUserSettings(error: NSMutableDictionary)
    
    // User image update delegate
    
    @objc optional func didRecieveResponseOfUserImageUpdate(json: NSMutableDictionary)
    @objc optional func didRecieveErrorOfUserImageUpdate(error: NSMutableDictionary)
    
    //User profile update
    
    @objc optional func didRecieveResponseOfUserProfileUpdate(json: NSMutableDictionary)
    @objc optional func didRecieveErrorOfUserProfileUpdate(error: NSMutableDictionary)

    
    // User logout delegate
    
    @objc optional func didRecieveResponseOfUserLogout(json: NSMutableDictionary)
    @objc optional func didRecieveErrorOfUserLogout(error: NSMutableDictionary)
    
    
    // Public cowboy users delegate
    
    @objc optional func didRecieveResponseOfCowboyUsers(json: NSMutableDictionary)
    @objc optional func didRecieveErrorOfCowboyUsers(error: NSMutableDictionary)
    
    // Near-by cowboy users delegate
    
    @objc optional func didRecieveResponseOfNearByCowboyUsers(json: NSMutableDictionary)
    @objc optional func didRecieveErrorOfNearByCowboyUsers(error: NSMutableDictionary)


    // Feeds delegate
    
    @objc optional func didRecieveResponseOfFeeds(json: NSMutableDictionary)
    @objc optional func didRecieveErrorOfFeeds(error: NSMutableDictionary)
    
    
    // Feed details delegate
    
    @objc optional func didRecieveResponseOfFeedDetails(json: NSMutableDictionary)
    @objc optional func didRecieveErrorOfFeedDetails(error: NSMutableDictionary)
    
    
    // Feed comments delegate
    
    @objc optional func didRecieveResponseOfFeedComments(json: NSMutableDictionary)
    @objc optional func didRecieveErrorOfFeedComments(error: NSMutableDictionary)
    
    // Feed family member delegate
    
    @objc optional func didRecieveFamilymemberList(json: NSMutableDictionary)
    @objc optional func didRecieveErrorFamilymemberList(error: NSMutableDictionary)
    
    
    // Feed action delegate
    
    @objc optional func didRecieveResponseOfFeedAction(json: NSMutableDictionary)
    @objc optional func didRecieveErrorOfFeedAction(error: NSMutableDictionary)
    

    // Feed like | dislike delegate
    
    @objc optional func didRecieveResponseOfUpdatedFeedLikeStatus(json: NSMutableDictionary)
    @objc optional func didRecieveErrorOfUpdatedFeedLikeStatus(error: NSMutableDictionary)
    
    
    // Upload feed delegate
    
    
    @objc optional func didRecieveResponseOfUploadFeed(json: NSMutableDictionary)
    @objc optional func didRecieveErrorOfUploadFeed(error: NSMutableDictionary)
    
    
    // Comment on Feed
    
    
    @objc optional func didRecieveResponseOfFeedComment(json: NSMutableDictionary)
    @objc optional func didRecieveErrorOfFeedComment(error: NSMutableDictionary)

    
    
    // Near by feed
    
    
    @objc optional func didRecieveResponseOfNearByFeed(json: NSMutableDictionary)
    @objc optional func didRecieveErrorOfNearByFeed(error: NSMutableDictionary)
    
    
    // profile Info
    @objc optional func didRecieveResponseOfProfileInfo(json: NSMutableDictionary)
    @objc optional func didRecieveErrorOfProfileInfo(error: NSMutableDictionary)
    
    
  
    // Like | Dislike User status
    
    @objc optional func didRecieveResponseOfUserStatus(json: NSMutableDictionary)
    @objc optional func didRecieveErrorOfUserStatus(error: NSMutableDictionary)
    
    
    @objc optional func didRecievefetchHealthRecordsDiagnosticList(json: NSMutableDictionary)
    @objc optional func didRecieveErrorfetchHealthRecordsDiagnosticList(error: NSMutableDictionary)
    
    
    // Get user block list
    
    @objc optional func didRecieveResponseOfUserBlocklist(json: NSMutableDictionary)
    @objc optional func didRecieveErrorOfUserBlocklist(error: NSMutableDictionary)
    
    
    // Get user conversation list
    
    @objc optional func didRecieveResponseOfUserConversationlist(json: NSMutableDictionary)
    @objc optional func didRecieveErrorOfUserConversationlist(error: NSMutableDictionary)
    

    
}



class DoctorDataTaskModel {
    
    static let sharedInstance = DoctorDataTaskModel()

    
    weak var delegate: DoctorDataTaskModelDelegate?
    

    
    //MARK: Get profile from facebook
    
    /**
     Get profile from facebook.
     
     
     - Parameter parameter: The parameter dictionary .
     
     
     - Returns: Pass Server response whether its success or not to its delegate defination class.
     
     */
    
    
    //doctor profile
    func getDoctorProfile(parameter: NSMutableDictionary) {
        
        var requestApi: String?
       
       requestApi = RequestAPI.DOCTORPROFILE.rawValue
        DoctorHandler.sharedInstance.requestServer(requestType: RequestType.GET.rawValue , requestAPI: requestApi! , parameter: parameter, success: { json  in
           
            if(self.delegate?.didRecieveResponseOfDoctorInfo != nil){
                print(json);
                self.delegate?.didRecieveResponseOfDoctorInfo!(json: json)
            }
            
            
        }, failure: {  error in
            
            if(self.delegate?.didRecieveErrorOfDoctorInfo != nil){
                
                self.delegate?.didRecieveErrorOfDoctorInfo!(error: error as! NSMutableDictionary)
                
            }
            
            
        })
        
        requestApi = nil
        
        
    }
    
    //MARK: Get user profile
    
    func getdrugList(parameter: NSMutableDictionary) {
        
        var requestApi: String?
       
            
            requestApi = RequestAPI.SEARCHDrugs.rawValue
            
        
        
        DoctorHandler.sharedInstance.requestServer(requestType: RequestType.GET.rawValue , requestAPI: requestApi! , parameter: parameter, success: { json  in
           
            if(self.delegate?.didRecieveResponseOfDrugList != nil){
               
                self.delegate?.didRecieveResponseOfDrugList!(json: json)
            }
            
            
        }, failure: {  error in
            
            if(self.delegate?.didRecieveErrorOfDruglist != nil){
                
                self.delegate?.didRecieveErrorOfDruglist!(error: error as! NSMutableDictionary)
                
            }
            
            
        })
        
        requestApi = nil
        
        
    }
    
    //MARK: Get user profile
    
    func getUserProfile(parameter: NSMutableDictionary, myProfile: Bool) {
        
        var requestApi: String?
        if(myProfile){
            
            requestApi = RequestAPI.USER_INFO.rawValue
        }
        else{
            
             requestApi = RequestAPI.SEARCHPATIENT.rawValue
            
        }
        
        DoctorHandler.sharedInstance.requestServer(requestType: RequestType.GET.rawValue , requestAPI: requestApi! , parameter: parameter, success: { json  in
            
            if(self.delegate?.didRecieveResponseOfUserInfo != nil){
                print(json);
                self.delegate?.didRecieveResponseOfUserInfo!(json: json)
            }
            
            
        }, failure: {  error in
            
            if(self.delegate?.didRecieveErrorOfUserInfo != nil){
                
                self.delegate?.didRecieveErrorOfUserInfo!(error: error as! NSMutableDictionary)
                
            }
            
            
        })
        
        requestApi = nil
        
        
    }
   
    func ProfileInfo(parameter: NSMutableDictionary) {
        DoctorHandler.sharedInstance.requestServer(requestType: RequestType.POST.rawValue , requestAPI: RequestAPI.DBXUserProfileAPI.rawValue , parameter: parameter, success: { json  in
            
            if(self.delegate?.didRecieveResponseOfProfileInfo != nil){
                
                self.delegate?.didRecieveResponseOfProfileInfo!(json: json)
            }
            
            
        }, failure: {  error in
            
            if(self.delegate?.didRecieveErrorOfProfileInfo != nil){
                
                self.delegate?.didRecieveErrorOfProfileInfo!(error: error as! NSMutableDictionary)
                
            }
            
        })
    }
    //MARK: Get user profile
    func HealthRecordsList(parameter: NSMutableDictionary, myProfile: Bool) {
        DoctorHandler.sharedInstance.requestServer(requestType: RequestType.POST.rawValue , requestAPI: RequestAPI.DBXHeathRecordsAPI.rawValue , parameter: parameter, success: { json  in
            
            if(self.delegate?.didRecieveResponseOfHealthRecords != nil){
                
                self.delegate?.didRecieveResponseOfHealthRecords!(json: json)
            }
            
            
        }, failure: {  error in
            
            if(self.delegate?.didRecieveErrorOfHealthRecords != nil){
                
                self.delegate?.didRecieveErrorOfHealthRecords!(error: error as! NSMutableDictionary)
                
            }
            
        })
//        var requestApi: String?
//        if(myProfile){
//
//            requestApi = RequestAPI.USER_INFO.rawValue
//        }
//        else{
//
//            requestApi = RequestAPI.SEARCHPATIENT.rawValue
//
//        }
//
//        DoctorHandler.sharedInstance.requestServer(requestType: RequestType.GET.rawValue , requestAPI: requestApi! , parameter: parameter, success: { json  in
//
//            if(self.delegate?.didRecieveResponseOfHealthRecords != nil){
//                print(json);
//                self.delegate?.didRecieveResponseOfHealthRecords!(json: json)
//            }
//
//
//        }, failure: {  error in
//
//            if(self.delegate?.didRecieveErrorOfHealthRecords != nil){
//
//                self.delegate?.didRecieveErrorOfHealthRecords!(error: error as! NSMutableDictionary)
//
//            }
//
//
//        })
//
//        requestApi = nil
//
        
    }
    
    //MARK: Get user profile
    
    func userLogout(parameter: NSMutableDictionary) {
        
        DoctorHandler.sharedInstance.requestServer(requestType: RequestType.POST.rawValue , requestAPI: RequestAPI.SEARCHPATIENT.rawValue , parameter: parameter, success: { json  in
            
            if(self.delegate?.didRecieveResponseOfUserLogout != nil){
                
                self.delegate?.didRecieveResponseOfUserLogout!(json: json)
            }
            
            
        }, failure: {  error in
            
            if(self.delegate?.didRecieveErrorOfUserLogout != nil){
                
                self.delegate?.didRecieveErrorOfUserLogout!(error: error as! NSMutableDictionary)
                
            }
        
        })

    }
    
    
    
    //MARK: Update user settings
    
    
    func updateUserSettings(parameter: NSMutableDictionary) {
        
        DoctorHandler.sharedInstance.requestServer(requestType: RequestType.POST.rawValue , requestAPI: RequestAPI.USER_SETTINGS_UPDATE.rawValue , parameter: parameter, success: { json  in
            
            if(self.delegate?.didRecieveResponseOfUserSettings != nil){
                
                self.delegate?.didRecieveResponseOfUserSettings!(json: json)
            }
            
            
        }, failure: {  error in
            
            if(self.delegate?.didRecieveErrorOfUserSettings != nil){
                
                self.delegate?.didRecieveErrorOfUserSettings!(error: error as! NSMutableDictionary)
                
            }
            
            
        })
        
    }
    
    //MARK: Update user images
    
    func updateUserImages(parameter: NSMutableDictionary) {
        
        DoctorHandler.sharedInstance.requestServer(requestType: RequestType.POST.rawValue , requestAPI: RequestAPI.USER_IMAGE_UPDATE.rawValue , parameter: parameter, success: { json  in
            
            if(self.delegate?.didRecieveResponseOfUserImageUpdate != nil){
                
                self.delegate?.didRecieveResponseOfUserImageUpdate!(json: json)
            }
            
            
        }, failure: {  error in
            
            if(self.delegate?.didRecieveErrorOfUserImageUpdate != nil){
                
                self.delegate?.didRecieveErrorOfUserImageUpdate!(error: error as! NSMutableDictionary)
                
            }
            
            
        })
        
    }
    
    
    //MARK: Update user profile
    
    
    func updateUserProfile(parameter: NSMutableDictionary) {
        
        DoctorHandler.sharedInstance.requestServer(requestType: RequestType.POST.rawValue , requestAPI: RequestAPI.USER_PROFILE_UPDATE.rawValue , parameter: parameter, success: { json  in

            if(self.delegate?.didRecieveResponseOfUserProfileUpdate != nil){

                self.delegate?.didRecieveResponseOfUserProfileUpdate!(json: json)
            }


        }, failure: {  error in
            
            if(self.delegate?.didRecieveErrorOfUserProfileUpdate != nil){

                self.delegate?.didRecieveErrorOfUserProfileUpdate!(error: error as! NSMutableDictionary)

            }


        })
        
    }
    
    
    //MARK: Get user conversation list
    
    func getUserConversationList(parameter: NSMutableDictionary) {
        
        DoctorHandler.sharedInstance.requestServer(requestType: RequestType.GET.rawValue , requestAPI: RequestAPI.CONVERSATION_LIST.rawValue , parameter: parameter, success: { json  in
            
            if(self.delegate?.didRecieveResponseOfUserConversationlist != nil){
                
                self.delegate?.didRecieveResponseOfUserConversationlist!(json: json)
            }
            
            
        }, failure: {  error in
            
            if(self.delegate?.didRecieveErrorOfUserConversationlist != nil){
                
                self.delegate?.didRecieveErrorOfUserConversationlist!(error: error as! NSMutableDictionary)
                
            }
            
            
        })
        
    }

    //MARK: Get all public cowboy users
    
    func getAllPublicCowboyUsers(parameter: NSMutableDictionary) {
        
        DoctorHandler.sharedInstance.requestServer(requestType: RequestType.GET.rawValue , requestAPI: RequestAPI.COWBOY_PUBLIC_USER.rawValue , parameter: parameter, success: { json  in
            
            if(self.delegate?.didRecieveResponseOfCowboyUsers != nil){
                
                self.delegate?.didRecieveResponseOfCowboyUsers!(json: json)
            }
            
            
        }, failure: {  error in
            
            if(self.delegate?.didRecieveErrorOfCowboyUsers != nil){
                
                self.delegate?.didRecieveErrorOfCowboyUsers!(error: error as! NSMutableDictionary)
                
            }
            
            
        })
        
    }
    
    
    //MARK: Get all public cowboy users
    
    func getAllNearByCowboyUsers(parameter: NSMutableDictionary) {
        
        DoctorHandler.sharedInstance.requestServer(requestType: RequestType.GET.rawValue , requestAPI: RequestAPI.COWBOY_NEAR_BY_USER.rawValue , parameter: parameter, success: { json  in
            
            if(self.delegate?.didRecieveResponseOfNearByCowboyUsers != nil){
                
                self.delegate?.didRecieveResponseOfNearByCowboyUsers!(json: json)
            }
            
            
        }, failure: {  error in
            
            if(self.delegate?.didRecieveErrorOfNearByCowboyUsers != nil){
                
                self.delegate?.didRecieveErrorOfNearByCowboyUsers!(error: error as! NSMutableDictionary)
                
            }
            
            
        })
        
    }
    
    //MARK: Update cowboy user status
    
    func updateUserStatus(parameter: NSMutableDictionary) {
        
        DoctorHandler.sharedInstance.requestServer(requestType: RequestType.POST.rawValue , requestAPI: RequestAPI.USER_ACTION.rawValue , parameter: parameter, success: { json  in
            
            if(self.delegate?.didRecieveResponseOfUserStatus != nil){
                
                self.delegate?.didRecieveResponseOfUserStatus!(json: json)
            }
            
            
        }, failure: {  error in
            
            if(self.delegate?.didRecieveErrorOfUserSettings != nil){
                
                self.delegate?.didRecieveErrorOfUserSettings!(error: error as! NSMutableDictionary)
                
            }
            
            
        })
        
    }
    
    
    //MARK: Get user block list
    
    func getUserBlocklist(parameter: NSMutableDictionary) {
        
        DoctorHandler.sharedInstance.requestServer(requestType: RequestType.GET.rawValue , requestAPI: RequestAPI.USER_BLOCK_LIST.rawValue , parameter: parameter, success: { json  in
            
            if(self.delegate?.didRecieveResponseOfUserBlocklist != nil){
                
                self.delegate?.didRecieveResponseOfUserBlocklist!(json: json)
            }
            
            
        }, failure: {  error in
            
            if(self.delegate?.didRecieveErrorOfUserBlocklist != nil){
                
                self.delegate?.didRecieveErrorOfUserBlocklist!(error: error as! NSMutableDictionary)
                
            }
            
            
        })
        
    }

    //MARK: Get feeds
    
    func getFeeds(parameter: NSMutableDictionary) {
        
        DoctorHandler.sharedInstance.requestServer(requestType: RequestType.GET.rawValue , requestAPI: RequestAPI.GET_POSTS.rawValue , parameter: parameter, success: { json  in
            
            if(self.delegate?.didRecieveResponseOfFeeds != nil){
                
                self.delegate?.didRecieveResponseOfFeeds!(json: json)
            }
            
            
        }, failure: {  error in
            
            if(self.delegate?.didRecieveErrorOfFeeds != nil){
                
                self.delegate?.didRecieveErrorOfFeeds!(error: error as! NSMutableDictionary)
                
            }
            
            
        })
        
        
    }
    
    //MARK: Get feed details
    
    func getFeedDetails(parameter: NSMutableDictionary) {
        
        DoctorHandler.sharedInstance.requestServer(requestType: RequestType.GET.rawValue , requestAPI: RequestAPI.GET_PARTICULAR_POST.rawValue , parameter: parameter, success: { json  in
            
            if(self.delegate?.didRecieveResponseOfFeedDetails != nil){
                
                self.delegate?.didRecieveResponseOfFeedDetails!(json: json)
            }
            
            
        }, failure: {  error in
            
            if(self.delegate?.didRecieveErrorOfFeedDetails != nil){
                
                self.delegate?.didRecieveErrorOfFeedDetails!(error: error as! NSMutableDictionary)
                
            }
            
            
        })
        
    }
    
    //MARK: Get feed comments

    func getFeedComments(parameter: NSMutableDictionary) {
        
        DoctorHandler.sharedInstance.requestServer(requestType: RequestType.GET.rawValue , requestAPI: RequestAPI.GET_PARTICULAR_POST_COMMENT.rawValue , parameter: parameter, success: { json  in
            
            if(self.delegate?.didRecieveResponseOfFeedComments != nil){
                
                self.delegate?.didRecieveResponseOfFeedComments!(json: json)
            }
            
            
        }, failure: {  error in
            
            if(self.delegate?.didRecieveErrorOfFeedComments != nil){
                
                self.delegate?.didRecieveErrorOfFeedComments!(error: error as! NSMutableDictionary)
                
            }
            
            
        })
        
    }
    func familymemberInfoList(parameter: NSMutableDictionary) {
        
        DoctorHandler.sharedInstance.requestServer(requestType: RequestType.GET.rawValue , requestAPI: RequestAPI.DBXDoctorsInfoAPI.rawValue , parameter: parameter, success: { json  in
            
            if(self.delegate?.didRecieveFamilymemberList != nil){
                
                self.delegate?.didRecieveFamilymemberList!(json: json)
            }
            
           
        }, failure: {  error in
            
            if(self.delegate?.didRecieveErrorFamilymemberList != nil){
                
                self.delegate?.didRecieveErrorFamilymemberList!(error: error as! NSMutableDictionary)
                
            }
            
            
        })
        
    }
   
    
    
    func fetchHealthRecordsDiagnosticList(parameter: NSMutableDictionary) {
        
        DoctorHandler.sharedInstance.requestServer(requestType: RequestType.GET.rawValue , requestAPI: RequestAPI.DBXDoctorsInfoAPI.rawValue , parameter: parameter, success: { json  in
            
            if(self.delegate?.didRecievefetchHealthRecordsDiagnosticList != nil){
                
                self.delegate?.didRecievefetchHealthRecordsDiagnosticList!(json: json)
            }
            
            
        }, failure: {  error in
            
            if(self.delegate?.didRecieveErrorfetchHealthRecordsDiagnosticList != nil){
                
                self.delegate?.didRecieveErrorfetchHealthRecordsDiagnosticList!(error: error as! NSMutableDictionary)
                
            }
            
            
        })
        
    }
    
 
    
    //MARK: Feed action
    func postAction(parameter: NSMutableDictionary) {
        
        DoctorHandler.sharedInstance.requestServer(requestType: RequestType.POST.rawValue , requestAPI: RequestAPI.POST_ACTION.rawValue , parameter: parameter, success: { json  in
            
            if(self.delegate?.didRecieveResponseOfFeedAction != nil){
                
                self.delegate?.didRecieveResponseOfFeedAction!(json: json)
            }
            
            
        }, failure: {  error in
            
            if(self.delegate?.didRecieveErrorOfFeedAction != nil){
                
                self.delegate?.didRecieveErrorOfFeedAction!(error: error as! NSMutableDictionary)
                
            }
            
            
        })
        
    }

   
    //MARK: Like Feed
    
    func updatePostLikeStatus(parameter: NSMutableDictionary) {
        
        DoctorHandler.sharedInstance.requestServer(requestType: RequestType.POST.rawValue , requestAPI: RequestAPI.POST_LIKE_DISLIKE.rawValue , parameter: parameter, success: { json  in
            
            if(self.delegate?.didRecieveResponseOfUpdatedFeedLikeStatus != nil){
                
                self.delegate?.didRecieveResponseOfUpdatedFeedLikeStatus!(json: json)
            }
            
            
        }, failure: {  error in
            
            if(self.delegate?.didRecieveErrorOfUpdatedFeedLikeStatus != nil){
                
                self.delegate?.didRecieveErrorOfUpdatedFeedLikeStatus!(error: error as! NSMutableDictionary)
                
            }
            
            
        })
        
    }
    
    
    //MARK: Upload post to Feed
    
    func uploadPostToFeed(parameter: NSMutableDictionary) {
        
    DoctorHandler.sharedInstance.requestServer(requestType: RequestType.POST.rawValue , requestAPI: RequestAPI.ADD_POST.rawValue , parameter: parameter, success: { json  in
            
            if(self.delegate?.didRecieveResponseOfUploadFeed != nil){
                
                self.delegate?.didRecieveResponseOfUploadFeed!(json: json)
            }

        }, failure: {  error in
            
            if(self.delegate?.didRecieveErrorOfUploadFeed != nil){
                
                self.delegate?.didRecieveErrorOfUploadFeed!(error: error as! NSMutableDictionary)
                
            }
            
            
        })
        
    }
    
    
    //MARK: Comment on Feed
    
    func commentOnPost(parameter: NSMutableDictionary) {
        
        DoctorHandler.sharedInstance.requestServer(requestType: RequestType.POST.rawValue , requestAPI: RequestAPI.COMMENT_ON_POST.rawValue , parameter: parameter, success: { json  in
            
            if(self.delegate?.didRecieveResponseOfFeedComment != nil){
                
                self.delegate?.didRecieveResponseOfFeedComment!(json: json)
            }
            
            
        }, failure: {  error in
            
            if(self.delegate?.didRecieveErrorOfFeedComment != nil){
                
                self.delegate?.didRecieveErrorOfFeedComment!(error: error as! NSMutableDictionary)
                
            }
            
            
        })
        
    }
    
    
    
    //MARK: Get near-by feed
    
    
    func getNearByFeed(parameter: NSMutableDictionary) {
        
        DoctorHandler.sharedInstance.requestServer(requestType: RequestType.GET.rawValue , requestAPI: RequestAPI.NEAR_BY_FEED.rawValue , parameter: parameter, success: { json  in
            
            if(self.delegate?.didRecieveResponseOfNearByFeed != nil){
                
                self.delegate?.didRecieveResponseOfNearByFeed!(json: json)
            }
            
            
        }, failure: {  error in
            
            if(self.delegate?.didRecieveErrorOfNearByFeed != nil){
                
                self.delegate?.didRecieveErrorOfNearByFeed!(error: error as! NSMutableDictionary)
                
            }
            
            
        })
        
    }


    // Update user location

    
    func updateUserLocation(latitude: Float , longitude: Float)  {
        
//        let param = NSMutableDictionary()
//        
//        param[USER_ID] = user.userId
//
//        param[USER_LAT] = latitude
//        param[USER_LONG] = longitude
//        param[DEVICE_ID] = CBSingleton.sharedInstance.getDeviceID()
//   
//        
//        CBService.sharedInstance.getServerResponse(requestType: RequestType.POST.rawValue, requestAPI: RequestAPI.LOCATION_UPDATE.rawValue, parameter: param, completion: { json in
//            
//            
//        }, failure: {  error in
//        
//
//        })

        
        
    }
    
    
    

  
    
}

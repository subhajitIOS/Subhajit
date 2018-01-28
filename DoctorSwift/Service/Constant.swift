//
//  Constant.swift
//  cowboyspot
//
//  Created by AMIR on 9/11/17.
//  Copyright © 2017 Offsureit. All rights reserved.
//

import Foundation

//Test http://192.168.88.248:4000/

//Live http://54.153.2.22:4000/

//let BASE_URL = "http://192.168.88.248:4000/"

let BASE_URL = "https://secure.dawaibox.com/"
let AUTHORIZATION =  "Authorization-Key"
let AUTHORIZATION_KEY = "599688042099K2099R876R343I23S344H898A876N007a"

let GOOGLE_MAP_API_KEY = "AIzaSyCV3ZIk7W6zoS21dMP4yIcPqaEVAosO8vE"

// Appdelegate class instance

let appDelegate : AppDelegate = AppDelegate().sharedInstance()

// Data task model class
let dataTaskModel = DoctorDataTaskModel.sharedInstance

// AWS credential constant

let AWS_BASE_URL = "https://s3.amazonaws.com/"

let AWS_POOL_ID = "us-east-1:2e8c075c-04e7-441a-bee5-bc2a2e4b0969"

let AWS_PROFILE_BUCKET_NAME = "cowboyuserprofiles"

let AWS_PROFILE_BUCKET_URL = "http://d38ohdwwj2e34v.cloudfront.net/"

let AWS_POST_BUCKET_NAME = "cowboyuserpost"

let AWS_POST_BUCKET_URL = "http://d14koeqn0qswn9.cloudfront.net/"



// User model instance






// User constant


let PROFILE = "profile"
let SETTING = "setting"
let USER_INFO = "userInfo"
let WHO_ID = "whoId"


let USER_INFORMATION = "userInformation"

let DISTANCE = "distance"

let USER_ID = "userId"
let ROLE = "role"
let USER_LAYERID = "userLayerId"



let ID = "id"
let EMAIL = "email"
let GENDER = "gender"
let PICTURE = "picture"
let IMAGE_URL = "url"
let IMAGE_NAME = "imageName"
let FACEBOOK_ID = "facebookId"
let USER_NAME = "userName"
let USER_EMAIL = "userEmail"
let USER_GENDER = "userGender"
let USER_AGE = "userAge"
let USER_ABOUT = "userAbout"
let USER_LAT = "userLat"
let USER_LONG = "userLong"
let DEVICE_ID = "deviceId"
let DEVICE_TYPE = "deviceType"
let DEVICE_TOKEN = "deviceToken"
let HOME_TOWN = "homeTown"
let USER_WORK_LOCATION = "userWorkLocation"
let USER_INTEREST = "userInterest"
let SEARCH_RADIUS = "searchRadius"
let MIN_RANGE = "minRange"
let MAX_RANGE = "maxRange"
let PUSH_NOTIFICATION = "pushNotification"

let LIKE_STATUS = "likeStatus"
let USER_STATUS_DISLIKE = "dislike"
let USER_STATUS_LIKE = "like"
let USER_STATUS_BLOCK = "block"
let USER_STATUS_UNBLOCK = "unblock"

let OTHER_USER_ID = "_id"

// Settings constant

let PUSH_NOTIFICATION_ENABLE = "yes"
let PUSH_NOTIFICATION_DISABLE = "no"

let USER_INTEREST_BOTH = "both"
let USER_INTEREST_MALE = "male"
let USER_INTEREST_FEMALE = "female"


let IOS = "iOS"

let LATITUDE = "latitude"
let LONGITUDE = "longitude"



// Block user constant

let BLOCK_INFO = "blockInfo"


// Conversation list constant

let CONVERSATION_LIST = "converstionsList"


// Post type constant

let POST_TYPE = "postType"
let POST_ID = "postId"

let POSITION = "position"

let PARTICULAR_POST_INFO = "particularpostinfo"

let TIME_AGO = "agotime"

let COMMENT_ID = "commentId"
let COMMENT_id = "_id"

let COMMENT = "comment"

let COMMENTS = "comments"

let PUBLIC = "public"
let ME = "me"

let NEXT_TOKEN = "nextToken"


let POST_INFO = "postinfo"

let POST_TITLE = "title"

let POST_LINK = "link"

let IMAGES = "images"

let POST_COMMENT_STATUS_NO = "no"

let POST_COMMENT_STATUS_YES = "yes"


let POST_LIKE_STATUS_YES = "like"

let POST_LIKE_STATUS_NO = "dislike"

let POST_LIKE_STATUS_NONE = "none"

let ACTION = "action"

let REMOVE = "remove"

let UPDATE = "update"


let INDEX = "index"



// Chat constant

let NEW_CONNECTION = "New Match!"



// Cowboy users constant

let USERS = "users"

let USER_IMAGES = "userImages"

let AGE = "age"


// Badge constant

let SHOW_BADGE = "SHOW_BADGE"


// Server response constant

let FLAG = "flag";
let MESSAGE = "message";
let STATUS = "status";
let SUCCESS = "success";


let SESSION_EXPIRED = "sesionExpired"

// Error messages constant
let ERROR_CODE = "error_code"
let ERROR_MESSAGE = "error_message"


// Server response code

let SUCCESS_RESPONSE = 200
let ERROR = 400
let SERVER_ERROR = 500


//MARK: response flag enum

enum ResponseFlag: String{
    
    case NEW = "new"
    case LOGIN_ANOTHER = "loginAnother"
    case ALREADY = "already"
    
    case LOCATION_ENABLE = "locationEnable"
    
    case POST_UPLOAD_SUCCESS = "postUploadSuccessed"
    
    case SESSION_EXPIRE = "sessionExpire"
    
    case DEFAULT = ""
    
}


//MARK: HTTP Request enum

enum RequestType : String{
    case GET = "GET"
    case POST = "POST"
    case HEADER_REQUEST = "HEADER_REQUEST"
    case DELETE = "DELETE"
    case PUT = "PUT"
    case PATCH = "PATCH"
}





//MARK: HTTP Request API enum

enum RequestAPI : String
{
    case USER_REGISTRATION = "userRegistration?"
    case USER_INFO = "userInfo?"
    case USER_SETTINGS_UPDATE = "settingUpdate?"
    case USER_IMAGE_UPDATE = "updateImages?"
    case USER_PROFILE_UPDATE = "profileUpdate?"
    case COWBOY_PUBLIC_USER = "publicUsers?"
    case COWBOY_NEAR_BY_USER = "nearbyusers?"
    case GET_OTHER_USER_INFO = "viewprofile?"
    case GET_OTHER_he = "getHealthReads?"
    
   
    case USER_ACTION = "usersaction?"
    case CONVERSATION_LIST = "conversationlist?"
    case USER_BLOCK_LIST = "blockList?"
    case LOGOUT = "fetchReminders?"
    case SEARCHPATIENT = "DawaiBox/doctor/searchPatients?"
    case DOCTORPROFILE = "DawaiBox/getDoctorProfile?"
    case DBXHeathRecordsAPI = "DawaiBox/doctor/getHealthRecords"
    case DBXUserProfileAPI = "DawaiBox/getUserProfile"
    
   case DBXSearchPatientsAPIforName = "DawaiBoxSmartPrescription/searchPatientByName?"
    case GET_POSTS = "getposts?"
    case GET_PARTICULAR_POST = "getparticularpost?"
    case GET_PARTICULAR_POST_COMMENT = "getparticularpostComment?"
    case DBXFamilyMemberInfoAPI      = "DawaiBox/getUserInfo"
     case DBXDoctorsInfoAPI      = "DawaiBox/doctor/getDocumentDropDown?"
    
    
    case POST_LIKE_DISLIKE = "postlikeDislike?"
    case ADD_POST = "addpost?"
    case COMMENT_ON_POST = "commentonpost?"
    case POST_ACTION = "postaction?"

    case NEAR_BY_FEED = "getnearbyPosts?"
    
    case LOCATION_UPDATE = "locationUpdate?"
}

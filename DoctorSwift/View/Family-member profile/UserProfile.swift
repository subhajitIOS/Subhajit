/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class UserProfile {
	public var userId : Int?
	public var familyMemberId : Int?
	public var age : Int?
	public var height : String?
	public var weight : String?
	public var firstName : String?
	public var lastName : String?
	public var sex : String?
	public var relation : String?
	public var bloodGroup : String?
	public var allergies : String?
	public var surgeries : String?
	public var illness : String?
	public var isRegUser : Int?
	public var imageUrl : String?
	public var thumbImageUrl : String?
	public var mobileNumber : Int?
	public var additionalInfo : String?
	public var emergencyContactNumber : Int?
	public var emergencyContactName : String?
	public var dob : Int?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let userProfile_list = UserProfile.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of UserProfile Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [UserProfile]
    {
        var models:[UserProfile] = []
        for item in array
        {
            models.append(UserProfile(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let userProfile = UserProfile(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: UserProfile Instance.
*/
	required public init?(dictionary: NSDictionary) {

		userId = dictionary["userId"] as? Int
		familyMemberId = dictionary["familyMemberId"] as? Int
		age = dictionary["age"] as? Int
        
        
     
      
        
       let  heightSet : String?
        heightSet = dictionary["height"] as? String
        height =  (true == heightSet?.isEmpty) ? "" :heightSet!
        + "(Feet)"
        let x : Int = (dictionary["weight"] as? Int)!
        let myString = String(x)
		weight = myString
		firstName = dictionary["firstName"] as? String
		lastName = dictionary["lastName"] as? String
		sex = dictionary["sex"] as? String
		relation = dictionary["relation"] as? String
		bloodGroup = dictionary["bloodGroup"] as? String
		allergies = dictionary["allergies"] as? String
		surgeries = dictionary["surgeries"] as? String
		illness = dictionary["illness"] as? String
		isRegUser = dictionary["isRegUser"] as? Int
		imageUrl = dictionary["imageUrl"] as? String
		thumbImageUrl = dictionary["thumbImageUrl"] as? String
		mobileNumber = dictionary["mobileNumber"] as? Int
		additionalInfo = dictionary["additionalInfo"] as? String
		emergencyContactNumber = dictionary["emergencyContactNumber"] as? Int
		emergencyContactName = dictionary["emergencyContactName"] as? String
		dob = dictionary["dob"] as? Int
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.userId, forKey: "userId")
		dictionary.setValue(self.familyMemberId, forKey: "familyMemberId")
		dictionary.setValue(self.age, forKey: "age")
		dictionary.setValue(self.height, forKey: "height")
		dictionary.setValue(self.weight, forKey: "weight")
		dictionary.setValue(self.firstName, forKey: "firstName")
		dictionary.setValue(self.lastName, forKey: "lastName")
		dictionary.setValue(self.sex, forKey: "sex")
		dictionary.setValue(self.relation, forKey: "relation")
		dictionary.setValue(self.bloodGroup, forKey: "bloodGroup")
		dictionary.setValue(self.allergies, forKey: "allergies")
		dictionary.setValue(self.surgeries, forKey: "surgeries")
		dictionary.setValue(self.illness, forKey: "illness")
		dictionary.setValue(self.isRegUser, forKey: "isRegUser")
		dictionary.setValue(self.imageUrl, forKey: "imageUrl")
		dictionary.setValue(self.thumbImageUrl, forKey: "thumbImageUrl")
		dictionary.setValue(self.mobileNumber, forKey: "mobileNumber")
		dictionary.setValue(self.additionalInfo, forKey: "additionalInfo")
		dictionary.setValue(self.emergencyContactNumber, forKey: "emergencyContactNumber")
		dictionary.setValue(self.emergencyContactName, forKey: "emergencyContactName")
		dictionary.setValue(self.dob, forKey: "dob")

		return dictionary
	}

}

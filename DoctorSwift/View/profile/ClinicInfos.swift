/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class ClinicInfos {
	public var clinicId : Int?
	public var doctorId : Int?
	public var name : String?
	public var isActive : String?
	public var addressId : Int?
	public var description : String?
	public var createdDate : String?
	public var modifiedDate : String?
	public var mobileNumber : String?
	public var createdByUserId : String?
	public var modifiedByUserId : String?
	public var landLine : String?
    
	public var zipCode : Int?
	public var cityId : Int?
	public var cityName : String?
	public var addressDetail : String?
	public var clinicImages : Array<ClinicImages>?
	public var stateName : String?
	public var locality : String?
	public var landmark : String?
	public var longitude : Double?
	public var latitude : Double?
	public var clinicImageUrls : String?
	public var clinicDayTimingsList : Array<ClinicDayTimingsList>?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let clinicInfos_list = ClinicInfos.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of ClinicInfos Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [ClinicInfos]
    {
        var models:[ClinicInfos] = []
        for item in array
        {
            models.append(ClinicInfos(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let clinicInfos = ClinicInfos(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: ClinicInfos Instance.
*/
	required public init?(dictionary: NSDictionary) {

		clinicId = dictionary["clinicId"] as? Int
		doctorId = dictionary["doctorId"] as? Int
		name = dictionary["name"] as? String
		isActive = dictionary["isActive"] as? String
		addressId = dictionary["addressId"] as? Int
		description = dictionary["description"] as? String
		createdDate = dictionary["createdDate"] as? String
		modifiedDate = dictionary["modifiedDate"] as? String
		mobileNumber = dictionary["mobileNumber"] as? String
		createdByUserId = dictionary["createdByUserId"] as? String
		modifiedByUserId = dictionary["modifiedByUserId"] as? String
		landLine = dictionary["landLine"] as? String
		zipCode = dictionary["zipCode"] as? Int
        
        print(zipCode!)
		cityId = dictionary["cityId"] as? Int
		cityName = dictionary["cityName"] as? String
		addressDetail = dictionary["addressDetail"] as? String
        if (dictionary["clinicImages"] != nil) { clinicImages = ClinicImages.modelsFromDictionaryArray(array: dictionary["clinicImages"] as! NSArray) }
		stateName = dictionary["stateName"] as? String
		locality = dictionary["locality"] as? String
		landmark = dictionary["landmark"] as? String
		longitude = dictionary["longitude"] as? Double
		latitude = dictionary["latitude"] as? Double
		clinicImageUrls = dictionary["clinicImageUrls"] as? String
        if (dictionary["clinicDayTimingsList"] != nil) { clinicDayTimingsList = ClinicDayTimingsList.modelsFromDictionaryArray(array: dictionary["clinicDayTimingsList"] as! NSArray) }
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.clinicId, forKey: "clinicId")
		dictionary.setValue(self.doctorId, forKey: "doctorId")
		dictionary.setValue(self.name, forKey: "name")
		dictionary.setValue(self.isActive, forKey: "isActive")
		dictionary.setValue(self.addressId, forKey: "addressId")
		dictionary.setValue(self.description, forKey: "description")
		dictionary.setValue(self.createdDate, forKey: "createdDate")
		dictionary.setValue(self.modifiedDate, forKey: "modifiedDate")
		dictionary.setValue(self.mobileNumber, forKey: "mobileNumber")
		dictionary.setValue(self.createdByUserId, forKey: "createdByUserId")
		dictionary.setValue(self.modifiedByUserId, forKey: "modifiedByUserId")
		dictionary.setValue(self.landLine, forKey: "landLine")
		dictionary.setValue(self.zipCode, forKey: "zipCode")
		dictionary.setValue(self.cityId, forKey: "cityId")
		dictionary.setValue(self.cityName, forKey: "cityName")
		dictionary.setValue(self.addressDetail, forKey: "addressDetail")
		dictionary.setValue(self.stateName, forKey: "stateName")
		dictionary.setValue(self.locality, forKey: "locality")
		dictionary.setValue(self.landmark, forKey: "landmark")
		dictionary.setValue(self.longitude, forKey: "longitude")
		dictionary.setValue(self.latitude, forKey: "latitude")
		dictionary.setValue(self.clinicImageUrls, forKey: "clinicImageUrls")

		return dictionary
	}

}

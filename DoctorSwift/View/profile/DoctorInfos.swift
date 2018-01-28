/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class DoctorInfos {
	public var doctorId : Int?
	public var firstName : String?
	public var lastName : String?
	public var email : String?
	public var mobileNumber : String?
	public var primaryContactNumber : String?
	public var practicingSince : String?
	public var doctorSpecialization : String?
	public var password : String?
	public var createdDate : Int?
	public var modifiedDate : Int?
	public var gender : String?
	public var dob : String?
	public var experience : String?
	public var doctorImageUrl : String?
	public var qualification : String?
	public var medicalRegisterNo : String?
	public var clinicInfos : Array<ClinicInfos>?
	public var clinicIds : String?
	public var doctorDegree : String?
	public var doctorCertificates : Array<DoctorCertificates>?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let doctorInfos_list = DoctorInfos.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of DoctorInfos Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [DoctorInfos]
    {
        var models:[DoctorInfos] = []
        for item in array
        {
            models.append(DoctorInfos(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let doctorInfos = DoctorInfos(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: DoctorInfos Instance.
*/
	required public init?(dictionary: NSDictionary) {

		doctorId = dictionary["doctorId"] as? Int
		firstName = dictionary["firstName"] as? String
		lastName = dictionary["lastName"] as? String
		email = dictionary["email"] as? String
		mobileNumber = dictionary["mobileNumber"] as? String
		primaryContactNumber = dictionary["primaryContactNumber"] as? String
		practicingSince = dictionary["practicingSince"] as? String
		doctorSpecialization = dictionary["doctorSpecialization"] as? String
		password = dictionary["password"] as? String
		createdDate = dictionary["createdDate"] as? Int
		modifiedDate = dictionary["modifiedDate"] as? Int
		gender = dictionary["gender"] as? String
		dob = dictionary["dob"] as? String
		experience = dictionary["experience"] as? String
		doctorImageUrl = dictionary["doctorImageUrl"] as? String
		qualification = dictionary["qualification"] as? String
        
        
		medicalRegisterNo = dictionary["medicalRegisterNo"] as? String
        
        print(medicalRegisterNo!)
        print(qualification!)
        
        
        if (dictionary["clinicInfos"] != nil) { clinicInfos = ClinicInfos.modelsFromDictionaryArray(array: dictionary["clinicInfos"] as! NSArray) }
		clinicIds = dictionary["clinicIds"] as? String
		doctorDegree = dictionary["doctorDegree"] as? String
        if (dictionary["doctorCertificates"] != nil) { doctorCertificates = DoctorCertificates.modelsFromDictionaryArray(array: dictionary["doctorCertificates"] as! NSArray) }
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.doctorId, forKey: "doctorId")
		dictionary.setValue(self.firstName, forKey: "firstName")
		dictionary.setValue(self.lastName, forKey: "lastName")
		dictionary.setValue(self.email, forKey: "email")
		dictionary.setValue(self.mobileNumber, forKey: "mobileNumber")
		dictionary.setValue(self.primaryContactNumber, forKey: "primaryContactNumber")
		dictionary.setValue(self.practicingSince, forKey: "practicingSince")
		dictionary.setValue(self.doctorSpecialization, forKey: "doctorSpecialization")
		dictionary.setValue(self.password, forKey: "password")
		dictionary.setValue(self.createdDate, forKey: "createdDate")
		dictionary.setValue(self.modifiedDate, forKey: "modifiedDate")
		dictionary.setValue(self.gender, forKey: "gender")
		dictionary.setValue(self.dob, forKey: "dob")
		dictionary.setValue(self.experience, forKey: "experience")
		dictionary.setValue(self.doctorImageUrl, forKey: "doctorImageUrl")
		dictionary.setValue(self.qualification, forKey: "qualification")
		dictionary.setValue(self.medicalRegisterNo, forKey: "medicalRegisterNo")
		dictionary.setValue(self.clinicIds, forKey: "clinicIds")
		dictionary.setValue(self.doctorDegree, forKey: "doctorDegree")

		return dictionary
	}

}

/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class SearchResult {
	public var name : String?
	public var image : String?
	public var gender : String?
	public var age : Int?
	public var familyMemberId : Int?
	public var userId : Int?
	public var isRegUser : Int?
	public var isCustomizedUser : Int?
	public var isMyDoctor : Int?
	public var mobileNumber : Int?
	public var vaccChartCreated : Int?
	public var vaccinationChartId : Int?
	public var height : String?
	public var weight : Int?
	public var relation : String?
	public var bloodGroup : String?
	public var lastInteractionDate : Int?
	public var allergies : Int?
	public var surgeries : Int?
	public var allergies_temp : String?
	public var surgeries_temp : String?
	public var dateOfBirth : Int?
	public var ageInMonth : Int?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let searchResult_list = SearchResult.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of SearchResult Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [SearchResult]
    {
        var models:[SearchResult] = []
        for item in array
        {
            models.append(SearchResult(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let searchResult = SearchResult(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: SearchResult Instance.
*/
	required public init?(dictionary: NSDictionary) {

		name = dictionary["name"] as? String
		image = dictionary["image"] as? String
		gender = dictionary["gender"] as? String
		age = dictionary["age"] as? Int
		familyMemberId = dictionary["familyMemberId"] as? Int
		userId = dictionary["userId"] as? Int
		isRegUser = dictionary["isRegUser"] as? Int
		isCustomizedUser = dictionary["isCustomizedUser"] as? Int
		isMyDoctor = dictionary["isMyDoctor"] as? Int
		mobileNumber = dictionary["mobileNumber"] as? Int
		vaccChartCreated = dictionary["vaccChartCreated"] as? Int
		vaccinationChartId = dictionary["vaccinationChartId"] as? Int
		height = dictionary["height"] as? String
		weight = dictionary["weight"] as? Int
		relation = dictionary["relation"] as? String
		bloodGroup = dictionary["bloodGroup"] as? String
		lastInteractionDate = dictionary["lastInteractionDate"] as? Int
		allergies = dictionary["allergies"] as? Int
		surgeries = dictionary["surgeries"] as? Int
		allergies_temp = dictionary["allergies_temp"] as? String
		surgeries_temp = dictionary["surgeries_temp"] as? String
		dateOfBirth = dictionary["dateOfBirth"] as? Int
		ageInMonth = dictionary["ageInMonth"] as? Int
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.name, forKey: "name")
		dictionary.setValue(self.image, forKey: "image")
		dictionary.setValue(self.gender, forKey: "gender")
		dictionary.setValue(self.age, forKey: "age")
		dictionary.setValue(self.familyMemberId, forKey: "familyMemberId")
		dictionary.setValue(self.userId, forKey: "userId")
		dictionary.setValue(self.isRegUser, forKey: "isRegUser")
		dictionary.setValue(self.isCustomizedUser, forKey: "isCustomizedUser")
		dictionary.setValue(self.isMyDoctor, forKey: "isMyDoctor")
		dictionary.setValue(self.mobileNumber, forKey: "mobileNumber")
		dictionary.setValue(self.vaccChartCreated, forKey: "vaccChartCreated")
		dictionary.setValue(self.vaccinationChartId, forKey: "vaccinationChartId")
		dictionary.setValue(self.height, forKey: "height")
		dictionary.setValue(self.weight, forKey: "weight")
		dictionary.setValue(self.relation, forKey: "relation")
		dictionary.setValue(self.bloodGroup, forKey: "bloodGroup")
		dictionary.setValue(self.lastInteractionDate, forKey: "lastInteractionDate")
		dictionary.setValue(self.allergies, forKey: "allergies")
		dictionary.setValue(self.surgeries, forKey: "surgeries")
		dictionary.setValue(self.allergies_temp, forKey: "allergies_temp")
		dictionary.setValue(self.surgeries_temp, forKey: "surgeries_temp")
		dictionary.setValue(self.dateOfBirth, forKey: "dateOfBirth")
		dictionary.setValue(self.ageInMonth, forKey: "ageInMonth")

		return dictionary
	}

}
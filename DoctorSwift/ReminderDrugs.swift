/* 
Copyright (c) 2017 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class ReminderDrugs {
	public var drugId : Int?
	public var drugName : String?
	public var drugType : String?
	public var pharmaCompName : String?
	public var compound : String?
	public var drugInteraction : String?
	public var drugIndications : String?
	public var drugContraIndications : String?
	public var tabs : Int?
	public var startFromDate : Int?
	public var duration : Int?
	public var frequency : String?
	public var bmeal : Bool?
	public var recur : String?
	public var comments : String?
	public var mode : String?
	public var schedule : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let reminderDrugs_list = ReminderDrugs.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of ReminderDrugs Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [ReminderDrugs]
    {
        var models:[ReminderDrugs] = []
        for item in array
        {
            models.append(ReminderDrugs(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let reminderDrugs = ReminderDrugs(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: ReminderDrugs Instance.
*/
	required public init?(dictionary: NSDictionary) {

		drugId = dictionary["drugId"] as? Int
		drugName = dictionary["drugName"] as? String
		drugType = dictionary["drugType"] as? String
		pharmaCompName = dictionary["pharmaCompName"] as? String
		compound = dictionary["compound"] as? String
		drugInteraction = dictionary["drugInteraction"] as? String
		drugIndications = dictionary["drugIndications"] as? String
		drugContraIndications = dictionary["drugContraIndications"] as? String
		tabs = dictionary["tabs"] as? Int
		startFromDate = dictionary["startFromDate"] as? Int
		duration = dictionary["duration"] as? Int
		frequency = dictionary["frequency"] as? String
		bmeal = dictionary["bmeal"] as? Bool
		recur = dictionary["recur"] as? String
		comments = dictionary["comments"] as? String
		mode = dictionary["mode"] as? String
		schedule = dictionary["schedule"] as? String
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.drugId, forKey: "drugId")
		dictionary.setValue(self.drugName, forKey: "drugName")
		dictionary.setValue(self.drugType, forKey: "drugType")
		dictionary.setValue(self.pharmaCompName, forKey: "pharmaCompName")
		dictionary.setValue(self.compound, forKey: "compound")
		dictionary.setValue(self.drugInteraction, forKey: "drugInteraction")
		dictionary.setValue(self.drugIndications, forKey: "drugIndications")
		dictionary.setValue(self.drugContraIndications, forKey: "drugContraIndications")
		dictionary.setValue(self.tabs, forKey: "tabs")
		dictionary.setValue(self.startFromDate, forKey: "startFromDate")
		dictionary.setValue(self.duration, forKey: "duration")
		dictionary.setValue(self.frequency, forKey: "frequency")
		dictionary.setValue(self.bmeal, forKey: "bmeal")
		dictionary.setValue(self.recur, forKey: "recur")
		dictionary.setValue(self.comments, forKey: "comments")
		dictionary.setValue(self.mode, forKey: "mode")
		dictionary.setValue(self.schedule, forKey: "schedule")

		return dictionary
	}

}
/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class DocumentResponse {
	public var documentId : Int?
	public var doctorName : String?
	public var linkId : String?
	public var documentCreatedDate : String?
	public var link : String?
	public var interactionCount : String?
	public var originalPrescriber : String?
	public var patientName : String?
	public var nextVisitedDate : String?
	public var diagnosticId : Int?
	public var reportType : String?
	public var doctorId : Int?
	public var diagName : String?
	public var diseases : String?
	public var isSmartPrescription : Int?
	public var docType : String?
	public var prescriptionCount : String?
	public var diseaseList : Array<DiseaseList>?
	public var prefix : String?
	public var linkedDoctor : Int?
	public var createdDate : Int?
	public var documentPdfUrl : String?
	public var comments : String?
	public var typeId : Int?
	public var uploadedBy : Int?
	public var doctorSpeciality : String?
	public var investigationReport : String?
	public var isOriginalUser : Int?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let documentResponse_list = DocumentResponse.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of DocumentResponse Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [DocumentResponse]
    {
        var models:[DocumentResponse] = []
        for item in array
        {
            models.append(DocumentResponse(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let documentResponse = DocumentResponse(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: DocumentResponse Instance.
*/
	required public init?(dictionary: NSDictionary) {

		documentId = dictionary["documentId"] as? Int
		doctorName = dictionary["doctorName"] as? String
		linkId = dictionary["linkId"] as? String
		documentCreatedDate = dictionary["documentCreatedDate"] as? String
		link = dictionary["link"] as? String
		interactionCount = dictionary["interactionCount"] as? String
		originalPrescriber = dictionary["originalPrescriber"] as? String
		patientName = dictionary["patientName"] as? String
		nextVisitedDate = dictionary["nextVisitedDate"] as? String
		diagnosticId = dictionary["diagnosticId"] as? Int
		reportType = dictionary["reportType"] as? String
		doctorId = dictionary["doctorId"] as? Int
		diagName = dictionary["diagName"] as? String
		diseases = dictionary["diseases"] as? String
		isSmartPrescription = dictionary["isSmartPrescription"] as? Int
		docType = dictionary["docType"] as? String
		prescriptionCount = dictionary["prescriptionCount"] as? String
        if (dictionary["diseaseList"] != nil) { diseaseList = DiseaseList.modelsFromDictionaryArray(array: dictionary["diseaseList"] as! NSArray) }
		prefix = dictionary["prefix"] as? String
		linkedDoctor = dictionary["linkedDoctor"] as? Int
		createdDate = dictionary["createdDate"] as? Int
		documentPdfUrl = dictionary["documentPdfUrl"] as? String
		comments = dictionary["comments"] as? String
		typeId = dictionary["typeId"] as? Int
		uploadedBy = dictionary["uploadedBy"] as? Int
		doctorSpeciality = dictionary["doctorSpeciality"] as? String
		investigationReport = dictionary["investigationReport"] as? String
		isOriginalUser = dictionary["isOriginalUser"] as? Int
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.documentId, forKey: "documentId")
		dictionary.setValue(self.doctorName, forKey: "doctorName")
		dictionary.setValue(self.linkId, forKey: "linkId")
		dictionary.setValue(self.documentCreatedDate, forKey: "documentCreatedDate")
		dictionary.setValue(self.link, forKey: "link")
		dictionary.setValue(self.interactionCount, forKey: "interactionCount")
		dictionary.setValue(self.originalPrescriber, forKey: "originalPrescriber")
		dictionary.setValue(self.patientName, forKey: "patientName")
		dictionary.setValue(self.nextVisitedDate, forKey: "nextVisitedDate")
		dictionary.setValue(self.diagnosticId, forKey: "diagnosticId")
		dictionary.setValue(self.reportType, forKey: "reportType")
		dictionary.setValue(self.doctorId, forKey: "doctorId")
		dictionary.setValue(self.diagName, forKey: "diagName")
		dictionary.setValue(self.diseases, forKey: "diseases")
		dictionary.setValue(self.isSmartPrescription, forKey: "isSmartPrescription")
		dictionary.setValue(self.docType, forKey: "docType")
		dictionary.setValue(self.prescriptionCount, forKey: "prescriptionCount")
		dictionary.setValue(self.prefix, forKey: "prefix")
		dictionary.setValue(self.linkedDoctor, forKey: "linkedDoctor")
		dictionary.setValue(self.createdDate, forKey: "createdDate")
		dictionary.setValue(self.documentPdfUrl, forKey: "documentPdfUrl")
		dictionary.setValue(self.comments, forKey: "comments")
		dictionary.setValue(self.typeId, forKey: "typeId")
		dictionary.setValue(self.uploadedBy, forKey: "uploadedBy")
		dictionary.setValue(self.doctorSpeciality, forKey: "doctorSpeciality")
		dictionary.setValue(self.investigationReport, forKey: "investigationReport")
		dictionary.setValue(self.isOriginalUser, forKey: "isOriginalUser")

		return dictionary
	}

}

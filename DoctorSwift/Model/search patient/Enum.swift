//
//  Enum.swift
//  DoctorSwift
//
//  Created by Apple on 17/01/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import Foundation
enum DBXPatientHeaderType:Int {
    case DBXPatientHeaderTypeInteractions
    case DBXPatientHeaderTypeReports
    case DBXPatientHeaderTypePrescription
}
enum DBXHealthRecordsTypeId:Int {
    case DBXTypeIdReports = 4
    case DBXTypeIdPrescription = 5
    case DBXTypeIdInteractions = 6
}
enum DBXListFetchState:Int {
    case DBXListTypeFetchNone = 0
    case DBXListTypeFetchLatest = 1
    case DBXListTypeFetchOlder = 2
}
enum DBXUserProfileCellType:Int{
case DBXNameCellIndex = 0
case DBXGenderCellIndex = 1
case DBXHeightCellIndex = 2
case DBXRelationCellIndex = 3
case DBXTaggedAllergiesCellIndex = 4
case DBXAllergiesCellIndex = 5
case DBXTaggedSurgeriesCellIndex = 6
case DBXSurgeriesCellIndex = 7
case DBXContactNumberCellIndex = 8
case DBXContactNameCellIndex = 9
case DBXAdditionalInfoCellIndex = 10
}

enum DBXEditProfileCellType:Int {
   case DBXEditProfileCellTypeDoctorName = 0
   case DBXEditProfileCellTypeSpeciality = 1
   case DBXEditProfileCellTypeCaptureDegree = 2
   case DBXEditProfileCellTypeEmailID = 3
   case DBXEditProfileCellTypeMobileNumber = 4
   case DBXEditProfileCellTypePrimaryContactNumber = 5
   case DBXEditProfileCellTypeDoubleDropDown = 6
   case DBXEditProfileCellTypeQualifiation  = 7
   case DBXEditProfileCellTypeMedicalRegistrationNo = 8
}
enum DBXClinicCellType:Int {
  case  DBXClinicCellTypeClinicName = 0
  case  DBXClinicCellTypeClinicPrimaryNumber = 1
  case  DBXClinicCellTypeAddClinicPhoneNumber = 2
  case  DBXClinicCellTypeAddTimings = 3
  case  DBXClinicCellTypeClinicPhotos = 4
  case  DBXClinicCellTypeCity = 5
  case  DBXClinicCellTypeLocality = 6
  case  DBXClinicCellTypeLandmark = 7
  case  DBXClinicCellTypeAddress = 8
  case  DBXClinicCellTypeZip = 9
};




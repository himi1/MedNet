//
//  All classes.swift
//  MedNet
//
//  Created by Himanshi Bhardwaj on 3/29/17.
//  Copyright © 2017 HPP. All rights reserved.
//

import Foundation

//Enumerations
enum Status: String {
    case Canceled = "Canceled"
    case Pending = "Pending"
    case Completed = "Completed"
    case Denied = "Denied"
}

enum RequestType: String {
    case Manual = "Manual"
    case System = "System"
}

enum CUIDType: String {
    case StateId = "StateId"
    case Passport = "Passport"
    case DrivingLicence = "DrivingLicence"
}

enum UserType: String {
    case Civilian = "Civilian"
    case Doctor = "Doctor"
    case Hospital = "Hospital"
    case VolunteerOrganization = "VolunteerOrganization"
}

enum BloodType: String {
    case AP = "A+"
    case AN = "A-"
    case ABP = "AB+"
    case ABN = "AB-"
    case OP = "O+"
    case ON = "O-"
    case BP = "B+"
    case BN = "B-"
}

//All classes
class MedicalRequest {
    var requestId: Int64?
    var reason: String?
    var requestType: RequestType?
    var status: Status?
    
    init (requestId: Int64, reason: String, requestType: String, status: String) {
        self.requestId = requestId
        self.reason = reason
        //self.requestType = requestType
        //self.status = status
        self.requestType = RequestType(rawValue: requestType)
        self.status = Status(rawValue: status)
    }
}

/*class MedNetUser {
	var id: Int64?
	var name: String?
	var emailId: String?
	var phone: String?
	var sentRequests: Array<MedicalRequest> = Array()
	var receivedRequests: Array<MedicalRequest> = Array()
 }*/

/*class RegisteredMedNetUser: MedNetUser {
	var userName: String?
	var profile: Profile?
	var hospitalAppointments: Array<HospitalAppointment> = Array()
	var services: Array<MedicalService> = Array()
 }*/

class UnRegisteredMedNetUser: MedNetUser {
    
}

class Government: UnRegisteredMedNetUser {
    
}

class HealthAccrediationAuthority: UnRegisteredMedNetUser {
    var authorizedBy: Government?
}

class Other: UnRegisteredMedNetUser {
    var connectedTo: Array<Registered> = Array()
}

class Profile {
    var approval: Status?
    var bloodType: BloodType?
    var dateOfBirth: Date?
    
    var interestsSet = Set<String>()
    var treatmentSet = Set<String>()
    var certificatesSet = Set<String>()
    var allergiesSet = Set<String>()
    
    
    init(approval: String, bloodType: String, dateOfBirth: Date) {
        self.approval = Status(rawValue: approval)
        self.bloodType = BloodType(rawValue: bloodType)
        self.dateOfBirth = dateOfBirth
        
    }
}
/*
 
 class Civilian : Registered {
 var cUID: String?
	var CUIDType: CUIDType?
 }
 */

class Hospital : Registered {
    var hospitalServices: [String?] = []
}

class Doctor : Registered {
    var specializations: [String?] = []
    var degrees: [String?] = []
    var hospitals: [Hospital?] = []
}

class VolunteerOrganization: Registered {
    
}

class MedicalService {
    var authorizedBy: String?
    var authId: String?
    var validTo: Date?
    init(authorizedBy: String, authId: String, validTo: Date) {
        self.authorizedBy = authorizedBy
        self.authId = authId
        self.validTo = validTo
    }
}

class Donation: MedicalService {
    override init(authorizedBy: String, authId: String, validTo: Date) {
        super.init(authorizedBy: authorizedBy, authId: authId, validTo: validTo)
    }

    
}

class SpecialService : MedicalService {
    var name: String?
    init(authorizedBy: String, authId: String, validTo: Date, name: String) {
        super.init(authorizedBy: authorizedBy, authId: authId, validTo: validTo)
        self.name = name
    }
}

class FundDonation: Donation {
    var fundLimit: Int64?
    init(authorizedBy: String, authId: String, validTo: Date, fundLimit: Int64) {
        super.init(authorizedBy: authorizedBy, authId: authId, validTo: validTo)
        self.fundLimit = fundLimit
    }
}

class OrganDonation : Donation {
    var name: String?
    init(authorizedBy: String, authId: String, validTo: Date, name: String) {
        super.init(authorizedBy: authorizedBy, authId: authId, validTo: validTo)
        self.name = name
    }
}

class HospitalAppointment {
    var hospitalName: String?
    var date: Date?
    var reason: String?
    var start: Date?
    var end: Date?
    
    init(hospitalName: String, date: Date, reason: String, start: Date, end: Date) {
        self.hospitalName = hospitalName
        self.date = date
        self.reason = reason
        self.start = start
        self.end = end
    }
}

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
    
    init (requestId: Int64, reason: String, requestType: RequestType, status: Status) {
        self.requestId = requestId
        self.reason = reason
        self.requestType = requestType
        self.status = status
    }
}

class MedNetUser {
	var id: Int64?
	var name: String?
	var emailId: String?
	var phone: String?
	var sentRequests: Array<MedicalRequest> = Array()
	var receivedRequests: Array<MedicalRequest> = Array()
}

class RegisteredMedNetUser: MedNetUser {
	var userName: String?
	var profile: Profile?
	var hospitalAppointments: Array<HospitalAppointment> = Array()
	var services: Array<MedicalService> = Array()
}

class UnRegisteredMedNetUser: MedNetUser {
	
}

class Government: UnRegisteredMedNetUser {
 
}

class HealthAccrediationAuthority: UnRegisteredMedNetUser {
    var authorizedBy: Government?
}

class Other: UnRegisteredMedNetUser {
    var connectedTo: Array<RegisteredMedNetUser> = Array()
}

class Profile {
    var approval: Status?
    var bloodType: BloodType?
    var dateOfBirth: Date?
    var interests: [String?] = []
    var treatments: [String?] = []
    var certificates: [String?] = []
    var allergies: [String?] = []
}

class Civilian : RegisteredMedNetUser {
    var cUID: String?
	var CUIDType: CUIDType?
}

class Hospital : RegisteredMedNetUser {
    var hospitalServices: [String?] = []
}

class Doctor : RegisteredMedNetUser {
    var specializations: [String?] = []
    var degrees: [String?] = []
    var hospitals: [Hospital?] = []
}

class VolunteerOrganization: RegisteredMedNetUser {

}

class MedicalService {
	var authorizedBy: HealthAccrediationAuthority?
    var authId: String?
    var validTo: Date?
}

class Donation: MedicalService {

}

class SpecialService : MedicalService {
    var name: String?
}

class FundDonation: Donation {
    var fundLimit: Int64?
}

class OrganDonation : Donation {
    var name: String?
}

class HospitalAppointment {
    var hospital: Hospital?
    var date: Date?
    var reason: String?
}

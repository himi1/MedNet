//
//  All classes.swift
//  MedNet
//
//  Created by Himanshi Bhardwaj on 3/29/17.
//  Copyright © 2017 HPP. All rights reserved.
//

//All classes

import Foundation

//to be fixed, why would government have a name?
class Government {
    var userId: Int64?
    var firstName: String?
    var middleName: String?
    var lastName: String?
    var phoneNo: Int?
    var email: Array<String> = Array()
    
    init (userId: Int64) {
        self.userId = userId
    }
}

class HealthAccrediationAuthority {
    var userId: Int64?
    var firstName: String?
    var middleName: String?
    var lastName: String?
    var phone: Int64?
    var email: Array<String> = Array()
    var authorizedBy: Government?
    
    init (userId: Int64) {
        self.userId = userId
    }
}

//RegisteredMedNetUser
class RegisteredMedNetUser {
    var userId: String?
    var userName: String?
    var phoneNo: Int64?
    var userType: UserType?
    var placedMedicalRequests : [MedicalRequest]
    var incomingMedicalRequests: [MedicalRequest]
    var hospitalAppointments: [HospitalAppointment]
    var fundDonations: [FundDonation]
    var organDonations: [OrganDonation]
    var approval: Status?
    
    init (userId: String?) {
        self.userId = userId
    }
}

enum UserType: String {
    case Civilian = "Civilian"
    case Doctor = "Doctor"
    case Hospital = "Hospital"
    case VolunteerOrganization = "VolunteerOrganization"
}

//Used JOINED strategy
//Types of RegisteredMedNetUser:
// Civilian
class Civilian {
    var userId: String?
    var firstName: String?
    var lastName: String?
    var bloodType: BloodType?
    var dateOfBirth: Date?
    var interests: [String?] = []
    var treatments: [String?] = []
    var certificates: [String?] = []
    var allergies: [String?] = []
}
//Hospital
class Hospital {
    var userId: String?
    var name: String?
    var location: String?
    var treatments: [String?] = []
    var hospitalServices: [String?] = []
    var specialServices: [SpecialServices?] = []
}
//Doctor
class Doctor {
    var userId: String?
    var firstName: String?
    var lastName: String?
    var bloodType: BloodType?
    var dateOfBirth: Date?
    var interests: [String?] = []
    var treatments: [String?] = []
    var certificates: [String?] = []
    var specializations: [String?] = []
    var degrees: [String?] = []
    var hospitals: [Hospital?] = []
    var specialServices: [SpecialServices?] = []
}
//VolunteerOrganization
//to add something more in this
class VolunteerOrganization {
    var userId: String?
}

//enumerations
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
enum RequestType: String {
    case Manual = "Manual"
    case System = "System"
}
enum Status: String {
    case Canceled = "Canceled"
    case Pending = "Pending"
    case Completed = "Completed"
    case Denied = "Denied"
}

//ServiceTypes
class SpecialServices {
    var name: String?
    var authorizedBy: HealthAccrediationAuthority
    var authId: String?
    var validTo: Date?
    
    init(authId: String){
        self.authId = authId
    }
}

//Request types:
class FundDonation {
    var fundLimit: Int64?
    var authorizedBy: HealthAccrediationAuthority?
    var authId: String?
    var validTo: Date?
    
    init(authId: String){
        self.authId = authId
    }
}

class HospitalAppointment {
    var hospital: Hospital?
    var date: Date?
    var reason: String?
    
    init (hospital: Hospital, date: Date, reason: String) {
        self.hospital = hospital
        self.date = date
        self.reason = reason
    }
}
class MedicalRequest {
    var requestId: Int64?
    var reason: String?
    var requestType: RequestType?
    var status: Status?
    
    init (requestId: Int64, reason: String, rType: RequestType, status: Status) {
        self.requestId = requestId
        self.reason = reason
        self.requestType = rType
        self.status = status
    }
}

class OrganDonation {
    var name: String?
    var authorizedBy: HealthAccrediationAuthority?
    var authId: String?
    var validTo: Date?
}



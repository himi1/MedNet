//
//  UserProfile.swift
//  MedNet
//
//  Created by Himanshi Bhardwaj on 3/26/17.
//  Copyright © 2017 HPP. All rights reserved.
//

import Foundation

class UserProfile {
    static let sharedInstance = UserProfile()

    var phoneNo: Phone?
    var firstName: String? = "Himi"
    var lastName: String?
    
    var dateOfBirth: Date?
    var bloodType: String?
    var allergies: [String?]
    var treatments: [String?]
    var certificates: [String?]
    var medicalRequests: [MedicalRequest]
    
    
    init() {
        firstName = ""
        lastName = ""
        phoneNo = nil
        dateOfBirth = nil
        bloodType = nil
        allergies = []
        treatments = []
        certificates = []
        medicalRequests = []
    }
    
    func addANewUser(firstName: String?, lastName: String?, phoneNo: Phone,
                     dateOfBirth: Date?, bloodType: String?, allergies: [String?],
                     treatments: [String?], certificates: [String?], medicalRequests: [MedicalRequest]) {
        self.firstName = firstName
        self.lastName = lastName
        self.phoneNo = phoneNo
        self.dateOfBirth = dateOfBirth
        self.bloodType = bloodType
        self.allergies = allergies
        self.treatments = treatments
        self.certificates = certificates
        self.medicalRequests = medicalRequests
    }
    
    init(firstName: String?, lastName: String?, phoneNo: Phone,
         dateOfBirth: Date?, bloodType: String?, allergies: [String?],
         treatments: [String?], certificates: [String?], medicalRequests: [MedicalRequest]) {
        self.firstName = firstName
        self.lastName = lastName
        self.phoneNo = phoneNo
        self.dateOfBirth = dateOfBirth
        self.bloodType = bloodType
        self.allergies = allergies
        self.treatments = treatments
        self.certificates = certificates
        self.medicalRequests = medicalRequests
    }
    
    //getters
    func getDateOfBirth() -> Date {
        return dateOfBirth!
    }
    
    func getBloodType() -> String {
        return bloodType!
    }
    
    func getAllergies() -> [String] {
        return allergies as! [String]
    }
    
    func getTreatments() -> [String] {
        return treatments as! [String]
    }
    
    func getCertificates() -> [String] {
        return certificates as! [String]
    }
    
    func getMedicalRequests() -> [MedicalRequest] {
        return medicalRequests
    }
    

    //setters
    func setDateOfBirth(dateOfBirth: Date) {
        self.dateOfBirth = dateOfBirth
    }
    
    func setBloodType(bloodType: String) {
        self.bloodType = bloodType
    }
    
    func setAllergies(allergies: [String]) {
        self.allergies = allergies
    }
    
    func setTreatments(treatments: [String]) {
        self.treatments = treatments
    }
    
    func setCertificates(certificates: [String]) {
        self.certificates = certificates
    }
    
    func addMedicalRequest(status: Int, requestType: String, reason: String) {
        self.medicalRequests.append((status, requestType, reason))
        
    }
}

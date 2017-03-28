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
    
    var dateOfBirth: Date?
    var bloodType: String?
    var allergies: [String?]
    var treatments: [String?]
    var certificates: [String?]
    var medicalRequests: [(status: Int, requestType: String, reason: String)]
    
    
    fileprivate init() {
        dateOfBirth = nil
        bloodType = nil
        allergies = []
        treatments = []
        certificates = []
        medicalRequests = []
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
    
    func getMedicalRequests() -> [(status: Int, requestType: String, reason: String)] {
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

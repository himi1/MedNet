//
//  VolunteerOrganization.swift
//  MedNet
//
//  Created by Himanshi Bhardwaj on 4/1/17.
//  Copyright © 2017 HPP. All rights reserved.
//

import Foundation

class VolunteerOrganization : Registered {
    static let sharedInstance = VolunteerOrganization()
    
    func getVolunteerOrganizationFromDb(userName: String) {
        //fetch from Resistered table
        getRegisteredFromDb(userName: userName)
        
        print("Done fetching volunteer organization")
    }
}


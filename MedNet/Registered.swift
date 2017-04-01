//
//  Registered.swift
//  SQLite
//
//  Created by Himanshi Bhardwaj on 3/31/17.
//
//

import Foundation
import SQLite

class Registered: MedNetUser {
    var userName: String?
    var profile: Profile?
    var hospitalAppointments: Array<HospitalAppointment> = Array()
    var fundDonation: [FundDonation] = []
    var organDonation: [OrganDonation] = []
    //var services: Array<MedicalService> = Array()
    //static let sharedInstance = Registered()
    
    static func getUserTypeFromDb(userName: String) throws -> String {
        guard let DB = SQLiteDataStore.sharedInstance.DB else {
            throw DataAccessError.datastore_Connection_Error
        }
        
        do
        {
            
            let query = "select r.userType from Registered r where r.userName = ?"
            let stmt = try DB.prepare(query)
            for row in try stmt.run(userName)
            {
                if (row[0] != nil) {
                return (Registered.getUserType(userTypeInt: row[0] as! Int64))
                }
                
            }
        }
        catch {
            print("Error", DataAccessError.search_Error)
        }
        
        //no userName found
        return ""
    }
    
    static func getUserType(userTypeInt: Int64) -> String {
        switch(Int(userTypeInt)) {
        case 1: return "Civilian"
        case 2: return "Doctor"
        case 3: return "VolunteerOrganization"
        case 4: return "Hospital"
        default: return "Civilian"
        }
    }


    
    
    
    
    
    func getRegisteredFromDb(userName: String) {
        do {
            
            self.userName = userName
            try self.fetchRegisteredUser()
        }
        catch {
            print("Failed to fetch registeredUserfromDb")
        }
    }
    
    func fetchRegisteredUser() throws {
        guard let DB = self.dbInstance.DB else {
            throw DataAccessError.datastore_Connection_Error
        }
        
        do
        {
            let query = "select r.id from Registered r where r.userName = ?"
            let stmt = try DB.prepare(query)
            for row in try stmt.run(self.userName)
            {
                if (row[0] != nil) {
                self.getMedNetUserFromDb(id: (row[0] as? Int64)!)
            }
                else {
                }
        }
            
        }
        catch
        {
            throw DataAccessError.search_Error
        }
        
        //successful data extraction
    }
    
    
    
    
    
    
    
    
    
}//end of class Registered


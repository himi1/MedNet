//
//  Doctor.swift
//  SQLite
//
//  Created by Himanshi Bhardwaj on 4/1/17.
//
//

import Foundation

class Doctor : Registered {
    var specializations = Set<String>()
    var degrees = Set<String>()
    var hospitals = Set<String>()
    
    static let sharedInstance = Doctor()
    
    func getDoctorFromDb(userName: String) {
        //fetch from Resistered table
        getRegisteredFromDb(userName: userName)
        
        do {
            self.userName = userName
            //fetch from Civilian table
            try self.fetchProfileHospitalAppointmentAndDonations(userType: "Doctor")
            try self.fetchDoctor()
        }
        catch {
            print("Failed to fetch registeredUserfromDb")
        }
    }
    
    func fetchDoctor() throws {
        guard let DB = self.dbInstance.DB else {
            throw DataAccessError.datastore_Connection_Error
        }
        
        do
        {
            let query = "select hpt.name, s.name, dg.name from Doctor d left outer join Hospital_Doctors hd on hd.has = d.id left outer join MedNetUser hpt on hpt.id = hd.worksIn left outer join Specialization s on s.of = d.id left outer join Degree dg on dg.of = d.id where d.id = ?"
            let stmt = try DB.prepare(query)
            for row in try stmt.run(self.id)
            {
                if(row[0] != nil) {
                    //allergies Construction
                    self.hospitals.insert(row[0] as! String)
                }
                if(row[1] != nil) {
                    //interestsSet Construction
                    self.specializations.insert(row[1] as! String)
                }
                if(row[2] != nil) {
                    //treatment Construction
                    self.degrees.insert(row[2] as! String)
                }
            }
            
            print("Successfully fetched Doctor data")
        }
        catch
        {
            throw DataAccessError.search_Error
        }
        //successful data extraction
    }
    
    
    
}




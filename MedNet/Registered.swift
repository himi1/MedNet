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
    
    
    func fetchProfileHospitalAppointmentAndDonations(userType: String) throws {
        guard let DB = self.dbInstance.DB else {
            throw DataAccessError.datastore_Connection_Error
        }
        
        do
        {
            let query = "select p.dateOfBirth, p.approval, p.bloodType, h.name, hpt.apptDate, hpt.reason, hpt.start, hpt.end, ms.id, msa.validTo, msa.authid, ha.name, a.name, i.name, t.name, cr.name, o.name, f.fLimit, hpt.id from " + userType + " c left outer join HospitalAppointment hpt on hpt.bookedBy = c.id left outer join MedicalService ms on ms.userId = c.id  left outer join MedicalService_Authorization msa on msa.service = ms.id left outer join Organ o on o.id = ms.id left outer join Fund f on f.id = ms.id left outer join Profile p on p.userId = c.id  left outer join Allergies a on a.partOf = p.id left outer join Interests i on i.partOf = p.id  left outer join Treatments t on t.partOf = p.id  left outer join Certificates cr on cr.partOf = p.id left outer join MedNetUser h on h.id = hpt.hospital left outer join MedNetUser ha on ha.id = msa.authorizedBy where c.id = ?"
            
            //var profileSet = false
            let stmt = try DB.prepare(query)
            for row in try stmt.run(self.id)
            {   //profile construction
                if (self.profile == nil) {
                    self.profile = Profile(approval: getApproval(approvalInt: row[1] as! Int64), bloodType: getBloodType(bloodTypeInt: row[2] as! Int64), dateOfBirth: row[0] as! String)
                }
                
                //hospital appointment
                if (row[3] != nil) {
                    var hospitalAppointAlreadypresent = false
                    //check if hospital appointment already present
                    for each in self.hospitalAppointments {
                        if(each.appointmentId == (row[18] as! Int64)) {
                            hospitalAppointAlreadypresent = true
                        }
                    }
                    
                    if (!hospitalAppointAlreadypresent) {
                        self.hospitalAppointments.append(HospitalAppointment(hospitalName: row[3] as! String,  appointmentId: row[18] as! Int64, date: row[4] as! String, reason: row[5] as! String, start: row[6] as! String, end: row[7] as! String))
                    }
                }
                
                if(row[8] != nil) {
                    //organDonation construction
                    if(row[16] != nil) {
                        self.organDonation.append(OrganDonation(authorizedBy: row[11] as! String, authId: row[10] as! String, validTo: row[9] as! String, name: row[16] as! String))
                    }
                    //fundDonation construction
                    if (row[17] != nil) {
                        self.fundDonation.append(FundDonation(authorizedBy: row[11] as! String, authId: row[10] as! String, validTo: row[9] as! String, fundLimit: row[17] as! Int64))
                    }
                }
                
                if(row[12] != nil) {
                    //allergies Construction
                    self.profile?.allergiesSet.insert(row[12] as! String)
                }
                if(row[13] != nil) {
                    //interestsSet Construction
                    self.profile?.interestsSet.insert(row[13] as! String)
                }
                if(row[14] != nil) {
                    //treatment Construction
                    self.profile?.treatmentSet.insert(row[14] as! String)
                }
                if(row[15] != nil) {
                    //certificate Construction
                    self.profile?.certificatesSet.insert(row[15] as! String)
                }
            }
            
            print("Read from data base")
            
        }
        catch
        {
            print("Something went wrongggg")
            throw DataAccessError.search_Error
        }
        
    }
    
    func getApproval(approvalInt: Int64) -> String {
        switch(Int(approvalInt)) {
        case 1: return "Canceled"
        case 2: return "Pending"
        case 3: return "Denied"
        case 4: return "Completed"
        default: return "Pending"
        }
    }
    
    func getBloodType(bloodTypeInt: Int64) -> String {
        switch(Int(bloodTypeInt)) {
        case 1: return "A+"
        case 2: return "A-"
        case 3: return "AB+"
        case 4: return "AB-"
        case 1: return "B+"
        case 2: return "B-"
        case 3: return "O+"
        case 4: return "O-"
        default: return "A+"
        }
    }//end of fetchProfileHospitalAppointmentAndDonations
    
    
    
    
    
    
    
}//end of class Registered


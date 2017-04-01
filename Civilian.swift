//
//  Civilian.swift
//  MedNet
//
//  Created by Himanshi Bhardwaj on 4/1/17.
//  Copyright © 2017 HPP. All rights reserved.
//

import Foundation

class Civilian : Registered {
    var cUID: String?
    var CUIDType: CUIDType?
    
    static let sharedInstance = Civilian()
    
    func getCivilianFromDb(userName: String) {
        //fetch from Resistered table
        getRegisteredFromDb(userName: userName)
        
        do {
            self.userName = userName
             //fetch from Civilian table
            try self.fetchCivilian()
        }
        catch {
            print("Failed to fetch registeredUserfromDb")
        }
    }
    
    
    func fetchCivilian() throws {
        guard let DB = self.dbInstance.DB else {
            throw DataAccessError.datastore_Connection_Error
        }
        
        do
        {
            let query = "select p.dateOfBirth, p.approval, p.bloodType, h.name, hpt.apptDate, hpt.reason, hpt.start, hpt.end, ms.id, msa.validTo, msa.authid, ha.name, a.name, i.name, t.name, cr.name, o.name, f.fLimit from Civilian c left outer join HospitalAppointment hpt on hpt.bookedBy = c.id left outer join MedicalService ms on ms.userId = c.id  left outer join MedicalService_Authorization msa on msa.service = ms.id left outer join Organ o on o.id = ms.id left outer join Fund f on f.id = ms.id left outer join Profile p on p.userId = c.id  left outer join Allergies a on a.partOf = p.id left outer join Interests i on i.partOf = p.id  left outer join Treatments t on t.partOf = p.id  left outer join Certificates cr on cr.partOf = p.id left outer join MedNetUser h on h.id = hpt.hospital left outer join MedNetUser ha on ha.id = msa.authorizedBy where c.id = ?"
            
            //var profileSet = false
            let stmt = try DB.prepare(query)
            print("self.id:", self.id)
            for row in try stmt.run(self.id)
            {   //profile construction
                if (self.profile == nil) {
                    self.profile = Profile(approval: row[1] as! String, bloodType: row[2] as! String, dateOfBirth: row[0] as! Date)
                }
                
                //hospital appointment
                if (row[3] != nil) {
                    self.hospitalAppointments.append(HospitalAppointment(hospitalName: row[3] as! String, date: row[4] as! Date, reason: row[5] as! String, start: row[6] as! Date, end: row[7] as! Date))
                }
                
                if(row[8] != nil) {
                    //organDonation construction
                    if(row[16] != nil) {
                        self.organDonation.append(OrganDonation(authorizedBy: row[11] as! String, authId: row[10] as! String, validTo: row[9] as! Date, name: row[16] as! String))
                    }
                    //fundDonation construction
                    if (row[17] != nil) {
                         self.fundDonation.append(FundDonation(authorizedBy: row[11] as! String, authId: row[10] as! String, validTo: row[9] as! Date, fundLimit: row[17] as! Int64))
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
            
        }
        catch
        {
            print("Something went wrongggg")
            throw DataAccessError.search_Error
        }
        
    }
    
    
    
}



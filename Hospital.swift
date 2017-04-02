//
//  Hospital.swift
//  MedNet
//
//  Created by Himanshi Bhardwaj on 4/1/17.
//  Copyright © 2017 HPP. All rights reserved.
//

import Foundation

class Hospital : Registered {
    var hospitalServices = Set<String>()
    
    static let sharedInstance = Hospital()
    
    func getHospitalFromDb(userName: String) {
        //fetch from Resistered table
        getRegisteredFromDb(userName: userName)
        
        do {
            self.userName = userName
            //fetch from Civilian table
            try self.fetchHospital()
        }
        catch {
            print("Failed to fetch registeredUserfromDb")
        }
    }
    
    func fetchHospital() throws {
        guard let DB = self.dbInstance.DB else {
            throw DataAccessError.datastore_Connection_Error
        }
        
        do
        {
            let query = "select ms.id, msa.validTo, msa.authid, ha.name, hs.name from Hospital c left outer join MedicalService ms on ms.userId = c.id  left outer join MedicalService_Authorization msa on msa.service = ms.id
            left outer join Special s on s.id = msa.service left outer join MedNetUser ha on ha.id = msa.authorizedBy
            left outer join HospitalServices hs on hs.providedBy = c.id where c.id = ?"
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





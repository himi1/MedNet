//
//  TestMe.swift
//  SQLite
//
//  Created by Himanshi Bhardwaj on 3/31/17.
//
//

import Foundation

import Foundation
import SQLite

/*
public class Civilian : RegisteredMedNetUser {
    var cUID: String?
    var CUIDType: CUIDType?
    var dbInstance: SQLiteDataStore?
    
    public init(dbInstance: SQLiteDataStore, userName: String) {
        this.dbInstance = dbInstance
        this.userName = userName
        this.fetchUserDetailsn(userName)
    }
    
    private fetchCivilian() {
    guard let DB = this.dbInstance.DB else {
    throw DataAccessError.datastore_Connection_Error
    }
    do
    {
    let query = "some query where c.userName = ?";
    let stmt = DB.prepare(query)
    for row in stmt.run(userName)
    {
				this.id = row[0]
				this.name = row[1]
				this.emailId = row[2]
				this.phone = row[3]
				this.cUID = row[4]
				this.cUIDType = row[5]
				this.sentRequests.insert(MedicalRequest(row[6], row[7], toString(row[8]), toString(row[9])))
				this.receivedRequests.insert(MedicalRequest(row[10], row[11], toString(row[12]), toString(row[13])))
				this.hospitalAppointments.insert(HospitalAppointment(row[14]))
				var id: Int64?
    var name: String?
    var emailId: String?
    var phone: String?
    var sentRequests: Array<MedicalRequest> = Array()
    var receivedRequests: Array<MedicalRequest> = Array()
    print("ID: \(row[0]), CUID: \(row[1]), CUIDType: \(row[2])")
    }
    
    
    }
    catch
    {
    throw DataAccessError.search_Error
    }
    }
}*/

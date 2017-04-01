//
//  SQLiteDataStore.swift
//  MedNet
//
//  Created by Himanshi Bhardwaj on 3/25/17.
//  Copyright © 2017 HPP. All rights reserved.
//

import Foundation
import SQLite

enum DataAccessError: Error {
    case datastore_Connection_Error
    case insert_Error
    case delete_Error
    case search_Error
    case nil_In_Data
}



class SQLiteDataStore {
    static let sharedInstance = SQLiteDataStore()
    let DB: Connection?
    
    /*fileprivate init() {
        
        let path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
            ).first!
        
        print("db location:", path)
        
        do {
            DB = try Connection("\(path)/MedNetDatabase.db")
        } catch _ {
            print("Failed to connect to DB.")
            DB = nil
        }
    }*/
    
    public init() {
        
        let path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
            ).first!
        
        //print("db location:", dbPath)
        let dbPath = "/Users/himanshibhardwaj/IdeaProjects/MedNet/MedNet/MedNet.db"
        do {
            DB = try Connection(dbPath) /*Users/Zion/Documents/TestSQLite/MedNet.db*/
            print("done successfully")
        } catch _ {
            print("Failed to connect to DB.")
            DB = nil
        }
    }

    
    /*func createTables() throws{
        do {
            //TODO
            print("create tables")
            //try TeamDataHelper.createTable()
            //try PlayerDataHelper.createTable()
        } catch {
            throw DataAccessError.datastore_Connection_Error
        }
        
    }*/
    
    //ToDo: delete later on
    public func createTables() throws
    {
        guard let DB = SQLiteDataStore.sharedInstance.DB else {
            throw DataAccessError.datastore_Connection_Error
        }
        do
        {
            print("PD is mad")
            //try DB.prepare("select of from Allergies")
            //let stmt = DB.prepare("SELECT * FROM Civilian")
            for row in try DB.run("SELECT * FROM Civilian")
            {
                print ("Read")
                print(row)
                // print("ID: \(row[0]), CUID: \(row[1]), CUIDType: \(row[2])")
                // id: Optional(2), email: Optional("betty@icloud.com")
                // id: Optional(3), email: Optional("cathy@icloud.com")
            }
            //DB.scalar("SELECT count(*) FROM users") // 2
            
            
        }
        catch
        {
            print("Abracadabra")
            throw DataAccessError.datastore_Connection_Error
        }
        
    }

}


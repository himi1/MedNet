//
//  SQLiteDataStore.swift
//  TestSqliteSwiftV2
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
    
    fileprivate init() {
        
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
    }
    
    func createTables() throws{
        do {
            //TODO
            print("create tables")
            //try TeamDataHelper.createTable()
            //try PlayerDataHelper.createTable()
        } catch {
            throw DataAccessError.datastore_Connection_Error
        }
        
    } 
}


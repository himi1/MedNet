//
//  DataHelper.swift
//  MedNet
//
//  Created by Himanshi Bhardwaj on 3/25/17.
//  Copyright © 2017 HPP. All rights reserved.
//


import Foundation
import SQLite
/*

protocol DataHelperProtocol {
    associatedtype T
    static func createTable() throws -> Void
    static func insert(_ item: T) throws -> Int64
    static func delete(_ item: T) throws -> Void
    static func findAll() throws -> [T]?
}
/*****OUR tables classes*********/

//Phone class
class PhoneDataHelper: DataHelperProtocol {
    static let TABLE_NAME = "Phone"
    
    static let table = Table(TABLE_NAME)
    static let id = Expression<Int64>("id")
    static let countryCode = Expression<Int64>("countryCode") //city
    static let areaCode = Expression<Int64>("areaCode") //nickname
    static let phoneNo = Expression<Int64>("phoneNo") //abbreviation
    
    
    typealias P = Phone
    
    static func createTable() throws {
        guard let DB = SQLiteDataStore.sharedInstance.DB else {
            throw DataAccessError.datastore_Connection_Error
        }
        do {
            let _ = try DB.run( table.create(ifNotExists: true) {t in
                t.column(id, primaryKey: true)
                t.column(countryCode)
                t.column(areaCode)
                t.column(phoneNo)
            })
            
        } catch _ {
            // Error throw if table already exists
        }
        
    }
    
    static func insert(_ item: P) throws -> Int64 {
        guard let DB = SQLiteDataStore.sharedInstance.DB else {
            throw DataAccessError.datastore_Connection_Error
        }
        if (item.countryCode != nil && item.areaCode != nil && item.phoneNo != nil) {
            let insert = table.insert(countryCode <- item.countryCode!, areaCode <- item.areaCode!, phoneNo <- item.phoneNo!)
            do {
                let rowId = try DB.run(insert)
                guard rowId > 0 else {
                    throw DataAccessError.insert_Error
                }
                return rowId
            } catch _ {
                throw DataAccessError.insert_Error
            }
        }
        throw DataAccessError.nil_In_Data
        
    }
    
    static func delete (_ item: P) throws -> Void {
        guard let DB = SQLiteDataStore.sharedInstance.DB else {
            throw DataAccessError.datastore_Connection_Error
        }
        if let thisid = item.id {
            let query = table.filter(id == thisid)
            do {
                let tmp = try DB.run(query.delete())
                guard tmp == 1 else {
                    throw DataAccessError.delete_Error
                }
            } catch _ {
                throw DataAccessError.delete_Error
            }
        }
    }
    
    static func find(_ thisid: Int64) throws -> P? {
        guard let DB = SQLiteDataStore.sharedInstance.DB else {
            throw DataAccessError.datastore_Connection_Error
        }
        let query = table.filter(id == thisid)
        let items = try DB.prepare(query)
        for item in  items {
            return Phone(id: item[id] , countryCode: item[countryCode], areaCode: item[areaCode], phoneNo: item[phoneNo])
        }
        
        return nil
        
    }
    
    static func findAll() throws -> [P]? {
        guard let DB = SQLiteDataStore.sharedInstance.DB else {
            throw DataAccessError.datastore_Connection_Error
        }
        var retArray = [P]()
        let items = try DB.prepare(table)
        for item in items {
            retArray.append(Phone(id: item[id], countryCode: item[countryCode], areaCode: item[areaCode], phoneNo: item[phoneNo]))
        }
        
        return retArray
        
    }
}

//MedNetUser class
class MedNetUserDataHelper: DataHelperProtocol {
    static let TABLE_NAME = "MedNetUser"
    
    static let table = Table(TABLE_NAME)
    static let id = Expression<Int64>("id")
    static let firstName = Expression<String>("firstName")
    static let lastName = Expression<String>("lastName")
    static let phoneNo = Expression<Int64>("phoneNo")
    
    
    typealias M = MedNetUser
    
    static func createTable() throws {
        guard let DB = SQLiteDataStore.sharedInstance.DB else {
            throw DataAccessError.datastore_Connection_Error
        }
        do {
            let _ = try DB.run( table.create(ifNotExists: true) {t in
                t.column(id, primaryKey: true)
                t.column(firstName)
                t.column(lastName)
                t.column(phoneNo)
            })
            
        } catch _ {
            // Error throw if table already exists
        }
        
    }
    
    static func insert(_ item: M) throws -> Int64 {
        guard let DB = SQLiteDataStore.sharedInstance.DB else {
            throw DataAccessError.datastore_Connection_Error
        }
        if (item.firstName != nil && item.lastName != nil && item.phoneNo != nil) {
            let insert = table.insert(firstName <- item.firstName!, lastName <- item.lastName!, phoneNo <- item.phoneNo!)
            do {
                let rowId = try DB.run(insert)
                guard rowId > 0 else {
                    throw DataAccessError.insert_Error
                }
                return rowId
            } catch _ {
                throw DataAccessError.insert_Error
            }
        }
        throw DataAccessError.nil_In_Data
        
    }
    
    static func delete (_ item: M) throws -> Void {
        guard let DB = SQLiteDataStore.sharedInstance.DB else {
            throw DataAccessError.datastore_Connection_Error
        }
        if let thisid = item.id {
            let query = table.filter(id == thisid)
            do {
                let tmp = try DB.run(query.delete())
                guard tmp == 1 else {
                    throw DataAccessError.delete_Error
                }
            } catch _ {
                throw DataAccessError.delete_Error
            }
        }
    }
    
    static func find(_ thisid: Int64) throws -> M? {
        guard let DB = SQLiteDataStore.sharedInstance.DB else {
            throw DataAccessError.datastore_Connection_Error
        }
        let query = table.filter(id == thisid)
        let items = try DB.prepare(query)
        for item in  items {
            return MedNetUser(id: item[id] , firstName: item[firstName], lastName: item[lastName], phoneNo: item[phoneNo])
        }
        
        return nil
        
    }
    
    static func findAll() throws -> [M]? {
        guard let DB = SQLiteDataStore.sharedInstance.DB else {
            throw DataAccessError.datastore_Connection_Error
        }
        var retArray = [M]()
        let items = try DB.prepare(table)
        for item in items {
            retArray.append(MedNetUser(id: item[id], firstName: item[firstName], lastName: item[lastName], phoneNo: item[phoneNo]))
        }
        
        return retArray
        
    }
}



/******Examples********/
class TeamDataHelper: DataHelperProtocol {
    static let TABLE_NAME = "Teams"
    
    static let table = Table(TABLE_NAME)
    static let teamId = Expression<Int64>("teamid")
    static let city = Expression<String>("city")
    static let nickName = Expression<String>("nickname")
    static let abbreviation = Expression<String>("abbreviation")
    
    
    typealias T = Team
    
    static func createTable() throws {
        guard let DB = SQLiteDataStore.sharedInstance.DB else {
            throw DataAccessError.datastore_Connection_Error
        }
        do {
            let _ = try DB.run( table.create(ifNotExists: true) {t in
                t.column(teamId, primaryKey: true)
                t.column(city)
                t.column(nickName)
                t.column(abbreviation)
                })
            
        } catch _ {
            // Error throw if table already exists
        }
        
    }
    
    static func insert(_ item: T) throws -> Int64 {
        guard let DB = SQLiteDataStore.sharedInstance.DB else {
            throw DataAccessError.datastore_Connection_Error
        }
        if (item.city != nil && item.nickName != nil && item.abbreviation != nil) {
            let insert = table.insert(city <- item.city!, nickName <- item.nickName!, abbreviation <- item.abbreviation!)
            do {
                let rowId = try DB.run(insert)
                guard rowId > 0 else {
                    throw DataAccessError.insert_Error
                }
                return rowId
            } catch _ {
                throw DataAccessError.insert_Error
            }
        }
        throw DataAccessError.nil_In_Data
        
    }
    
    static func delete (_ item: T) throws -> Void {
        guard let DB = SQLiteDataStore.sharedInstance.DB else {
            throw DataAccessError.datastore_Connection_Error
        }
        if let id = item.teamId {
            let query = table.filter(teamId == id)
            do {
                let tmp = try DB.run(query.delete())
                guard tmp == 1 else {
                    throw DataAccessError.delete_Error
                }
            } catch _ {
                throw DataAccessError.delete_Error
            }
        }
    }
    
    static func find(_ id: Int64) throws -> T? {
        guard let DB = SQLiteDataStore.sharedInstance.DB else {
            throw DataAccessError.datastore_Connection_Error
        }
        let query = table.filter(teamId == id)
        let items = try DB.prepare(query)
        for item in  items {
            return Team(teamId: item[teamId] , city: item[city], nickName: item[nickName], abbreviation: item[abbreviation])
        }
        
        return nil
        
    }
    
    static func findAll() throws -> [T]? {
        guard let DB = SQLiteDataStore.sharedInstance.DB else {
            throw DataAccessError.datastore_Connection_Error
        }
        var retArray = [T]()
        let items = try DB.prepare(table)
        for item in items {
            retArray.append(Team(teamId: item[teamId], city: item[city], nickName: item[nickName], abbreviation: item[abbreviation]))
        }
        
        return retArray
        
    }
}



class PlayerDataHelper: DataHelperProtocol {
    static let TABLE_NAME = "Players"
    
    static let playerId = Expression<Int64>("playerid")
    static let firstName = Expression<String>("firstName")
    static let lastName = Expression<String>("lastName")
    static let number = Expression<Int>("number")
    static let teamId = Expression<Int64>("teamid")
    static let position = Expression<String>("position")
    
    
    static let table = Table(TABLE_NAME)
    
    typealias T = Player
    
    static func createTable() throws {
        guard let DB = SQLiteDataStore.sharedInstance.DB else {
            throw DataAccessError.datastore_Connection_Error
        }
        do {
            _ = try DB.run( table.create(ifNotExists: true) {t in
                
                t.column(playerId, primaryKey: true)
                t.column(firstName)
                t.column(lastName)
                t.column(number)
                t.column(teamId)
                t.column(position)
                
                })
        } catch _ {
            // Error thrown when table exists
        }
    }
    
    static func insert(_ item: T) throws -> Int64 {
        guard let DB = SQLiteDataStore.sharedInstance.DB else {
            throw DataAccessError.datastore_Connection_Error
        }
        if (item.firstName != nil && item.lastName != nil && item.teamId != nil && item.position != nil) {
            let insert = table.insert(firstName <- item.firstName!, number <- item.number!, lastName <- item.lastName!, teamId <- item.teamId!, position <- item.position!.rawValue)
            do {
                let rowId = try DB.run(insert)
                guard rowId >= 0 else {
                    throw DataAccessError.insert_Error
                }
                return rowId
            } catch _ {
                throw DataAccessError.insert_Error
            }
        }
        throw DataAccessError.nil_In_Data
    }
    
    static func delete (_ item: T) throws -> Void {
        guard let DB = SQLiteDataStore.sharedInstance.DB else {
            throw DataAccessError.datastore_Connection_Error
        }
        if let id = item.playerId {
            let query = table.filter(playerId == id)
            do {
                let tmp = try DB.run(query.delete())
                guard tmp == 1 else {
                    throw DataAccessError.delete_Error
                }
            } catch _ {
                throw DataAccessError.delete_Error
            }
        }
        
    }
    
    static func find(_ id: Int64) throws -> T? {
        guard let DB = SQLiteDataStore.sharedInstance.DB else {
            throw DataAccessError.datastore_Connection_Error
        }
        let query = table.filter(playerId == id)
        let items = try DB.prepare(query)
        for item in  items {
            return Player(playerId: item[playerId], firstName: item[firstName], lastName: item[lastName], number: item[number], teamId: item[teamId], position: Positions(rawValue: item[position]))
        }
        
        return nil
        
    }
    
    static func findAll() throws -> [T]? {
        guard let DB = SQLiteDataStore.sharedInstance.DB else {
            throw DataAccessError.datastore_Connection_Error
        }
        var retArray = [T]()
        let items = try DB.prepare(table)
        for item in items {
            retArray.append(Player(playerId: item[playerId], firstName: item[firstName], lastName: item[lastName], number: item[number], teamId: item[teamId], position: Positions(rawValue: item[position])))
        }
        
        return retArray
    }
}

*/

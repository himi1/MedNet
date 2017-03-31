//
//  RegisteredUserViewController.swift
//  MedNet
//
//  Created by Himanshi Bhardwaj on 3/25/17.
//  Copyright © 2017 HPP. All rights reserved.
//

import UIKit
import SQLite

class RegisteredUserViewController: MasterViewController {

    @IBOutlet weak var errorText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorText.isHidden = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    @IBAction func signInButtonTapped(_ sender: UIButton) {
        errorText.isHidden = true
        errorText.text = ""
        
        var validated: Bool = false
        validated = validateUserInput()
        
        if (validated) {
            //go to home page
            navigateToHomePage()
        }
        else {
            errorText.isHidden = false
        }
    }
    
    var MedNetUserId: Int64?
    func validateUserInput() -> Bool {
        var userFound = false
        //validate user from Database
        do {
            userFound = try findInRegisterTable(userName1: "lovecare")
        }
        catch {
            print("failed")
        }
        
        do {
            if(userFound) {
                try findInMedNetTable(MedNetUserId: MedNetUserId)
            }
            else {
                errorText.text = "No such user found"
            }
        }
        catch { print("failed")
        }
        
        
        
        
        //TODO: remove dummy user
        //create a dummy User
        UserProfile()
        /*UserProfile.sharedInstance.addANewUser(firstName: "Himanshi", lastName: "Bhardwaj", phoneNo: Phone(id: 1, countryCode: 1, areaCode: 617, phoneNo: 5169439), dateOfBirth: Date(), bloodType: "O+", allergies: ["Egg allergy", "Dummy allergy1", "Dummy allergy2"], treatments: ["dummy treatment", "dummy treatment2", "dummy treatment3"], certificates: ["dummy certificates", "dummy certificate1", "dummy certificate2"], medicalRequests: [MedicalRequest(status: 2,requestType: "Manual", reason: "Dummy reason1"), MedicalRequest(status: 1,requestType: "System", reason: "Approve user"), MedicalRequest(status: 3,requestType: "Manual", reason: "Dummy reason2")])*/
        
        
        //if it reaches here, means validation successful
        return true
    }
    
    /*
    class MedNetUser {
        var id: Int64?
        var name: String?
        var emailId: String?
        var phone: String?
        var sentRequests: Array<MedicalRequest> = Array()
        var receivedRequests: Array<MedicalRequest> = Array()
    }
    
    class RegisteredMedNetUser: MedNetUser {
        var userName: String?
        var profile: Profile?
        var hospitalAppointments: Array<HospitalAppointment> = Array()
        var services: Array<MedicalService> = Array()
    }
*/

    func findInRegisterTable(userName1: String) throws -> Bool { // -> { //RegisteredMedNetUser? {
        let registered = Table("Registered")
        let id = Expression<Int64>("id")
        let userName = Expression<String>("userName")
        guard let DB = SQLiteDataStore.sharedInstance.DB else {
            throw DataAccessError.datastore_Connection_Error
        }
        let query = registered.select(id)
            .filter(userName.like(userName1))
        for user in try DB.prepare(query) {
            MedNetUserId = user[id]
        }
        if MedNetUserId == nil {
            errorText.text = "No such userName found"
            return false
        }
        return true
        
    }
    
    func findInMedNetTable(MedNetUserId: Int64?) throws {
        let registered = Table("MedNetUser")
        let id = Expression<Int64>("id")
        guard let DB = SQLiteDataStore.sharedInstance.DB else {
            throw DataAccessError.datastore_Connection_Error
        }
        let query = registered.filter(MedNetUserId! == id)
        for user in try DB.prepare(query) {
            print(user)
        }
    }
    

}

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

    @IBOutlet weak var userNameTextField: JVFloatLabeledTextField!
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
    
    
    var userType: String = ""
    @IBAction func signInButtonTapped(_ sender: UIButton) {
    errorText.isHidden = true
       var validated: Bool = false
        validated = validateUserInput()
        
        if (validated) {
        switch(userType) {
        case "Civilian": Civilian.sharedInstance.getCivilianFromDb(userName: userNameTextField.text!)
        case "Doctor": Doctor.sharedInstance.getDoctorFromDb(userName: userNameTextField.text!)
        case "VolunteerOrganization": VolunteerOrganization.sharedInstance.getVolunteerOrganizationFromDb(userName: userNameTextField.text!)
        default: print("Did not match any user type")
            errorText.text = "Something went wrong, please try again."
            errorText.isHidden = false
            }
        }
        else {
            errorText.isHidden = false
        }

        if (validated) {
            //go to home page
            navigateToHomePage()
        }
    }
    
    var MedNetUserId: Int64?
    func validateUserInput() -> Bool {
        do {
            if (userNameTextField.text! != "") {
                print("trying to fetch from db")
            userType = try Registered.getUserTypeFromDb(userName: userNameTextField.text!)
            }
        }
        catch {
            print("Failed to get userName")
        }
        
        print("userType:", userType)
        
        if (userType == "") {
            errorText.text = "No such user name found."
            return false
        }
        return true
        
        }
}

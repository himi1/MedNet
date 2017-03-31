//
//  RegisteredUserViewController.swift
//  MedNet
//
//  Created by Himanshi Bhardwaj on 3/25/17.
//  Copyright © 2017 HPP. All rights reserved.
//

import UIKit

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
    
    
    func validateUserInput() -> Bool {
        //validate user from Database
        
        //TODO: remove dummy user
        //create a dummy User
        UserProfile()
        /*UserProfile.sharedInstance.addANewUser(firstName: "Himanshi", lastName: "Bhardwaj", phoneNo: Phone(id: 1, countryCode: 1, areaCode: 617, phoneNo: 5169439), dateOfBirth: Date(), bloodType: "O+", allergies: ["Egg allergy", "Dummy allergy1", "Dummy allergy2"], treatments: ["dummy treatment", "dummy treatment2", "dummy treatment3"], certificates: ["dummy certificates", "dummy certificate1", "dummy certificate2"], medicalRequests: [MedicalRequest(status: 2,requestType: "Manual", reason: "Dummy reason1"), MedicalRequest(status: 1,requestType: "System", reason: "Approve user"), MedicalRequest(status: 3,requestType: "Manual", reason: "Dummy reason2")])*/
        
        
        //if it reaches here, means validation successful
        return true
    }

        
        
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */



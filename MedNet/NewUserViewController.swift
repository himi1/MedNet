//
//  NewUserViewController.swift
//  MedNet
//
//  Created by Himanshi Bhardwaj on 3/25/17.
//  Copyright © 2017 HPP. All rights reserved.
//

import UIKit
import SQLite

class NewUserViewController: MasterViewController {
    
    @IBOutlet weak var countryCode: UITextField!
    @IBOutlet weak var areaCode: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var userTypeTextField: IQDropDownTextField!
    @IBOutlet weak var userInformationView: UIView!
    @IBOutlet weak var errorText: UILabel!
    var userType: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        errorText.isHidden = true
        configureDropDownTextField(textField: userTypeTextField, list: userTypeList)
        userInformationView.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func userTypeTextFieldEditingDidEnd(_ sender: Any) {
        if (userTypeTextField.selectedItem == nil) {
            userInformationView.isHidden = true
        }
        else {
            print("userTypeTextField.optionalItemText!", userTypeTextField.optionalItemText!)
            /*switch(userTypeTextField.selectedItem!) {
             case "Civilian", "Doctor":
             userInformationView.isHidden = false
             organizationView.isHidden = true
             userType = userTypeTextField.selectedItem!
             case "Hospital", "Volunteer organization":
             userInformationView.isHidden = true
             organizationView.isHidden = false
             userType = userTypeTextField.selectedItem!
             default:
             userInformationView.isHidden = true
             organizationView.isHidden = true
             
             }*/
            switch(userTypeTextField.selectedItem!) {
            case "Civilian", "Doctor":
                userInformationView.isHidden = false
                userType = userTypeTextField.selectedItem!
                firstName.placeholder = "First name"
                lastName.placeholder = "Last name"
                
            case "Hospital", "Volunteer organization":
                userInformationView.isHidden = false
                firstName.placeholder = "Organization name"
                lastName.placeholder = "Location"
                
                userType = userTypeTextField.selectedItem!
                
            default:
                userInformationView.isHidden = true
            }
            
        }
    }
    
    @IBAction func registerButtonTapped(_ sender: UIBarButtonItem) {
        errorText.isHidden = true
        do {
            let phoneId = try PhoneDataHelper.insert(
                Phone(id: 0,
                      countryCode: Int64(countryCode.text!),
                      areaCode: Int64(areaCode.text!),
                      phoneNo: Int64(phoneNumber.text!)))
            print("added phone number", phoneId)
            
            let MedNetUserId = try MedNetUserDataHelper.insert(
                MedNetUser(id: 0,
                           firstName: firstName.text!,
                           lastName: lastName.text!,
                           phoneNo: Int64(phoneId)))
            
            print("added MedNet User", MedNetUserId)
            
            performSegue(withIdentifier: "segueFromRegistrationToProfileAddViewController", sender: self)
            
        } catch _{
            print("error in adding phone number")
            errorText.isHidden = false
            
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
    
}
//
//  ProfileViewController.swift
//  MedNet
//
//  Created by Himanshi Bhardwaj on 3/28/17.
//  Copyright © 2017 HPP. All rights reserved.
//

import UIKit

class ProfileViewController: MasterViewController {
    
    @IBOutlet weak var nameTextField: UILabel!
    @IBOutlet weak var phoneNumberTextField: UILabel!
    @IBOutlet weak var dateOfBirthTextField: UILabel!
    @IBOutlet weak var bloodTypeTextField: UILabel!
    @IBOutlet weak var allergiesTextField: UILabel!
    @IBOutlet weak var certificatesTextField: UILabel!
    @IBOutlet weak var treatmentsTextField: UILabel!
    var allergies = UserProfile.sharedInstance.allergies
    var certificates = UserProfile.sharedInstance.certificates
    var treatments = UserProfile.sharedInstance.treatments
    var allergiesText = ""
    var certificatesText = ""
    var treatmentsText = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = UserProfile.sharedInstance.firstName! + " " + UserProfile.sharedInstance.lastName!
        let phoneNo = UserProfile.sharedInstance.phoneNo!
        phoneNumberTextField.text = String(phoneNo.countryCode!) + "-" + String(phoneNo.areaCode!) + "-" + String(phoneNo.phoneNo!)
        dateOfBirthTextField.text = Util().dateFormatter.string(from: UserProfile.sharedInstance.dateOfBirth!)
        bloodTypeTextField.text = UserProfile.sharedInstance.bloodType
        
        //Allergies
        if (allergies.count == 0) {
            allergiesText = "Not added"
        }
        else {
            
            for allergy in allergies {
                allergiesText += allergy! + "\n"
            }
        }

        //certificates
        if (certificates.count == 0) {
            certificatesText = "Not added"
        }
        else {
            
            for certificate in certificates {
                certificatesText += certificate! + "\n"
            }
        }
        
        //treatments
        if (treatments.count == 0) {
            treatmentsText = "Not added"
        }
        else {
            
            for treatment in treatments {
                treatmentsText += treatment! + "\n"
            }
        }

        allergiesTextField.text = allergiesText
        certificatesTextField.text = certificatesText
        treatmentsTextField.text = treatmentsText
    }
    
    
    @IBAction func logoutButtonTapped(_ sender: Any) {
        navigateToLoginInPage()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

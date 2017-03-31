//
//  AddRequestViewController.swift
//  MedNet
//
//  Created by Himanshi Bhardwaj on 3/28/17.
//  Copyright © 2017 HPP. All rights reserved.
//

import UIKit

class AddRequestViewController: MasterViewController {
    
    @IBOutlet weak var errorText: UILabel!
    @IBOutlet weak var requestTextField: UITextField!
    
    var requestCurrentValue: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        errorText.isHidden = true
            requestTextField.text = requestCurrentValue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        errorText.isHidden = true
        errorText.text = ""
        
        var validated: Bool = false
        validated = validateUserInput()
        
        if (validated) {
            //add data to UserProfile class
            UserProfile.sharedInstance.addMedicalRequest(status: "Pending", requestType: "Manual", reason: requestTextField.text!)
            
            //go to back page
            performSegueToReturnBack()
        }
        else {
            errorText.isHidden = false
        }
    }
    
    
    func validateUserInput() -> Bool {
        if (requestTextField.text?.isEmpty)! {
            errorText.text = "Can't add empty request"
            return false
        }
        
        //if it reaches here, means validation successful
        return true
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

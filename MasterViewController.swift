//
//  MasterViewController.swift
//  MedNet
//
//  Created by Himanshi Bhardwaj on 3/25/17.
//  Copyright © 2017 HPP. All rights reserved.
//

import UIKit
import SQLite
import SearchTextField

class MasterViewController: UIViewController {
    let bloodTypeList = ["AB+", "AB-", "A+", "A-", "B+", "B-", "O+", "O-"]
    let treatmentSuggestionList = ["Sinus treatment", "Skin treatment",
                                   "Teeth treatment"]
    let allergySuggestionList = ["Eggs(Food Allergy)",
                                 "Milk(Food Allergy)",
                                 "Peanuts(Food Allergy)",
                                 "Tree nuts(Food Allergy)",
                                 "Fish(Food Allergy)",
                                 "Shellfish(Food Allergy)",
                                 "Wheat(Food Allergy)",
                                 "Soy(Food Allergy)",
                                 "Cat(Pets Allergy)",
                                 "Dog(Pets Allergy)",
                                 "Drug Allergy",
                                 "Dust Allergy",
                                 "Penicillin(Drug Allergy)",
                                 "Skin Allergy",
                                 "Eye Allergy",
                                 "Insect Allergy",
                                 "Latex Allergy",
                                 "Mold Allergy",
                                 "Cockroach Allergy"]
    let certificateSuggestionList = ["Nursing certificate",
                                     "Medical certificate",
                                     "Teeth certificate"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //To hide keyboard when Tapped around
        hideKeyboardWhenTappedAround()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Enables auto search from a list of Strings
    func setSearching(textField: SearchTextField, list: [String]) {
        // Set the array of strings to suggest
        textField.filterStrings(list)
        // Then set the inline mode in true
        textField.inlineMode = true
        // Set a visual theme (SearchTextFieldTheme)
        textField.theme = SearchTextFieldTheme.darkTheme()
        // Set specific comparision options - Default: .caseInsensitive
        textField.comparisonOptions = [.caseInsensitive]
    }
    
    func navigate(segue: String) {
        performSegue(withIdentifier: segue, sender: self)
    }
    
    /*func backToPreviousPage(){
     dismiss(animated: true, completion: nill)
     //dismiss(animated: true, completion: nil)
     }*/
    
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func performSegueToReturnBack()  {
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
}

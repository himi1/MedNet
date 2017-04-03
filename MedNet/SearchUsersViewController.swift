//
//  SearchUsersViewController.swift
//  MedNet
//
//  Created by Himanshi Bhardwaj on 4/2/17.
//  Copyright © 2017 HPP. All rights reserved.
//

import UIKit

class SearchUsersViewController: UIViewController {

    @IBOutlet weak var errorText: UILabel!
    @IBOutlet weak var searchTextField: SearchTextField!
    var searchResultNames: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        errorText.isHidden = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func searchButtonTapped(_ sender: Any) {
        errorText.isHidden = true
        
        if (searchTextField.text?.isEmpty)! {
            errorText.text = "Enter some partial name"
            errorText.isHidden = false
        }
        else {
            switch(UserProfile.sharedInstance.userType) {
            case "Civilian":
                searchResultNames = Civilian.sharedInstance.searchProfiles(searchText: searchTextField.text!)
            case "Doctor":
                searchResultNames = Doctor.sharedInstance.searchProfiles(searchText: searchTextField.text!)
            default: print("user not of type Civilian or doctor")
            }
        }
        
        print("searchResultNames:", searchResultNames)
        //todo: add to the UI
        
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

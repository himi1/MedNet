//
//  AddAllergiesViewController.swift
//  MedNet
//
//  Created by Himanshi Bhardwaj on 3/26/17.
//  Copyright © 2017 HPP. All rights reserved.
//

import UIKit
//import SearchTextField

class AddAllergiesViewController: MasterViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var AllergiesTableView: UITableView!
    @IBOutlet weak var addAllergiesView: UIView!
    @IBOutlet weak var haveAllergiesSwitch: UISwitch!
    @IBOutlet weak var newAllergyTextField: SearchTextField!
    @IBOutlet weak var errorText: UILabel!
    
    var allergiesList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        errorText.isHidden = true
        
        haveAllergiesSwitchValueChanged(sender: haveAllergiesSwitch)
        
        //New Allergy text field
        newAllergyTextField.placeholder = "Add an allergy"
        
        setSearching(textField: newAllergyTextField, list: allergySuggestionList)
    }
    
    func configureTableView() {
        // AllergiesTableView Delegate
        AllergiesTableView.delegate      =   self
        AllergiesTableView.dataSource    =   self
        
        // Set color of AllergiesTableView
        AllergiesTableView.backgroundColor = UIColor.white
    }
    
    @IBAction func addAllergiesButtonTapped(_ sender: UIButton) {
        if (self.newAllergyTextField.text! != "") {
            allergiesList.append(self.newAllergyTextField.text!)
            
            //to reload the AllergiesTableView
            AllergiesTableView.reloadData()
            //reset newAllergyTextField
            newAllergyTextField.text = ""
            newAllergyTextField.placeholder = "Add another allergy"
        }

    }


    //MARK: Have Allergies Switch button
    @IBAction func haveAllergiesSwitchValueChanged(sender: UISwitch) {
        if sender.isOn {
            addAllergiesView.isHidden = false
            //RecommendationEngineData.sharedInstance.haveChildren = true
        }
        else {
            addAllergiesView.isHidden = true
            //RecommendationEngineData.sharedInstance.haveChildren = false
        }
    }

    //MARK: AllergiesTableView table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allergiesList.count //self.ChildrenNameAndAge.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell1")! as UITableViewCell
        
        cell.textLabel?.text = allergiesList[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        return cell
    }
    
    //to add swipe to delete and edit feature
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") {action in
            //handle delete
            self.allergiesList.remove(at: indexPath.row)
            
            //to reload the AllergiesTableView
            self.AllergiesTableView.reloadData()
            
        }
        
        let editAction = UITableViewRowAction(style: .normal, title: "Edit") {action in
            //handle edit
            self.newAllergyTextField.text = self.allergiesList[indexPath.row]
            self.allergiesList.remove(at: indexPath.row)
            
            //to reload the AllergiesTableView
            self.AllergiesTableView.reloadData()
        }
        
        return [deleteAction, editAction]
    }
    
    //MARK: - Navigation
    
    @IBAction func nextButtonTapped(_ sender: UIBarButtonItem) {
        errorText.isHidden = true
        errorText.text = ""
        
        var validated: Bool = false
        validated = validateUserInput()
        
        if (validated) {
            //add data to UserProfile class
            UserProfile.sharedInstance.setAllergies(allergies: allergiesList)
            
            //go to next page
            navigate(segue: "segueFromAddAllergiesToAddTreatmentsViewController")
        }
        else {
            errorText.isHidden = false
        }
    }
    
    
    func validateUserInput() -> Bool {
        //nothing to validate till now
        
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

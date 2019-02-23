//
//  ViewController.swift
//  homework02
//
//  Created by Maria Handschu on 2/18/19.
//  Copyright © 2019 Maria Handschu. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var aContact = Contact(namePassed: "Maria Handschu", emailPassed: "maria@unc.edu", phone: "919-555-5555", type: 0)
    
    
    var contactList:  [Contact] = []//saves an empty array
    
    var newContact = Contact()//saves contact info from newContactVC
    
    var workingCell: UITableViewCell?
    var workingCellIndexPath: IndexPath?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print( "viewDidLoad" )
        contactList.append(aContact)
        tableView.reloadData()
        
    }
    
   override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("viewDidAppear")
        tableView.reloadData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailsSeg" {
            
            let dest = segue.destination as! DetailsViewController
            dest.contact = self.newContact
            dest.workingCellIndexPath = self.tableView.indexPath(for: workingCell!)!
        }
    }
    
    
    @IBAction func goBack(unwindSegue: UIStoryboardSegue) {
        
        if unwindSegue.identifier == "addContactSegue" {
            contactList.append(newContact)
        }
        if unwindSegue.identifier == "backToList" {
            contactList.remove(at: workingCellIndexPath!.row)
            tableView.reloadData()
        }
        
        
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! ContactTableCell
        
        cell.delegate = self
        
        self.workingCell = cell
//        if workingCell != nil {
//            
//            let ip = tableView.indexPath(for: workingCell!)
//            contactList.remove(at: ip!.row)
//        }
        
    
        
        let contact = contactList[indexPath.row]
        self.newContact = contact
        
        let name = cell.viewWithTag(102) as! UILabel
        let email = cell.viewWithTag(103) as! UILabel
        let phone = cell.viewWithTag(104) as! UILabel
        let phoneType = cell.viewWithTag(105) as! UILabel
        
        name.text = contact.name
        email.text = contact.email
        phone.text = contact.phoneNum
       phoneType.text = String(contact.phoneType!)
       
        if contact.phoneType == 0 {
            phoneType.text = "Cell"
        }
        else if contact.phoneType == 1 {
            phoneType.text = "Home"
        } else {
            phoneType.text = "Office"
        }

        print(contact)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        newContact = contactList[indexPath.row]
        
        
//      let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        print("Selected row\(newContact)")
        performSegue(withIdentifier: "DetailsSeg", sender: nil)
    }
    
    
}
    
extension ViewController: CustomCellDelegate {
    func clickDeleteButton(cell: UITableViewCell) {
        let ip = self.tableView.indexPath(for: cell)
        print (ip)
        contactList.remove(at: ip!.row)
        tableView.reloadData()
    }
}


    
    


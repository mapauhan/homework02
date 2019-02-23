//
//  DetailsViewController.swift
//  homework02
//
//  Created by Maria Handschu on 2/21/19.
//  Copyright © 2019 Maria Handschu. All rights reserved.
//

import UIKit

protocol DeleteCellFromDetail {
    func clickDeleteButton(cell: UITableViewCell)
}

class DetailsViewController: UIViewController {
    
    var contact: Contact?
    var delegate: DeleteCellFromDetail?
    var workingCell: UITableViewCell?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneNum: UILabel!
    @IBOutlet weak var phoneType: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        
        if contact != nil {
            updateViewData()
        }

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        if contact != nil {
            updateViewData()
        }

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditContact" {
            // Get the new view controller using segue.destination.
            let dest = segue.destination as! EditContactVC
            
            contact?.name = self.nameLabel.text
            contact?.email = self.emailLabel.text
            contact?.phoneNum = self.phoneNum.text
            
            let homeAt = self.phoneType.text
            
            switch homeAt {
            case "Cell":
                contact?.phoneType = 0
            case "Home":
                contact?.phoneType = 1
                
            default:
                contact?.phoneType = 2
            }
            
            dest.contact = self.contact
        }
        
        if segue.identifier == "BackToDetails" {
            // Get the new view controller using segue.destination.
            let dest = segue.destination as! DetailsViewController
            
            contact?.name = self.nameLabel.text
            contact?.email = self.emailLabel.text
            contact?.phoneNum = self.phoneNum.text
            
            let homeAt = self.phoneType.text
            
            switch homeAt {
            case "Cell":
                contact?.phoneType = 0
            case "Home":
                contact?.phoneType = 1
                
            default:
                contact?.phoneType = 2
            }
            
            dest.contact = self.contact
        }
        
        
    }
    
    private func updateViewData() {
        self.nameLabel.text = contact!.name!
        self.emailLabel.text = contact!.email!
        self.phoneNum.text = contact!.phoneNum!
        self.phoneType.text = String(contact!.phoneType!)
        
        if contact!.phoneType == 0 {
            phoneType.text = "Cell"
        }
        else if contact!.phoneType == 1 {
            phoneType.text = "Home"
        } else {
            phoneType.text = "Office"
        }

    }
    
    @IBAction func processPageReturn (unwindsegue: UIStoryboardSegue) {
        
        print(contact?.name!)
        
    }

    @IBAction func deleteContact(_ sender: UIButton) {

        delegate?.clickDeleteButton(cell: self.workingCell!)

        print("deleteContact")
        dismiss(animated: true)
        
    }
}

//
//  ContactTableCell.swift
//  homework02
//
//  Created by Maria Handschu on 2/18/19.
//  Copyright © 2019 Maria Handschu. All rights reserved.
//

import UIKit

protocol CustomCellDelegate {
    func clickDeleteButton(cell: UITableViewCell)
}

class ContactTableCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneNumLbl: UILabel!
    @IBOutlet weak var phoneTypeLbl: UILabel!
    
    // implement the delegate
    var delegate: CustomCellDelegate?
    
    func populateCell(contact: Contact) {
        nameLabel.text = contact.name
        emailLabel.text = contact.email
        phoneNumLbl.text = contact.phoneNum
        
        if contact.phoneType == 0 {
            phoneTypeLbl.text = "Cell"
        }
       else if contact.phoneType == 1 {
            phoneTypeLbl.text = "Home"
        } else {
            phoneTypeLbl.text = "Office"
        }
    

    }
    
    @IBAction func clickCellDeleteButton(_ sender: UIButton) {
        print("clickCellDeleteButton")
        delegate?.clickDeleteButton(cell: self)
        
    }
}

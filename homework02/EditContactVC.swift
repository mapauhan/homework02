//
//  EditContactVC.swift
//  homework02
//
//  Created by joseph on 2/21/19.
//  Copyright © 2019 Maria Handschu. All rights reserved.
//

import UIKit

class EditContactVC: UIViewController {

    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var sgcPhoneType: UISegmentedControl!
    
    var contact: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.txtName.text = contact?.name
        self.txtEmail.text = contact?.email
        self.txtPhone.text = contact?.phoneNum
        self.sgcPhoneType.selectedSegmentIndex = (contact?.phoneType!)!
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        contact?.name = self.txtName.text
        contact?.email = self.txtEmail.text
        contact?.phoneNum = self.txtPhone.text
        contact?.phoneType = self.sgcPhoneType.selectedSegmentIndex
        
        let dest = segue.destination as! DetailsViewController
        
        dest.contact = self.contact
    }

}

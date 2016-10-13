//
//  Message.swift
//  FamilyHouse
//
//  Created by Douglas Galante on 10/13/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController {
    
    var message = String()
    
    @IBOutlet weak var messageTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageTextView.text = message
        
    }
}



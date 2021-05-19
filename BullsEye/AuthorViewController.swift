//
//  AuthorViewController.swift
//  BullsEye
//
//  Created by Vicky Jha on 18/05/21.
//

import UIKit

class AuthorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closeButton() {
        dismiss(animated: true, completion: nil)
    }
    
    static func useVariable(oimekevariable: String) {
        print(oimekevariable)
    }
}

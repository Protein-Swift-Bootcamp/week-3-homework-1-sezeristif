//
//  SecondViewController.swift
//  bootcamp-week-3
//
//  Created by Sezer Istif on 20.12.2022.
//

import UIKit



class SecondViewController: UIViewController {
    
    let notificationCenter = NotificationCenter.default
    
    var delegate: TextFieldChangedDelegate?
    
    @IBOutlet weak var textField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func submitTextButtonPressed(_ sender: Any) {
        let text = textField.text ?? ""
        delegate?.textFieldChanged(text: text)
        
        notificationCenter.post(name: Notification.Name("TextFieldChanged"), object: text)
        
        self.dismiss(animated: true)
    }
    

}

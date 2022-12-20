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
    
    var textFieldChangedClosure : ((String) -> Void)?
    
    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func submitTextButtonPressed(_ sender: Any) {
        let text = textField.text ?? ""
        
        // pass with delegate
        delegate?.textFieldChanged(text: text)
        
        // pass with notification center
        notificationCenter.post(name: Notification.Name("TextFieldChanged"), object: text)
        
        // pass with closure
        textFieldChangedClosure?(text)
        
        self.dismiss(animated: true)
    }
    

}

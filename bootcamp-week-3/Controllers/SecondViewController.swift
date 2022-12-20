//
//  SecondViewController.swift
//  bootcamp-week-3
//
//  Created by Sezer Istif on 20.12.2022.
//

import UIKit



class SecondViewController: UIViewController {
    
    var delegate: TextFieldChangedDelegate?
    
    @IBOutlet weak var textField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func submitTextButtonPressed(_ sender: Any) {
        let text = textField.text ?? ""
        delegate?.textFieldChanged(text: text)
    }
    

}

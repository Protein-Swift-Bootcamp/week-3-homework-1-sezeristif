//
//  ViewController.swift
//  bootcamp-week-3
//
//  Created by Sezer Istif on 20.12.2022.
//

import UIKit

protocol TextFieldChangedDelegate {
    func textFieldChanged(text: String)
}

class FirstViewController: UIViewController, TextFieldChangedDelegate {

    @IBOutlet weak var delegateLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func moveNextControllerPressed(_ sender: Any) {
        performSegue(withIdentifier: "showSecondViewController", sender: self)
    }
    
    func textFieldChanged(text: String) {
        delegateLabel.text = text
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? SecondViewController {
            destinationVC.delegate = self
        }
    }
    
}


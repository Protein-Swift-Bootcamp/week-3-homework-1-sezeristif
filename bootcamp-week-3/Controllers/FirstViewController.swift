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
    
    let notificationCenter = NotificationCenter.default

    @IBOutlet weak var delegateLabel: UILabel!
    @IBOutlet weak var notificationCenterLabel: UILabel!
    @IBOutlet weak var closureLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notificationCenter.addObserver(self, selector: #selector(self.textFieldChangedNotification), name: Notification.Name("TextFieldChanged"), object: nil)
    }
    
    @IBAction func moveNextControllerPressed(_ sender: Any) {
        performSegue(withIdentifier: "showSecondViewController", sender: self)
    }
    
    func textFieldChanged(text: String) {
        delegateLabel.text = "Delegate: \(text)"
    }
    
    @objc func textFieldChangedNotification(_ notification: Notification){
        let text = notification.object! as? String
        notificationCenterLabel.text = "Notification Center: \(text ?? "")"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? SecondViewController {
            destinationVC.delegate = self
            destinationVC.textFieldChangedClosure = { (text) in
                self.closureLabel.text = "Closure: \(text)"
            }
        }
    }
    
}


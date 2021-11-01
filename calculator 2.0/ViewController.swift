//
//  ViewController.swift
//  calculator
//
//  Created by fernando babonoyaba on 10/26/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numDisplayed: UILabel!
    var counter = 0
    var storedValue: Double = 0
    var lastOperation = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func numPressed(_ sender: UIButton) {
        if let name = sender.titleLabel?.text {
            if let num = numDisplayed.text {
                if num == "0" {
                    numDisplayed.text = name
                } else {
                    numDisplayed.text?.append(name)
                }
            }
        }
    }
    
    
    @IBAction func AcButton(_ sender: UIButton) {
        numDisplayed.text = "0"
        counter = 0
        storedValue = 0
    }
    
    
    @IBAction func periodPressed(_ sender: UIButton) {
        if let name = sender.titleLabel?.text {
            if counter == 0 {
                numDisplayed.text?.append(name)
                counter += 1
            }
            
        }
    }
    
    
    @IBAction func negativeOrPositive(_ sender: UIButton) {
        if let currentValue = numDisplayed.text {
            let returnedValue = -1 * Double(currentValue)!
            var newValue = String(returnedValue)
            if newValue.suffix(2) == ".0" {
                newValue.removeLast(2)
                numDisplayed.text = newValue
                counter = 0
            } else {
                numDisplayed.text = newValue
            }
        }
    }
    
    @IBAction func mathFunction(_ sender: UIButton) {
        if let operation = sender.titleLabel?.text {
            if let value = numDisplayed.text {
            
                if lastOperation == "+" {
                    storedValue += Double(value)!
                } else {
                    storedValue = Double(value)!
                }
            }
            lastOperation = operation
            numDisplayed.text = String(storedValue)
            print(storedValue)
        }
    }
    
    
    
}


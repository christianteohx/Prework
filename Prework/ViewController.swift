//
//  ViewController.swift
//  Prework
//
//  
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var sliderLabel: UILabel!


    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let currentValue = Int(sender.value * 100)
        sliderLabel.text = "\(currentValue)%"
        
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        let tip = Double(currentValue) * bill / 100
        
        let total = bill + tip
        
        // Update Tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        // Update Total Amount
        totalLabel.text = String(format:"$%.2f", total)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "Tip Calculator"
    }

    @IBAction func calculateTip(_ sender: Any) {

        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        
        // Get total tip by multiplying tip * tipPercentage
        let tipPercentages = [0.15, 0.18, 0.20]
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        
        sliderLabel.text = "\(Int(tipPercentages[tipControl.selectedSegmentIndex] * 100))%"
        
        let total = bill + tip
        
        tipSlider.value = Float(tipPercentages[tipControl.selectedSegmentIndex])

        // Update Tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        // Update Total Amount
        totalLabel.text = String(format:"$%.2f", total)
        

    }

}



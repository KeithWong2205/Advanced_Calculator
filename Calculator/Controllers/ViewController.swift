//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTyping: Bool = true
    private var displayedValue: Double {
        get {
            guard let doubleNumber = Double(displayLabel.text!) else {fatalError("Cannot convert to Double")}
            return doubleNumber
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    private var calcModel = CalculatorModel()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTyping = true
        if let methodCalc =  sender.currentTitle{
            calcModel.setInput(displayedValue)
            if let result = calcModel.makeCaculation(symbol: methodCalc){  displayedValue = result}
           
        }
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle {
            if isFinishedTyping {
                displayLabel.text = numValue
                isFinishedTyping = false
            } else {
                if numValue == "." {
                    let isInt = floor(displayedValue) == displayedValue
                    if !isInt {
                        return
                    }
                }
                displayLabel.text?.append(numValue)
            }
            
        }
    }
    
}


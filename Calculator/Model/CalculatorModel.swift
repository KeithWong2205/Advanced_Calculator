//
//  CalculatorModel.swift
//  Calculator
//
//  Created by Keith on 9/19/22.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorModel {
    
    private var outputNumber: Double?
    
    private var mediumCalculation: (symbol: String, firstNum: Double)?
    
    mutating func setInput(_ inputNumber: Double){
        self.outputNumber = inputNumber
    }
    
    private func performCalcOfTwoNum(num1: Double, num2: Double, method: String) -> Double?{
        switch method {
        case "+":
            return num1 + num2
        case "-":
            return num1 - num2
        case "*":
            return num1 * num2
        case "/":
            return num1 / num2
        default:
            return nil
        }
    }
    
    mutating func makeCaculation(symbol: String) -> Double? {
        if let nilCheck = outputNumber {
            switch symbol {
            case "+/-":
                return nilCheck * -1
            case "%":
                return nilCheck / 100
            case "AC":
                return 0
            case "=":
                if let firstNum = mediumCalculation?.firstNum, let method = mediumCalculation?.symbol {
                   return performCalcOfTwoNum(num1: firstNum, num2: nilCheck, method: method)
                }
            default:
                mediumCalculation = (symbol: symbol, firstNum: nilCheck)
            }
        }
        
        return nil
    }
}

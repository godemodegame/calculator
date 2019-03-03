//
//  ViewController.swift
//  Calculator
//
//  Created by Кирилл Кириленко on 20/02/2019.
//  Copyright © 2019 godemodegame. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabelText: UILabel!
    
    var pointInTheEnd: Bool = false
    var operationSign: String = ""
    var operandOne: Double = 0
    var numberOnScreen: Double {
        get {
            return Double(displayLabelText.text!)!
        }
        set {
            let value = "\(newValue)"
            let valueArray = value.components(separatedBy: ".")
            if valueArray[1] == "0" {
                displayLabelText.text = valueArray[0]
            } else {
                displayLabelText.text = value
            }
        }
    }
    
    
    
    @IBAction func numberPressed(_ sender: UIButton) {
        let number = sender.currentTitle!
        
        if displayLabelText.text == "0" || displayLabelText.text == operationSign || displayLabelText.text == "error" {
            displayLabelText.text = number
            pointInTheEnd = false
        } else if displayLabelText.text?.count ?? 0 < 13 {
            displayLabelText.text = displayLabelText.text! + number
            if pointInTheEnd == true {
                pointInTheEnd = false
            }
        }
    }



    @IBAction func operationsWithTwoOperands(_ sender: UIButton) {
        if !pointInTheEnd && displayLabelText.text != "error" {
            if displayLabelText.text != operationSign {
                operandOne = numberOnScreen
            }
            displayLabelText.text = sender.currentTitle!
            operationSign = sender.currentTitle!
        }
    }
    
    
    
    @IBAction func resultPressed(_ sender: UIButton) {
        if !operationSign.isEmpty && !pointInTheEnd && displayLabelText.text != operationSign && displayLabelText.text != "error" {
            if numberOnScreen == 0 && operationSign == "÷" {
                displayLabelText.text = "error"
            } else {
                numberOnScreen = operationWithTwoOperands(operrandOne: operandOne, sign: operationSign, operrandTwo: numberOnScreen)
            }
        }
    }
    
    
    
    @IBAction func clearDisplayButton(_ sender: UIButton) {
        displayLabelText.text = "0"
        operationSign = ""
        operandOne = 0
    }
    
    
    
  
    @IBAction func pointButton(_ sender: UIButton) {
        if !pointInTheEnd && displayLabelText.text != operationSign && displayLabelText.text != "error" {
            pointInTheEnd = true
            displayLabelText.text! += "."
        }
    }
    
    @IBAction func oneOperandAction(_ sender: UIButton) {
        if !pointInTheEnd && displayLabelText.text != operationSign && displayLabelText.text != "error" {
            numberOnScreen = operationWithOneOperand(operand: numberOnScreen, sign: sender.currentTitle!)
        }
    }
    
    
}


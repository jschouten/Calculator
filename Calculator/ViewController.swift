//
//  ViewController.swift
//  Calculator
//
//  Created by Jorik Schouten on 02/05/15.
//  Copyright (c) 2015 Jorik Schouten. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var display: UILabel!
    
    var hasUserStartedTyping = false
    
    var operandStack = Array<Double>()
    
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text! = "\(newValue)"
            hasUserStartedTyping = false
        }
    }
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        
        if (hasUserStartedTyping) {
            display.text = display.text! + digit
        } else {
            display.text = digit
            hasUserStartedTyping = true
        }
    }
    
    @IBAction func enter() {
        hasUserStartedTyping = false
        operandStack.append(displayValue)
        println("operandStack = \(operandStack)")
    }
    
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        
        switch operation {
        case "+": performDoubleOperation { $0 + $1 }
        case "−": performDoubleOperation { $1 - $0 }
        case "×": performDoubleOperation { $0 * $1 }
        case "÷": performDoubleOperation { $1 / $0 }
        case "√": performSingleOperation { sqrt($0) }
        default: break
        }
    }
    
    func performSingleOperation(operation: (Double) -> Double) {
        if (operandStack.count >= 1) {
            displayValue = operation(operandStack.removeLast())
            enter()
        }
    }
    
    func performDoubleOperation(operation: (Double, Double) -> Double) {
        if (operandStack.count >= 2) {
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
    }
}


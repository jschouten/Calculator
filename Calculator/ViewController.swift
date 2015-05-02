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

    var hasUserStartedTyping: Bool = false
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        
        if (hasUserStartedTyping) {
            display.text = display.text! + digit
        } else {
            display.text = digit
            hasUserStartedTyping = true
        }
    }
}


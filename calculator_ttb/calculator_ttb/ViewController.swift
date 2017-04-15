//
//  ViewController.swift
//  calculator_ttb
//
//  Created by admin25 on 4/15/17.
//  Copyright © 2017 admin25. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var numberOnScreen:Double = 0;
    var previousNumber:Double = 0;
    var performingMath = false;
    var operation = 0;
    
    @IBOutlet weak var labelKetqua: UILabel!
    
    
    
    @IBAction func numbers(_ sender: UIButton) {
        if performingMath == true{
            labelKetqua.text = String(sender.tag - 1)
            numberOnScreen = Double(labelKetqua.text!)!
            performingMath = false
        }
            
        else{
            labelKetqua.text = labelKetqua.text! + String(sender.tag - 1)
            numberOnScreen = Double(labelKetqua.text!)!
        }
        
    }
    
    
    @IBAction func buttons(_ sender: UIButton) {
        
        if labelKetqua.text != "" && sender.tag != 15 && sender.tag != 16 {
            
            previousNumber = Double(labelKetqua.text!)!
            
            if sender.tag == 11{
                labelKetqua.text = "/"
            }
            if sender.tag == 12{
                labelKetqua.text = "*"
            }
            if sender.tag == 13{
                labelKetqua.text = "-"
            }
            if sender.tag == 14{
                labelKetqua.text = "+"
            }
            if sender.tag == 17{
                labelKetqua.text = "mod"
            }
            if sender.tag == 18{
                labelKetqua.text = "^"
            }
            
            operation = sender.tag
            performingMath = true
        }
        else if sender.tag == 15 {
            if operation == 11 {
                labelKetqua.text = String(previousNumber / numberOnScreen)
            }
            if operation == 12 {
                labelKetqua.text = String(previousNumber * numberOnScreen)
            }
            if operation == 13 {
                labelKetqua.text = String(previousNumber - numberOnScreen)
            }
            if operation == 14 {
                labelKetqua.text = String(previousNumber + numberOnScreen)
            }
            if operation == 18 {
                labelKetqua.text = String(pow(previousNumber,numberOnScreen))
            }
            if operation == 17 {
                labelKetqua.text = String(Int(previousNumber) % Int(numberOnScreen))
            }
        }
        else if sender.tag == 16 {
            labelKetqua.text = ""
            numberOnScreen = 0
            previousNumber = 0
            operation = 0
        }
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


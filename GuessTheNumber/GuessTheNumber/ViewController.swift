//
//  ViewController.swift
//  GuessTheNumber
//
//  Created by Адель Рахимов on 12.10.2019.
//  Copyright © 2019 Адель Рахимов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var randomNumb = 0

    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    @IBAction func button(sender: UIButton) {
        let rand = randomNumb
        if textField.text == nil {
            messageLabel.text = "число не введено"
            
        } else {
            let numbTF = Int(textField.text!)
            var razn = 0
            if rand - numbTF! > 0 {
                razn = rand - numbTF!
            } else {
                razn = numbTF! - rand
            }
        
        
            if rand == numbTF {
                messageLabel.text = "число угадано! \(rand)"
            
            } else {
                if razn > 5000 {
                    messageLabel.text = "ошиблись больше, чем на пять тысяч"
                } else if razn > 1000 {
                    messageLabel.text = "ошиблись больше, чем на тысячу"
                } else if razn > 100 {
                    messageLabel.text = "ошиблись больше, чем на сто"
                } else if razn > 10 {
                    messageLabel.text = "ошиблись больше, чем на десять"
                } else {
                    messageLabel.text = "ответ в пределах десяти"
                }
                
            }
            
        }
            
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        randomNumb = randomInt()
    }

    
    func randomInt() -> Int {
        return Int.random(in: 0...10000)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    

}



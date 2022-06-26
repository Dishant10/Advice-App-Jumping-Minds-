//
//  RandomViewController.swift
//  Advice App(JumpingMinds-Assessment)
//
//  Created by Dishant Nagpal on 26/06/22.
//

import UIKit

class RandomViewController: UIViewController {
    
    
    
    var newAdvice : String = ""
    var parser=RandomParser()
    
    
    @IBOutlet var textLabel: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        title = "Random Screen"
        
        
    }
    
    @IBAction func randomButton(_ sender: UIButton) {
        
        parser.performRequest { data in
            DispatchQueue.main.async {
                self.newAdvice = data.advice
                self.textLabel.text = self.newAdvice
            }
            
        }  
        
    }
    
    
}

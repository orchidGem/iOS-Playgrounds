//
//  ViewController.swift
//  localizationPlayground
//
//  Created by Laura Evans on 1/9/17.
//  Copyright © 2017 Laura Evans. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myVariable = "Laura"
        
        label1.text = NSLocalizedString("OK", comment: "")
        label2.text = NSLocalizedString("My name is \(myVariable)", comment: "")
        label3.text = NSLocalizedString("OK", comment: "")
        label4.text = NSLocalizedString("Cancel", comment: "")
        label5.text = NSLocalizedString("OK", comment: "Now I have a different comment")
        label6.text = NSLocalizedString("Awesome Test", comment: "")
    }


}


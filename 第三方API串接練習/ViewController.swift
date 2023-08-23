//
//  ViewController.swift
//  第三方API串接練習
//
//  Created by Hydee Chen on 2023/8/15.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


    @IBSegueAction func namePass(_ coder: NSCoder) -> drinksTableViewController? {
        let controller = drinksTableViewController(coder: coder)
        controller?.orderNamePass = nameLabel.text
        return controller
    }
    
}


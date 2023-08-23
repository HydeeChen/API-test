//
//  homePageViewController.swift
//  第三方API串接練習
//
//  Created by Hydee Chen on 2023/8/23.
//

import UIKit

class homePageViewController: UIViewController {
    //輸入訂購人姓名的textfield
    @IBOutlet weak var orderName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBSegueAction func orderNamePass(_ coder: NSCoder) -> drinksTableViewController? {
       let controller = drinksTableViewController(coder: coder)
        controller?.orderNamePass = orderName!.text
        return controller
        
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

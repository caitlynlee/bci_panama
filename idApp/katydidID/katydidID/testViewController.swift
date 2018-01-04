//
//  testViewController.swift
//  katydidID
//
//  Created by Caitlyn Lee on 1/3/18.
//  Copyright © 2018 Caitlyn Lee. All rights reserved.
//

import UIKit

class testViewController: UIViewController {

    @IBOutlet weak var resultsField: UITextView!
    
    var text: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultsField.text = text
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

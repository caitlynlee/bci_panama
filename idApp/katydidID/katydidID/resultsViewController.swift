//
//  resultsViewController.swift
//  katydidID
//
//  Created by Caitlyn Lee on 1/2/18.
//  Copyright © 2018 Caitlyn Lee. All rights reserved.
//

import UIKit

class resultsViewController: UIViewController {
    var intPassed = Int()
    var text: String = ""
    //MARK: Properties
    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
    }
    @IBOutlet weak var resultsLabel: UILabel!
    @IBAction func startOverButton(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultsLabel.text = text
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

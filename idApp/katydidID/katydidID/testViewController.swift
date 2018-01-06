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
    @IBAction func startOverButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let home = storyboard.instantiateViewController(withIdentifier: "homeScreen") as! homeViewController
        navigationController?.present(home, animated: true)
    }
    
    var text: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)

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

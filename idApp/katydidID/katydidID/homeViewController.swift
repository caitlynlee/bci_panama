//
//  homeViewController.swift
//  katydidID
//
//  Created by Caitlyn Lee on 1/3/18.
//  Copyright © 2018 Caitlyn Lee. All rights reserved.
//

import UIKit

class homeViewController: UIViewController {


    @IBOutlet weak var homeLabel: UILabel!
    @IBAction func getSpeciesButton(_ sender: Any) {
    }

    @IBOutlet weak var secondaryHomeLabel: UILabel!
    @IBAction func secondaryGetSpeciesButton(_ sender: Any) {
        let myVC = AttributeTableViewController(nibName: "AttributeTableViewController", bundle: nil)
        navigationController?.pushViewController(myVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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

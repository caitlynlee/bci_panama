//
//  specificKatydidViewController.swift
//  katydidID
//
//  Created by Caitlyn Lee on 1/4/18.
//  Copyright © 2018 Caitlyn Lee. All rights reserved.
//

import UIKit

class specificKatydidViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var info: UITextView!
    @IBOutlet weak var notes: UITextView!
    
    var katydid: Katydid?
    
    var nameText: String = ""
    var infoText: String = ""
    var notesText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if katydid != nil{
            nameText = katydid!.name
            infoText = "INFO:\n"
            for att in katydid!.attributes{
                infoText.append("\(att.name), ")
            }
            
            notesText = katydid!.notes
        }
        
        name.text = nameText
        info.text = infoText
        notes.text = notesText
        
        image.image = katydid?.image
        

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

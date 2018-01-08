//
//  specificKatydidViewController.swift
//  katydidID
//
//  Created by Caitlyn Lee on 1/4/18.
//  Copyright © 2018 Caitlyn Lee. All rights reserved.
//

import UIKit
import os.log

class specificKatydidViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var info: UITextView!
    @IBOutlet weak var notes: UITextView!
    @IBOutlet weak var addNote: UIButton!
    
    @IBAction func addNote(_ sender: Any) {
        let myVC = addNoteViewController(nibName: "addNoteViewController", bundle: nil)
        myVC.katydids = katydids
        myVC.index = index
        navigationController?.pushViewController(myVC, animated: true)
    }
    
    var index = Int()
    var katydids = [Katydid]()
    var katydid: Katydid?
    
    var nameText: String = ""
    var infoText: String = ""
    var notesText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //saveKatydids()
        // navigationController?.setNavigationBarHidden(true, animated: true)
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        katydids = loadKatydids()!
        
        katydid = katydids[index]
        nameText = katydid!.name
        infoText = "INFO:\n"
        for att in katydid!.attributes{
            infoText.append("\(att.name), ")
            
            notesText = katydid!.notes
        }
        
        name.text = nameText
        info.text = infoText
        notes.text = notesText
        
        image.image = katydid?.image
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func saveKatydids() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(katydids, toFile: Katydid.ArchiveURL.path)
        if isSuccessfulSave {
            os_log("successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save meals...", log: OSLog.default, type: .error)
        }
    }

    private func loadKatydids() -> [Katydid]?  {
        print("loading")
        return NSKeyedUnarchiver.unarchiveObject(withFile: Katydid.ArchiveURL.path) as? [Katydid]
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

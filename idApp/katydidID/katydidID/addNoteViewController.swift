//
//  addNoteViewController.swift
//  katydidID
//
//  Created by Caitlyn Lee on 1/6/18.
//  Copyright © 2018 Caitlyn Lee. All rights reserved.
//

import UIKit
import os.log

class addNoteViewController: UIViewController {

    @IBOutlet weak var newNote: UITextView!
    @IBAction func cancelButton(_ sender: Any) {
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.popViewController(animated: true)
    }
    @IBAction func saveButton(_ sender: Any) {
        katydids[index].notes = newNote.text!
        saveKatydids(list: katydids)

        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.popViewController(animated: true)
        
    }
    var index = Int()
    var katydids = [Katydid]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        newNote.text = katydids[index].notes

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func saveKatydids(list: [Katydid]) {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(list, toFile: Katydid.ArchiveURL.path)
        if isSuccessfulSave {
            os_log("successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save meals...", log: OSLog.default, type: .error)
        }
    }
    
    /*
    private func loadKatydids() -> [Katydid]{
        return NSKeyedUnarchiver.unarchiveObject(withFile: Katydid.ArchiveURL.path) as! [Katydid]
    }
     */

}

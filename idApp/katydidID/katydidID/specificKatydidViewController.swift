//
//  specificKatydidViewController.swift
//  katydidID
//
//  Created by Caitlyn Lee on 1/4/18.
//  Copyright © 2018 Caitlyn Lee. All rights reserved.
//

import UIKit
import os.log

class specificKatydidViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var info: UITextView!
    @IBOutlet weak var notes: UITextView!
    @IBOutlet weak var addNote: UIButton!
    //@IBOutlet weak var image: UIImageView!
  
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
    
    var image = UIImageView(frame: CGRect(x: 0, y:0, width: 287, height: 240))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //saveKatydids()
        navigationController?.setNavigationBarHidden(false, animated: true)
        // Do any additional setup after loading the view.
        
        var scrollImg: UIScrollView!
        
        scrollImg = UIScrollView(frame: CGRect(x: 44, y:145, width: 287, height: 240))
        scrollImg.contentSize = CGSize(width: 287, height: 240)
        scrollImg.delegate = self
        scrollImg.alwaysBounceVertical = false
        scrollImg.alwaysBounceHorizontal = false
        scrollImg.showsVerticalScrollIndicator = true
        scrollImg.flashScrollIndicators()
        
        
        scrollImg.minimumZoomScale = 1.0
        scrollImg.maximumZoomScale = 10.0
        
        view.addSubview(scrollImg)
        
        image.clipsToBounds = false
        scrollImg.addSubview(image)
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return image
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
        image.image = katydid!.image
        
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
        print("loaded")
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

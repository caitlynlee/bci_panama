//
//  categoryViewController.swift
//  katydidID
//
//  Created by Caitlyn Lee on 1/15/18.
//  Copyright © 2018 Caitlyn Lee. All rights reserved.
//

import UIKit

class categoryViewController: UIViewController {

    var categories = ["Face", "Eyes", "Pronotum", "Body", "Legs", "Color", "Size"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let screensize: CGRect = UIScreen.main.bounds
        let screenWidth = screensize.width
        //let screenHeight = screensize.height
        
        var count = 2
        for category in categories{
            let topHeight = CGFloat(count*80)
            let b = UIButton(frame: CGRect(x:0, y: topHeight, width: screenWidth, height: 60))
            
            let buttonTitle = "\(category)"
            
            b.setTitle(buttonTitle, for: .normal)
            b.setTitleColor(view.tintColor , for: .normal)
            b.titleLabel!.font = UIFont(name: "Helvetica", size: 18)
            b.contentHorizontalAlignment = .center
            b.backgroundColor = .clear
            //b.layer.borderWidth = 1
            //b.layer.borderColor = UIColor.black.cgColor
            
            //b.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            //b.katydid = katydid
            
            //scrollView.addSubview(num)
            //scrollView.addSubview(b)
            
            view.addSubview(b)
            
            count += 1
            
        }
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

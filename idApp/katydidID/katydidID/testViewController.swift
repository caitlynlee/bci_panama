//
//  testViewController.swift
//  katydidID
//
//  Created by Caitlyn Lee on 1/3/18.
//  Copyright © 2018 Caitlyn Lee. All rights reserved.
//

import UIKit

class testViewController: UIViewController {
    //@IBOutlet weak var resultsField: UITextView!
    @IBAction func startOverButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let home = storyboard.instantiateViewController(withIdentifier: "homeScreen") as! homeViewController
        navigationController?.present(home, animated: true)
    }
    @IBOutlet weak var startOver: UIButton!
    
    
    //var text: String = ""
    var katydids = [Katydid]()
    
    private func makeButtons(view: UIView){
        let screensize: CGRect = UIScreen.main.bounds
        let screenWidth = screensize.width
        let screenHeight = screensize.height
        let scrollView: UIScrollView!
        scrollView = UIScrollView(frame: CGRect(x: screenWidth*0.05, y: 20, width: screenWidth*0.95, height: screenHeight))
        view.addSubview(scrollView)

        scrollView.contentSize = CGSize(width: screenWidth*0.95, height: 3000)
        
        var count = 1
        for katydid in katydids{
            let topHeight = CGFloat((count+1)*40)
            let b = resultButton(frame: CGRect(x:25, y: topHeight, width: screenWidth*0.8, height: 30))
            let num = UILabel(frame: CGRect(x:0, y: topHeight, width: 20, height: 30))
            
            num.text = "\(count): "
            num.textColor = .black
            num.font = UIFont(name: "Helvetica", size: 14)
            num.textAlignment = .right
            
            let buttonTitle = "\(katydid.name)"

            b.setTitle(buttonTitle, for: .normal)
            b.setTitleColor(view.tintColor , for: .normal)
            b.titleLabel!.font = UIFont(name: "Helvetica", size: 14)
            b.contentHorizontalAlignment = .left
            //b.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            b.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            b.katydid = katydid
            
            scrollView.addSubview(num)
            scrollView.addSubview(b)
            
            count += 1
        }
        scrollView.addSubview(startOver)
    }
    
    @objc func buttonAction(sender: resultButton){
        print("clicked \(sender.katydid!.name)")
        let myVC = specificKatydidViewController(nibName: "specificKatydidViewController", bundle: nil)
        print (sender.katydid!.index)
        myVC.index = sender.katydid!.index
        navigationController?.pushViewController(myVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        makeButtons(view: self.view)
        
        //scrollView.addSubview(resultsField)
        
        

        //resultsField.text = text
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

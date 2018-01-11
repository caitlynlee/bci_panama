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
        scrollView = UIScrollView(frame: CGRect(x: screenWidth*0.05, y: screenHeight*0.14, width: screenWidth*0.95, height: screenHeight*0.75))
        view.addSubview(scrollView)

        scrollView.contentSize = CGSize(width: screenWidth*0.95, height: CGFloat((katydids.count)*40))
        
        let title = UILabel(frame: CGRect(x: 0, y:screenHeight*0.08, width: screenWidth, height: 25))
        title.text = "RESULTS: (from most to least likely)"
        title.textColor = .black
        title.font = UIFont.boldSystemFont(ofSize: 14)
        title.textAlignment = .center

        view.addSubview(title)
        
        var count = 0
        for katydid in katydids{
            let topHeight = CGFloat(count*40)
            let b = resultButton(frame: CGRect(x:25, y: topHeight, width: screenWidth*0.8, height: 30))
            let num = UILabel(frame: CGRect(x:0, y: topHeight, width: 20, height: 30))
            
            num.text = "\(count+1): "
            num.textColor = .black
            num.font = UIFont(name: "Helvetica", size: 14)
            num.textAlignment = .right
            
            let buttonTitle = "\(katydid.name)"

            b.setTitle(buttonTitle, for: .normal)
            b.setTitleColor(view.tintColor , for: .normal)
            b.titleLabel!.font = UIFont(name: "Helvetica", size: 14)
            b.contentHorizontalAlignment = .left
            b.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            b.katydid = katydid
            
            scrollView.addSubview(num)
            scrollView.addSubview(b)
            
            count += 1
        }
        startOver.frame = CGRect(x: 0, y: screenHeight*0.92, width: screenWidth, height: 30)
        view.addSubview(startOver)
    }
    
    @objc func buttonAction(sender: resultButton){
        print("clicked \(sender.katydid!.name)")
        let myVC = specificKatydidViewController(nibName: "specificKatydidViewController", bundle: nil)
        print (sender.katydid!.index)
        myVC.index = sender.katydid!.index
        navigationController?.pushViewController(myVC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeButtons(view: self.view)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

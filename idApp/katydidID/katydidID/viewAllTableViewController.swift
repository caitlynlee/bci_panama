//
//  viewAllTableViewController.swift
//  katydidID
//
//  Created by Caitlyn Lee on 1/4/18.
//  Copyright © 2018 Caitlyn Lee. All rights reserved.
//

import UIKit

class viewAllTableViewController: UITableViewController {
    var katydids = [Katydid]()
    
    @IBAction func backButton(_ sender: Any) {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadKatydids()
    }
    override func viewDidLoad() {
        super.viewDidLoad()        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return katydids.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "katydidCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier , for: indexPath) as? viewAllTableViewCell else {
            fatalError("The cell is not an instance of TableViewCell")
        }
        
        let katydid = katydids[indexPath.row]
        
        cell.katydidNameLabel.text = katydid.name
        cell.katydidImage.image = katydid.image
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let myVC = specificKatydidViewController(nibName: "specificKatydidViewController", bundle: nil)
        myVC.index = indexPath.row
        navigationController?.pushViewController(myVC, animated: true)
    }

    private func loadKatydids(){
        print("loading newest")
        katydids = NSKeyedUnarchiver.unarchiveObject(withFile: Katydid.ArchiveURL.path) as! [Katydid]
    }
    
}

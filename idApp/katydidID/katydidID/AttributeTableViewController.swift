//
//  AttributeTableViewController.swift
//  katydidID
//
//  Created by Caitlyn Lee on 1/2/18.
//  Copyright © 2018 Caitlyn Lee. All rights reserved.
//

import UIKit

class AttributeTableViewController: UITableViewController {
    var attributes = [Attribute]()
    var dict = [String: [Attribute]] ()
    var choices = [Attribute]()
    var categories = [String]()
    var katydids = [Katydid]()
    
    // MARK: Properties

    @IBAction func backButton(_ sender: Any) {
    }
    @IBAction func goButton(_ sender: Any) {
        var count = 1
        //After clicking "GO", do the actual sorting
        //let sorted = sortKatydids(traits: choices)
        
        sortKatydids(traits: choices)
        
        let myVC = testViewController(nibName: "testViewController", bundle: nil)
        myVC.text = "KATYDIDS: (from most to least likely)\n\n"
        
        for k in katydids{
            myVC.text.append("\(count). \(k.name)\n\n")
            count += 1
        }
    
        navigationController?.show(myVC, sender: Any.self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Categories of attributes
        categories = ["Face", "Eyes", "Pronotum", "Body", "Legs", "Color", "Size"]
 
        // load things
        loadAttributes()
        loadKatydids()
        
        self.tableView.allowsMultipleSelection = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return categories[section]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let categoryAtt = dict[categories[section]]
        return (categoryAtt?.count)!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let att = attributes[indexPath.row]
        let feature = dict[categories[indexPath.section]]?[indexPath.row]
        choices.append(feature!)
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        //let att = attributes[indexPath.row]
        let feature = dict[categories[indexPath.section]]?[indexPath.row]
        var count = 0
        
        for choice in choices{
            if choice.name == feature?.name{
                choices.remove(at: count)
            }
            count += 1
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "attributeCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier , for: indexPath) as? AttributeTableViewCell else {
            fatalError("The cell is not an instance of AttributeTableViewCell")
        }
        
        let feature = dict[categories[indexPath.section]]?[indexPath.row]
        
        cell.attributeLabel.text = feature?.name
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: Private methods
    private func loadAttributes() {
        attributes =  NSKeyedUnarchiver.unarchiveObject(withFile: Attribute.ArchiveURL.path) as! [Attribute]
        
        for category in categories{
            dict[category] = []
        }
        
        for att in attributes{
            dict[att.category]?.append(att)
        }
        
    }
    
    private func loadKatydids(){
        katydids = NSKeyedUnarchiver.unarchiveObject(withFile: Katydid.ArchiveURL.path) as! [Katydid]
    }
    
    
    private func sortKatydids(traits: [Attribute]){
        for katydid in katydids{
            katydid.getScore(given: traits)
        }
    
        katydids.sort(by: sortByScore)
    }
    
    private func sortByScore(this: Katydid, that: Katydid)-> Bool {
        return this.score > that.score
    }
    
}

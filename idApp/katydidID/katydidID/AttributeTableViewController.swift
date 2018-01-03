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
    var testNum = Int()
    // MARK: Properties

    @IBAction func goButton(_ sender: UIBarButtonItem) {
        let myVC = storyboard?.instantiateViewController(withIdentifier: "resultsViewController") as! resultsViewController
        testNum = addRand(x: 10)
        myVC.intPassed = 11
    }
    
    
    
    //sections: Face, eyes, pronotum, body, legs, color, size
    
    //let numberOfRowsAtSection: [Int] = [9, 4, 5, 19, 6, 3, 3]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // load the attributes
        loadAttributes()
        
        self.tableView.allowsMultipleSelection = true   

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        
        return attributes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "attributeCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier , for: indexPath) as? AttributeTableViewCell else {
            fatalError("The cell is not an instance of AttributeTableViewCell")
        }

        let attribute = attributes[indexPath.row]
        
        cell.attributeLabel.text = attribute.name

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
    
    private func loadAttributes(){
        guard let attrib1 = Attribute(name: "Green legs", category: "Legs") else{
            fatalError("failed")
        }
        guard let attrib2 = Attribute(name: "Green and silver columns", category: "Body") else{
            fatalError("failed")
        }
        guard let attrib3 = Attribute(name: "Small", category: "Size") else{
            fatalError("failed")
        }
        guard let attrib4 = Attribute(name: "Yellowish", category: "Color") else{
            fatalError("failed")
        }
        guard let attrib5 = Attribute(name: "Green", category: "Color") else{
            fatalError("failed")
        }
        guard let attrib6 = Attribute(name: "Flat face", category: "Face") else{
            fatalError("failed")
        }
        guard let attrib7 = Attribute(name: "Large", category: "Size") else{
            fatalError("failed")
        }
        guard let attrib8 = Attribute(name: "Blue eyes", category: "Eyes") else{
            fatalError("failed")
        }
        guard let attrib10 = Attribute(name: "Goat eyes", category: "Eyes") else{
            fatalError("failed")
        }
        guard let attrib11 = Attribute(name: "Brown", category: "Color") else{
            fatalError("failed")
        }
        guard let attrib12 = Attribute(name: "Dark patch on wings", category: "Body") else{
            fatalError("failed")
        }
        guard let attrib13 = Attribute(name: "Red hind legs", category: "Legs") else{
            fatalError("failed")
        }
        guard let attrib14 = Attribute(name: "Yellow lines", category: "Pronotum") else{
            fatalError("failed")
        }
        guard let attrib15 = Attribute(name: "Medium", category: "Size") else{
            fatalError("failed")
        }
        guard let attrib16 = Attribute(name: "Saddle", category: "Pronotum") else{
            fatalError("failed")
        }
        guard let attrib17 = Attribute(name: "Tan, green wing veins", category: "Body") else{
            fatalError("failed")
        }
        guard let attrib18 = Attribute(name: "Face stripes", category: "Face") else{
            fatalError("failed")
        }
        guard let attrib19 = Attribute(name: "Long ovipositor", category: "Body") else{
            fatalError("failed")
        }
        guard let attrib20 = Attribute(name: "Blue face", category: "Face") else{
            fatalError("failed")
        }
        guard let attrib21 = Attribute(name: "Sharp top and under wing angle", category: "Body") else{
            fatalError("failed")
        }
        guard let attrib22 = Attribute(name: "White and purple stripes", category: "Body") else{
            fatalError("failed")
        }
        guard let attrib23 = Attribute(name: "Red and yellow patches (underside)", category: "Body") else{
            fatalError("failed")
        }
        guard let attrib24 = Attribute(name: "Blue mouth parts", category: "Body") else{
            fatalError("failed")
        }
        guard let attrib25 = Attribute(name: "Green eyes", category: "Eyes") else{
            fatalError("failed")
        }
        guard let attrib26 = Attribute(name: "Brown top with neon sides", category: "Pronotum") else{
            fatalError("failed")
        }
        guard let attrib27 = Attribute(name: "Reddish", category: "Face") else{
            fatalError("failed")
        }
        guard let attrib28 = Attribute(name: "Back half of legs black", category: "Legs") else{
            fatalError("failed")
        }
        guard let attrib29 = Attribute(name: "Black and blue stripes", category: "Body") else{
            fatalError("failed")
        }
        guard let attrib30 = Attribute(name: "White spots", category: "Face") else{
            fatalError("failed")
        }
        guard let attrib31 = Attribute(name: "Black knees", category: "Body") else{
            fatalError("failed")
        }
        guard let attrib32 = Attribute(name: "Three brown spots", category: "Body") else{
            fatalError("failed")
        }
        guard let attrib33 = Attribute(name: "Yellow head", category: "Face") else{
            fatalError("failed")
        }
        guard let attrib34 = Attribute(name: "Eye makeup", category: "Eyes") else{
            fatalError("failed")
        }
        guard let attrib35 = Attribute(name: "Black dot", category: "Pronotum") else{
            fatalError("failed")
        }
        guard let attrib36 = Attribute(name: "Red ovipositor", category: "Body") else{
            fatalError("failed")
        }
        guard let attrib37 = Attribute(name: "Black stripe on face through eye", category: "Face") else{
            fatalError("failed")
        }
        guard let attrib38 = Attribute(name: "'E' on knee joint", category: "Body") else{
            fatalError("failed")
        }
        guard let attrib39 = Attribute(name: "Red mouth parts", category: "Body") else{
            fatalError("failed")
        }
        guard let attrib40 = Attribute(name: "Tan leaf shaped", category: "Body") else{
            fatalError("failed")
        }
        guard let attrib41 = Attribute(name: "White face stripe", category: "Face") else{
            fatalError("failed")
        }
        guard let attrib42 = Attribute(name: "Yellow face stripe", category: "Face") else{
            fatalError("failed")
        }
        guard let attrib43 = Attribute(name: "Pink legs", category: "Legs") else{
            fatalError("failed")
        }
        guard let attrib44 = Attribute(name: "Banded pink legs", category: "Legs") else{
            fatalError("failed")
        }
        guard let attrib45 = Attribute(name: "Clear legs", category: "Legs") else{
            fatalError("failed")
        }
        guard let attrib46 = Attribute(name: "Mottled green and brown", category: "Body") else{
            fatalError("failed")
        }
        guard let attrib47 = Attribute(name: "Two hearts", category: "Pronotum") else{
            fatalError("failed")
        }
        guard let attrib48 = Attribute(name: "Red tipped spines", category: "Body") else{
            fatalError("failed")
        }
        guard let attrib49 = Attribute(name: "Translucent", category: "Body") else{
            fatalError("failed")
        }
        guard let attrib50 = Attribute(name: "Deer poop", category: "Body") else{
            fatalError("failed")
        }
        
        attributes += [attrib1, attrib2, attrib3, attrib4, attrib5, attrib6, attrib7, attrib8, attrib10, attrib11, attrib12, attrib13, attrib14, attrib15, attrib16, attrib17, attrib18, attrib19, attrib20, attrib21, attrib22, attrib23, attrib24, attrib25, attrib26, attrib27, attrib28, attrib29, attrib30, attrib31, attrib32, attrib33, attrib34, attrib35, attrib36, attrib37, attrib38, attrib39, attrib40, attrib41, attrib42, attrib43, attrib44, attrib45, attrib46, attrib47, attrib48, attrib49, attrib50]
        
    }
    
    private func addRand(x: Int) -> Int{
        return x + 1
    }
    
}

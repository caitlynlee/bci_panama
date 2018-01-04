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
        
        navigationController?.pushViewController(myVC, animated: true)
    }

    //sections: Face, eyes, pronotum, body, legs, color, size
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Categories of attributes
        categories = ["Face", "Eyes", "Pronotum", "Body", "Legs", "Color", "Size"]
 
        // load things
        loadAttributes()
        loadKatydids()
        
        self.tableView.allowsMultipleSelection = true   

        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false

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
        guard let attrib9 = Attribute(name: "Spiny", category: "Body") else{
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
        guard let attrib49 = Attribute(name: "Leaf veins", category: "Body") else{
            fatalError("failed")
        }
        guard let attrib50 = Attribute(name: "Deer poop", category: "Body") else{
            fatalError("failed")
        }
        guard let attrib51 = Attribute(name: "No cerci", category: "Body") else{
            fatalError("failed")
        }
        guard let attrib52 = Attribute(name: "Long cerci", category: "Body") else{
            fatalError("failed")
        }
        guard let attrib53 = Attribute(name: "Translucent", category: "Color") else{
            fatalError("failed")
        }
        guard let attrib54 = Attribute(name: "Green cerci", category: "Body") else{
            fatalError("failed")
        }
        guard let attrib55 = Attribute(name: "Reddish cerci", category: "Body") else{
            fatalError("failed")
        }
        guard let attrib56 = Attribute(name: "Long and skinny", category: "Body") else{
            fatalError("failed")
        }
        guard let attrib57 = Attribute(name: "Dark purplish", category: "Color") else{
            fatalError("failed")
        }
        guard let attrib58 = Attribute(name: "Cigar shaped", category: "Body") else{
            fatalError("failed")
        }
        guard let attrib59 = Attribute(name: "Black bands on legs", category: "Legs") else{
            fatalError("failed")
        }
        guard let attrib60 = Attribute(name: "All neon", category: "Pronotum") else{
            fatalError("failed")
        }
        guard let attrib61 = Attribute(name: "White stripe behind eye", category: "Eyes") else{
            fatalError("failed")
        }
        guard let attrib62 = Attribute(name: "Yellow tipped spines", category: "Body") else{
            fatalError("failed")
        }
        guard let attrib63 = Attribute(name: "Yellow stripes", category: "Pronotum") else{
            fatalError("failed")
        }
        
        attributes += [attrib1, attrib2, attrib3, attrib4, attrib5, attrib6, attrib7, attrib8, attrib9, attrib10, attrib11, attrib12, attrib13, attrib14, attrib15, attrib16, attrib17, attrib18, attrib19, attrib20, attrib21, attrib22, attrib23, attrib24, attrib25, attrib26, attrib27, attrib28, attrib29, attrib30, attrib31, attrib32, attrib33, attrib34, attrib35, attrib36, attrib37, attrib38, attrib39, attrib40, attrib41, attrib42, attrib43, attrib44, attrib45, attrib46, attrib47, attrib48, attrib49, attrib50, attrib51, attrib52, attrib53, attrib54, attrib55, attrib56, attrib57, attrib58, attrib59, attrib60, attrib61, attrib62, attrib63]
        
        for category in categories{
            dict[category] = []
        }
        
        for att in attributes{
            dict[att.category]?.append(att)
        }
        
    }
    
    private func loadKatydids(){
        guard let k1 = Katydid(name: "Acanthodis curvidens", attributes: [attributes[6], attributes[8]], rarity: -2)else{
            fatalError("failed")
        }
        guard let k2 = Katydid(name: "Aegimia sp1", attributes: [attributes[0]], rarity: -1)else{
            fatalError("failed")
        }
        guard let k3 = Katydid(name: "Agracia festae", attributes: [attributes[2], attributes[3], attributes[4], attributes[5]], rarity: 0)else{
            fatalError("failed")
        }
        guard let k4 = Katydid(name: "Anapolisia colosseum", attributes: [attributes[1]], rarity: 1)else{
            fatalError("failed")
        }
        guard let k5 = Katydid(name: "Anaulacomera bronco", attributes: [attributes[6], attributes[4], attributes[7]], rarity: -1)else{
            fatalError("failed")
        }
        guard let k6 = Katydid(name: "Anaulacomera darwinii", attributes: [attributes[2], attributes[4], attributes[50]], rarity: 1)else{
            fatalError("failed")
        }
        guard let k7 = Katydid(name: "Anaulacomera furcata", attributes: [attributes[2], attributes[4], attributes[51]], rarity: 2)else{
            fatalError("failed")
        }
        guard let k8 = Katydid(name: "Anaulacomera goat", attributes: [attributes[2], attributes[4], attributes[9]], rarity: 0)else{
            fatalError("failed")
        }
        guard let k9 = Katydid(name: "Arota festae", attributes: [attributes[3], attributes[4], attributes[14]], rarity: 1)else{
            fatalError("failed")
        }
        guard let k10 = Katydid(name: "Arota panamae", attributes: [attributes[3], attributes[4], attributes[14], attributes[52]], rarity: 1)else{
            fatalError("failed")
        }
        guard let k11 = Katydid(name: "Eppia truncatipennis", attributes: [attributes[5]], rarity: -2)else{
            fatalError("failed")
        }
        guard let k12 = Katydid(name: "Balboana tibialis", attributes: [attributes[6], attributes[10], attributes[11], attributes[53]], rarity: -1)else{
            fatalError("failed")
        }
        guard let k13 = Katydid(name: "Bliastes punctifronis", attributes: [attributes[3]], rarity: -2)else{
            fatalError("failed")
        }
        guard let k14 = Katydid(name: "Bucrates capitatus", attributes: [attributes[5], attributes[4]], rarity: -2)else{
            fatalError("failed")
        }
        guard let k15 = Katydid(name: "Caulopsis spp", attributes: [attributes[55], attributes[5]], rarity: -1)else{
            fatalError("failed")
        }
        guard let k16 = Katydid(name: "Ceraia panamensis", attributes: [attributes[12], attributes[54], attributes[56]], rarity: -1)else{
            fatalError("failed")
        }
        guard let k17 = Katydid(name: "Ceraia tibialoides", attributes: [attributes[56]], rarity: -2)else{
            fatalError("failed")
        }
        guard let k18 = Katydid(name: "Chloroscirtus discocercus", attributes: [attributes[14], attributes[4], attributes[13]], rarity: 1)else{
            fatalError("failed")
        }
        guard let k19 = Katydid(name: "Cnemidophyllum eximium", attributes: [attributes[6], attributes[4], attributes[58]], rarity: -2)else{
            fatalError("failed")
        }
        guard let k20 = Katydid(name: "Coconotus wheeleri", attributes: [attributes[57], attributes[16], attributes[17]], rarity: 0)else{
            fatalError("failed")
        }
        guard let k21 = Katydid(name: "Copiphora brevirostris", attributes: [attributes[6], attributes[4], attributes[5], attributes[18]], rarity: 0)else{
            fatalError("failed")
        }
        guard let k22 = Katydid(name: "Docidocercus gigliotosi", attributes: [attributes[19], attributes[57]], rarity: 0)else{
            fatalError("failed")
        }
        guard let k23 = Katydid(name: "Dolichocercus latipennis", attributes: [attributes[2], attributes[10], attributes[20]], rarity: 1)else{
            fatalError("failed")
        }
        guard let k24 = Katydid(name: "Ectemna dumicola", attributes: [attributes[15], attributes[4], attributes[21]], rarity: 0)else{
            fatalError("failed")
        }
        guard let k25 = Katydid(name: "Erioloides longinoi", attributes: [attributes[22], attributes[23]], rarity: 0)else{
            fatalError("failed")
        }
        guard let k26 = Katydid(name: "Eubliastes pollonerae", attributes: [attributes[57], attributes[24]], rarity: -1)else{
            fatalError("failed")
        }
        guard let k27 = Katydid(name: "Euceraia atrix", attributes: [attributes[25]], rarity: 1)else{
            fatalError("failed")
        }
        guard let k28 = Katydid(name: "Euceraia insignis", attributes: [attributes[59], attributes[27], attributes[26]], rarity: 1)else{
            fatalError("failed")
        }
        guard let k29 = Katydid(name: "Hyperphorna irregularis", attributes: [attributes[28], attributes[4]], rarity: 1)else{
            fatalError("failed")
        }
        guard let k30 = Katydid(name: "Idiarthron spp.", attributes: [attributes[6], attributes[10], attributes[57]], rarity: -1)else{
            fatalError("failed")
        }
        guard let k31 = Katydid(name: "Ischnomela gracilis", attributes: [attributes[55], attributes[57], attributes[29], attributes[30]], rarity: -1)else{
            fatalError("failed")
        }
        guard let k32 = Katydid(name: "Itarissa costaricensis", attributes: [attributes[31]], rarity: 0)else{
            fatalError("failed")
        }
        guard let k33 = Katydid(name: "Itarissa sunrise", attributes: [attributes[32]], rarity: 0)else{
            fatalError("failed")
        }
        guard let k34 = Katydid(name: "Lamprophyllum bugabae", attributes: [attributes[6], attributes[4], attributes[33]], rarity: 1)else{
            fatalError("failed")
        }
        guard let k35 = Katydid(name: "Lamprophyllum micans", attributes: [attributes[14], attributes[34]], rarity: 1)else{
            fatalError("failed")
        }
        guard let k36 = Katydid(name: "Microcentrum sp1", attributes: [attributes[14], attributes[6], attributes[4]], rarity: 0)else{
            fatalError("failed")
        }
        guard let k37 = Katydid(name: "Microcentrum dino", attributes: [attributes[4]], rarity: 1)else{
            fatalError("failed")
        }
        guard let k38 = Katydid(name: "Microcentrum polka", attributes: [attributes[14], attributes[6], attributes[4]], rarity: 1)else{
            fatalError("failed")
        }
        guard let k39 = Katydid(name: "Montezumina bradleyi bradleyi", attributes: [attributes[2], attributes[4], attributes[35], attributes[36], attributes[37]], rarity: 1)else{
            fatalError("failed")
        }
        guard let k40 = Katydid(name: "Neoconocephalus affins", attributes: [attributes[4], attributes[10], attributes[38]], rarity: -1)else{
            fatalError("failed")
        }
        guard let k41 = Katydid(name: "Orophus conspersus", attributes: [attributes[14], attributes[10]], rarity: 1)else{
            fatalError("failed")
        }
        guard let k42 = Katydid(name: "Philophyllia guttulata", attributes: [attributes[6], attributes[4], attributes[40]], rarity: -1)else{
            fatalError("failed")
        }
        guard let k43 = Katydid(name: "Philophyllia ingens", attributes: [attributes[6], attributes[4], attributes[41]], rarity: 0)else{
            fatalError("failed")
        }
        guard let k44 = Katydid(name: "Phlugis sp", attributes: [attributes[8], attributes[2]], rarity: -2)else{
            fatalError("failed")
        }
        guard let k45 = Katydid(name: "Phylloptera dimidiata", attributes: [attributes[42], attributes[34]], rarity: 1)else{
            fatalError("failed")
        }
        guard let k46 = Katydid(name: "Phylloptera quinquemaculata", attributes: [attributes[34], attributes[3], attributes[43]], rarity: 0)else{
            fatalError("failed")
        }
        guard let k47 = Katydid(name: "Pristonotus sp", attributes: [attributes[6], attributes[10], attributes[57], attributes[41]], rarity: -1)else{
            fatalError("failed")
        }
        guard let k48 = Katydid(name: "Pycnopalpa bicordata", attributes: [attributes[2], attributes[44], attributes[45], attributes[46]], rarity: 0)else{
            fatalError("failed")
        }
        guard let k49 = Katydid(name: "Pycnopalpa sincordata", attributes: [attributes[2], attributes[44], attributes[45]], rarity: 0)else{
            fatalError("failed")
        }
        guard let k50 = Katydid(name: "Scopiorinus fragilis", attributes: [attributes[2], attributes[4], attributes[57]], rarity: -1)else{
            fatalError("failed")
        }
        guard let k51 = Katydid(name: "Steirodon careovirgulatum", attributes: [attributes[6], attributes[4], attributes[47]], rarity: 0)else{
            fatalError("failed")
        }
        guard let k52 = Katydid(name: "Steirodon robertsorum", attributes: [attributes[4], attributes[6], attributes[60]], rarity: -2)else{
            fatalError("failed")
        }
        guard let k53 = Katydid(name: "Steirodon sandrae", attributes: [attributes[4], attributes[6], attributes[60]], rarity: -2)else{
            fatalError("failed")
        }
        guard let k54 = Katydid(name: "Steirodon stalii", attributes: [attributes[6], attributes[4], attributes[61]], rarity: 0)else{
            fatalError("failed")
        }
        guard let k55 = Katydid(name: "Subria sylvestris", attributes: [attributes[10], attributes[4], attributes[52]], rarity: 0)else{
            fatalError("failed")
        }
        guard let k56 = Katydid(name: "Baliophyllum", attributes: [attributes[2], attributes[10], attributes[57], attributes[49]], rarity: 2)else{
            fatalError("failed")
        }
        guard let k57 = Katydid(name: "Viadana zetterstedti", attributes: [attributes[24], attributes[62]], rarity: 1)else{
            fatalError("failed")
        }
        guard let k58 = Katydid(name: "Waxy katydid", attributes: [attributes[2], attributes[4]], rarity: 1) else{
            fatalError("failed")
        }
        
        katydids += [k1, k2, k3, k4, k4, k5, k6, k7, k8, k9, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k20, k21, k22, k23, k24, k25, k26, k27, k28, k29, k30, k31, k32, k33, k34, k35, k36, k37, k38, k39, k40, k41, k42, k43, k44, k45, k46, k47, k48, k49, k50, k51, k52, k53, k54, k55, k56, k57, k58]

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

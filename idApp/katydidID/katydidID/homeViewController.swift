//
//  homeViewController.swift
//  katydidID
//
//  Created by Caitlyn Lee on 1/4/18.
//  Copyright © 2018 Caitlyn Lee. All rights reserved.
//

import UIKit

class homeViewController: UIViewController {

    @IBOutlet weak var homeLabel: UILabel!

    @IBOutlet weak var getSpeciesButton: UIButton!
    //var attributes = [Attribute]()
    //var katydids = [Katydid]()
    
    var katydids = [Katydid]()
    var attributes = [Attribute]()
    
    var loadedKatydids = [Katydid]()
    var loadedAttributes = [Attribute]()
    
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        if let attributesLOAD = loadAttributes(){
            print("loaded att")
            loadedAttributes = attributesLOAD
        }
        else{
            saveAttributes()
        }
        
        if let katydidsLOAD = loadKatydids(){
            print("loaded katydids")
            loadedKatydids = katydidsLOAD
        }
        else{
            saveKatydids()
        }
        */
        //saveAttributes()
        //saveKatydids()
    
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

    private func saveAttributes(){
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
        
        NSKeyedArchiver.archiveRootObject(attributes, toFile: Attribute.ArchiveURL.path)
    }
    
    private func saveKatydids(){
        guard let k1 = Katydid(name: "Acanthodis curvidens", attributes: [attributes[6], attributes[8]], index: 0, rarity: -2)else{
            fatalError("failed")
        }
        guard let k2 = Katydid(name: "Aegimia sp1", attributes: [attributes[0]], index: 1, rarity: -1)else{
            fatalError("failed")
        }
        guard let k3 = Katydid(name: "Agracia festae", attributes: [attributes[2], attributes[3], attributes[4], attributes[5]], index: 2, rarity: 0)else{
            fatalError("failed")
        }
        guard let k4 = Katydid(name: "Anapolisia colosseum", attributes: [attributes[1]], index: 3, rarity: 1)else{
            fatalError("failed")
        }
        guard let k5 = Katydid(name: "Anaulacomera bronco", attributes: [attributes[6], attributes[4], attributes[7]], index: 4, rarity: -1)else{
            fatalError("failed")
        }
        guard let k6 = Katydid(name: "Anaulacomera darwinii", attributes: [attributes[2], attributes[4], attributes[50]], index: 5, rarity: 1)else{
            fatalError("failed")
        }
        guard let k7 = Katydid(name: "Anaulacomera furcata", attributes: [attributes[2], attributes[4], attributes[51]], index: 6, rarity: 2)else{
            fatalError("failed")
        }
        guard let k8 = Katydid(name: "Anaulacomera goat", attributes: [attributes[2], attributes[4], attributes[9]], index: 7, rarity: 0)else{
            fatalError("failed")
        }
        guard let k9 = Katydid(name: "Arota festae", attributes: [attributes[3], attributes[4], attributes[14]], index: 8, rarity: 1)else{
            fatalError("failed")
        }
        guard let k10 = Katydid(name: "Arota panamae", attributes: [attributes[3], attributes[4], attributes[14], attributes[52]], index: 9, rarity: 1)else{
            fatalError("failed")
        }
        guard let k11 = Katydid(name: "Eppia truncatipennis", attributes: [attributes[5]], index: 10, rarity: -2)else{
            fatalError("failed")
        }
        guard let k12 = Katydid(name: "Balboana tibialis", attributes: [attributes[6], attributes[10], attributes[11], attributes[53]], index: 11, rarity: -1)else{
            fatalError("failed")
        }
        guard let k13 = Katydid(name: "Bliastes punctifronis", attributes: [attributes[3]], index: 12, rarity: -2)else{
            fatalError("failed")
        }
        guard let k14 = Katydid(name: "Bucrates capitatus", attributes: [attributes[5], attributes[4]],index: 13,  rarity: -2)else{
            fatalError("failed")
        }
        guard let k15 = Katydid(name: "Caulopsis spp", attributes: [attributes[55], attributes[5]], index: 14, rarity: -1)else{
            fatalError("failed")
        }
        guard let k16 = Katydid(name: "Ceraia mytra", attributes: [attributes[12], attributes[54]], index: 15, rarity: 1)else{
            fatalError("failed")
        }
        guard let k17 = Katydid(name: "Ceraia panamensis", attributes: [attributes[12], attributes[54], attributes[56]], index: 16, rarity: -1)else{
            fatalError("failed")
        }
        guard let k18 = Katydid(name: "Chloroscirtus discocercus", attributes: [attributes[14], attributes[4], attributes[13]], index: 17, rarity: 1)else{
            fatalError("failed")
        }
        guard let k19 = Katydid(name: "Cnemidophyllum eximium", attributes: [attributes[6], attributes[4], attributes[58]], index: 18, rarity: -2)else{
            fatalError("failed")
        }
        guard let k20 = Katydid(name: "Coconotus wheeleri", attributes: [attributes[57], attributes[16], attributes[17]], index: 19, rarity: 0)else{
            fatalError("failed")
        }
        guard let k21 = Katydid(name: "Copiphora brevirostris", attributes: [attributes[6], attributes[4], attributes[5], attributes[18]], index: 20, rarity: 0)else{
            fatalError("failed")
        }
        guard let k22 = Katydid(name: "Docidocercus gigliotosi", attributes: [attributes[19], attributes[57]], index: 21, rarity: 0)else{
            fatalError("failed")
        }
        guard let k23 = Katydid(name: "Dolichocercus latipennis", attributes: [attributes[2], attributes[10], attributes[20]], index: 22, rarity: 1)else{
            fatalError("failed")
        }
        guard let k24 = Katydid(name: "Ectemna dumicola", attributes: [attributes[15], attributes[4], attributes[21]], index: 23, rarity: 0)else{
            fatalError("failed")
        }
        guard let k25 = Katydid(name: "Erioloides longinoi", attributes: [attributes[22], attributes[23]],index: 24,  rarity: 0)else{
            fatalError("failed")
        }
        guard let k26 = Katydid(name: "Eubliastes pollonerae", attributes: [attributes[57], attributes[24]],index: 25,  rarity: -1)else{
            fatalError("failed")
        }
        guard let k27 = Katydid(name: "Euceraia atrix", attributes: [attributes[25]], index: 26, rarity: 1)else{
            fatalError("failed")
        }
        guard let k28 = Katydid(name: "Euceraia insignis", attributes: [attributes[59], attributes[27], attributes[26]], index: 27, rarity: 1)else{
            fatalError("failed")
        }
        guard let k29 = Katydid(name: "Hyperphrona irregularis", attributes: [attributes[28], attributes[4]], index: 28, rarity: 1)else{
            fatalError("failed")
        }
        guard let k30 = Katydid(name: "Idiarthron spp.", attributes: [attributes[6], attributes[10], attributes[57]], index: 29, rarity: -1)else{
            fatalError("failed")
        }
        guard let k31 = Katydid(name: "Ischnomela gracilis", attributes: [attributes[55], attributes[57], attributes[29], attributes[30]], index: 30, rarity: -1)else{
            fatalError("failed")
        }
        guard let k32 = Katydid(name: "Itarissa costaricensis", attributes: [attributes[31]], index: 31, rarity: 0)else{
            fatalError("failed")
        }
        guard let k33 = Katydid(name: "Itarissa sunrise", attributes: [attributes[32]], index: 32, rarity: 0)else{
            fatalError("failed")
        }
        guard let k34 = Katydid(name: "Lamprophyllum bugabae", attributes: [attributes[6], attributes[4], attributes[33]], index: 33, rarity: 1)else{
            fatalError("failed")
        }
        guard let k35 = Katydid(name: "Lamprophyllum micans", attributes: [attributes[14], attributes[34]],index: 34,  rarity: 1)else{
            fatalError("failed")
        }
        guard let k36 = Katydid(name: "Microcentrum sp1", attributes: [attributes[14], attributes[6], attributes[4]], index: 35, rarity: 0)else{
            fatalError("failed")
        }
        guard let k37 = Katydid(name: "Microcentrum dino", attributes: [attributes[4]], index: 36, rarity: 1)else{
            fatalError("failed")
        }
        guard let k38 = Katydid(name: "Microcentrum polka", attributes: [attributes[14], attributes[6], attributes[4]], index: 37, rarity: 1)else{
            fatalError("failed")
        }
        guard let k39 = Katydid(name: "Montezumina bradleyi bradleyi", attributes: [attributes[2], attributes[4], attributes[35], attributes[36], attributes[37]], index: 38, rarity: 1)else{
            fatalError("failed")
        }
        guard let k40 = Katydid(name: "Neoconocephalus affinis", attributes: [attributes[4], attributes[10], attributes[38]], index: 39, rarity: -1)else{
            fatalError("failed")
        }
        guard let k41 = Katydid(name: "Orophus conspersus", attributes: [attributes[14], attributes[10]],index: 40, rarity: 1)else{
            fatalError("failed")
        }
        guard let k42 = Katydid(name: "Philophyllia guttulata", attributes: [attributes[6], attributes[4], attributes[40]], index: 41, rarity: -1)else{
            fatalError("failed")
        }
        guard let k43 = Katydid(name: "Philophyllia ingens", attributes: [attributes[6], attributes[4], attributes[41]], index: 42, rarity: 0)else{
            fatalError("failed")
        }
        guard let k44 = Katydid(name: "Phlugis sp", attributes: [attributes[8], attributes[2]], index: 43, rarity: -2)else{
            fatalError("failed")
        }
        guard let k45 = Katydid(name: "Phylloptera dimidiata", attributes: [attributes[42], attributes[34]],index: 44,  rarity: 1)else{
            fatalError("failed")
        }
        guard let k46 = Katydid(name: "Phylloptera quinquemaculata", attributes: [attributes[34], attributes[3], attributes[43]], index: 45, rarity: 0)else{
            fatalError("failed")
        }
        guard let k47 = Katydid(name: "Pristonotus sp", attributes: [attributes[6], attributes[10], attributes[57], attributes[41]], index: 46, rarity: -1)else{
            fatalError("failed")
        }
        guard let k48 = Katydid(name: "Pycnopalpa bicordata", attributes: [attributes[2], attributes[44], attributes[45], attributes[46]], index: 47, rarity: 0)else{
            fatalError("failed")
        }
        guard let k49 = Katydid(name: "Pycnopalpa sincordata", attributes: [attributes[2], attributes[44], attributes[45]], index: 48, rarity: 0)else{
            fatalError("failed")
        }
        guard let k50 = Katydid(name: "Scopiorinus fragilis", attributes: [attributes[2], attributes[4], attributes[57]], index: 49, rarity: -1)else{
            fatalError("failed")
        }
        guard let k51 = Katydid(name: "Steirodon careovirgulatum", attributes: [attributes[6], attributes[4], attributes[47]], index: 50, rarity: 0)else{
            fatalError("failed")
        }
        guard let k52 = Katydid(name: "Steirodon robertsorum", attributes: [attributes[4], attributes[6], attributes[60]], index: 51, rarity: -2)else{
            fatalError("failed")
        }
        guard let k53 = Katydid(name: "Steirodon sandrae", attributes: [attributes[4], attributes[6], attributes[60]], index: 52, rarity: -2)else{
            fatalError("failed")
        }
        guard let k54 = Katydid(name: "Steirodon stalii", attributes: [attributes[6], attributes[4], attributes[61]], index: 53, rarity: 0)else{
            fatalError("failed")
        }
        guard let k55 = Katydid(name: "Subria sylvestris", attributes: [attributes[10], attributes[4], attributes[52]], index: 54, rarity: 0)else{
            fatalError("failed")
        }
        guard let k56 = Katydid(name: "Baliophyllum", attributes: [attributes[2], attributes[10], attributes[57], attributes[49]], index: 55, rarity: 2)else{
            fatalError("failed")
        }
        guard let k57 = Katydid(name: "Viadana zetterstedti", attributes: [attributes[24], attributes[62]],index: 56,  rarity: 1)else{
            fatalError("failed")
        }
        guard let k58 = Katydid(name: "Waxy katydid", attributes: [attributes[2], attributes[4]], index: 57, rarity: 1) else{
            fatalError("failed")
        }
        
        katydids += [k1, k2, k3, k4, k5, k6, k7, k8, k9, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k20, k21, k22, k23, k24, k25, k26, k27, k28, k29, k30, k31, k32, k33, k34, k35, k36, k37, k38, k39, k40, k41, k42, k43, k44, k45, k46, k47, k48, k49, k50, k51, k52, k53, k54, k55, k56, k57, k58]
        
        NSKeyedArchiver.archiveRootObject(katydids, toFile: Katydid.ArchiveURL.path)
    }
    
    private func loadAttributes() -> [Attribute]?  {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Attribute.ArchiveURL.path) as? [Attribute]
    }
    private func loadKatydids() -> [Katydid]?  {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Katydid.ArchiveURL.path) as? [Katydid]
    }
}

//
//  Attribute.swift
//  katydidID
//
//  Created by Caitlyn Lee on 1/2/18.
//  Copyright © 2018 Caitlyn Lee. All rights reserved.
//

import UIKit
import os.log

class Katydid: NSObject, NSCoding{
    
    //MARK: Properties
    var name: String
    var attributes: [Attribute]
    var rarity: Float
    var score: Float
    var notes: String
    var image: UIImage
    
    //MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("katydids")
    
    //MARK: Types
    struct PropertyKey {
        static let name = "name"
        static let attributes = "attributes"
        static let rarity = "rarity"
        static let score = "score"
        static let notes = "notes"
        static let image = "image"
    }
    
    //MARK: Initialization
    init?(name: String, attributes: [Attribute], rarity: Float, notes: String = "Notes:\n") {
        self.name = name
        self.attributes = attributes
        self.rarity = rarity
        self.score = 0
        self.notes = notes
        
        let test = UIImage(named: self.name)
        if (test != nil){
            self.image = test!
        }
        else{
            self.image = #imageLiteral(resourceName: "nophoto")
        }
    }
    
    func getScore(given: [Attribute]){
        for choice in given{
            if self.attributes.contains(where: { $0.name == choice.name }) {
                self.score += 2
            }
            else{
                self.score -= 0.5
            }
        }
        
        self.score += (self.rarity/2)
    }
    
    //MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(attributes, forKey: PropertyKey.attributes)
        aCoder.encode(rarity, forKey: PropertyKey.rarity)
        //aCoder.encode(score, forKey: PropertyKey.score)
        aCoder.encode(notes, forKey: PropertyKey.notes)
        //aCoder.encode(image, forKey: PropertyKey.image)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String
        let attributes = aDecoder.decodeObject(forKey: PropertyKey.attributes) as? [Attribute]
        let rarity = aDecoder.decodeFloat(forKey: PropertyKey.rarity)
        
        let notes = aDecoder.decodeObject(forKey: PropertyKey.notes) as? String
        /*
        let score = aDecoder.decodeFloat(forKey: PropertyKey.score)
        
        let image = aDecoder.decodeObject(forKey: PropertyKey.image) as? UIImage
        */
        
        // Must call designated initializer.
        self.init(name: name!, attributes: attributes!, rarity: rarity, notes: notes!)
        
    }
    
}

//
//  Attribute.swift
//  katydidID
//
//  Created by Caitlyn Lee on 1/2/18.
//  Copyright © 2018 Caitlyn Lee. All rights reserved.
//

import UIKit
import os.log

class Attribute: NSObject, NSCoding {
    
    //MARK: Properties
    var name: String
    var category: String
    
    //MARK: Archiving paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("attributes")
    
    //MARK: Types
    struct PropertyKey {
        static let name = "name"
        static let category = "category"
    }

    //MARK: Initialization
    init?(name: String, category:String) {
        self.name = name
        self.category = category
    }
 
    
    //MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(category, forKey: PropertyKey.category)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String
        let category = aDecoder.decodeObject(forKey: PropertyKey.category) as? String
        
        self.init(name: name!, category: category!)
    }
    
}

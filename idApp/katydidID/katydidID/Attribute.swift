//
//  Attribute.swift
//  katydidID
//
//  Created by Caitlyn Lee on 1/2/18.
//  Copyright © 2018 Caitlyn Lee. All rights reserved.
//

import UIKit

class Attribute {
    
    //MARK: Properties
    var name: String
    var category: String
    
    //MARK: Initialization
    init?(name: String, category:String) {
        self.name = name
        self.category = category
        
        if name.isEmpty || category.isEmpty{
            return nil
        }
    }
}

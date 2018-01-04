//
//  Attribute.swift
//  katydidID
//
//  Created by Caitlyn Lee on 1/2/18.
//  Copyright © 2018 Caitlyn Lee. All rights reserved.
//

import UIKit

class Katydid {
    
    //MARK: Properties
    var name: String
    var attributes: [Attribute]
    var rarity: Float
    var score: Float
    
    //MARK: Initialization
    init?(name: String, attributes: [Attribute], rarity: Float) {
        self.name = name
        self.attributes = attributes
        self.rarity = rarity
        self.score = 0
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
}

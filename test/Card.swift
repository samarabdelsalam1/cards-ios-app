//
//  Card.swift
//  test
//
//  Created by samar abdelsalam on 6/13/19.
//  Copyright © 2019 samar abdelsalam. All rights reserved.
//

import Foundation

struct Card {
    var isFacedUp = false
    var isMatched = false
    var identifier: Int
    static var identifierFactory = 0
    
    static func getUniqueIdentifier()->Int{
         identifierFactory += 1
        return identifierFactory
    }
    init(){
        
        self.identifier = Card.getUniqueIdentifier()
    }
    
    
 
}

//
//  Concentration.swift
//  test
//
//  Created by samar abdelsalam on 6/13/19.
//  Copyright © 2019 samar abdelsalam. All rights reserved.
//

import Foundation

class Concentration {
    
    var cards = [Card]()
    
    var indexOfOneAndOnlyFacedUpCard: Int?
    
    func chaooseCard(at index: Int){
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFacedUpCard , matchIndex != index{
                //check if cards are matched
                if(cards[matchIndex].identifier == cards[index].identifier ){
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFacedUp = true
                indexOfOneAndOnlyFacedUpCard = nil
            }else{
                //either no cards or cards are faced up
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFacedUp = false
                }
                cards[index].isFacedUp = true
                indexOfOneAndOnlyFacedUpCard =  index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int){
        print("number of pairs of cards: \(numberOfPairsOfCards)")
        for _ in 0..<numberOfPairsOfCards{
            let card = Card()
            let card2 = card
            cards += [card,card2]
        }
        
        print("Cards created: \(cards.count)")
        cards.shuffle()
    }
    
    // MARK: TO to be implemented
    
}

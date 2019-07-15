//
//  ViewController.swift
//  test
//
//  Created by samar abdelsalam on 6/12/19.
//  Copyright © 2019 samar abdelsalam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var flipCountLable: UILabel!
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count)/2)
    var flipCount = 0 {
        didSet{
            flipCountLable.text = "Flips: \(flipCount)"
        }
        
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.firstIndex(of: sender){
            flipCount += 1
          // fliCard(withEmoji: emojies[card], on: sender)
            game.chaooseCard(at: cardNumber)
            //This a change in the model and we need to update our view to reflect the changes
            updateViewFromModel()
        }else{
            
            print("Bad card")
        }
    }
    
    func updateViewFromModel(){
        //print(cardButtons.indices)
        print (game.cards)
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFacedUp{
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }else{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
                
            }
        }
    }
    
    var emojiChoises = ["😹","😹","😻","😻","😽","😽","🙀","🙀","😾","😾","😼","😼"]
    var emoji = Dictionary<Int,String>()
    func emoji(for card :Card)->String{
        if emoji[card.identifier] == nil , emojiChoises.count > 0{
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoises.count)))
          //radomly add emojiChoise to emoji ditionary and remove it from emojiChoces
          emoji[card.identifier] = emojiChoises.remove(at: randomIndex)
            
        }
        //If the value in the dictionary is nil return "?"
        
        return emoji[card.identifier] ??  "?"
    
    }
    
}


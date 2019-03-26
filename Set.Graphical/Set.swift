//
//  Set.swift
//  Set
//
//  Created by beckerresearch on 3/17/19.
//  Copyright © 2019 Washington University. All rights reserved.
//

import Foundation

struct Set
{
    private(set) var deck = PlayingCardDeck()
    private(set) var inPlayCards = [PlayingCard]()
    private(set) var selectedCards =  [PlayingCard]()
    private(set) var score = 0
    private var matchedCards = [PlayingCard]()
   
    
    
    mutating func replace3Cards(){
        for cardIndex in 0..<3 {
            let keyIndex = inPlayCards.index(of: selectedCards[cardIndex])
            if let card = deck.draw() {
                inPlayCards[keyIndex!]=card
            } else {
                inPlayCards.remove(at: keyIndex!)
            }
        }
        selectedCards.removeAll()
    }
    
    mutating func shuffleCards(){
        let numberOfCards = inPlayCards.count
        deck.cards += inPlayCards
        inPlayCards.removeAll()
        for _ in 0..<numberOfCards{
            if let card = deck.draw(){
                inPlayCards.append(card)
            }
        }
        score -= 9
    }
    
    mutating func deal3Cards(){
        for _ in 1...3{
            if let card = deck.draw() {
                inPlayCards.append(card)
            }
        }
    }
    
    func cardSet(_ group: [PlayingCard]) -> Bool {
        var groupNumber = [Int]()
        var groupShape = [Int]()
        var groupShading = [Int]()
        var groupColor = [Int]()
        for index in 0..<3{
            groupNumber.append(group[index].number.rawValue)
            groupShape.append(group[index].shape.rawValue)
            groupShading.append(group[index].shading.rawValue)
            groupColor.append(group[index].color.rawValue)
        }
        
        
        
        if groupNumber.containsUnique() && groupShape.containsSame() && groupShading
            .containsSame() && groupColor.containsSame(){
            return true
        }else if groupNumber.containsSame() && groupShape.containsUnique() && groupShading
            .containsSame() && groupColor.containsSame(){
            return true
        }else if groupNumber.containsSame() && groupShape.containsSame() && groupShading
            .containsUnique() && groupColor.containsSame(){
            return true
        }else if groupNumber.containsSame() && groupShape.containsSame() && groupShading
            .containsSame() && groupColor.containsUnique(){
            return true
        } else {return false}
    }
        
    mutating func  chooseCard(at index: Int) {
            let card = inPlayCards[index]
            if !matchedCards.contains(card){
                if !selectedCards.contains(card) {
                    selectedCards.append(card)
                    if selectedCards.count == 3 {
                        if cardSet(selectedCards){
                            matchedCards += selectedCards
                            replace3Cards()
                            score += 3
                        } else {
                            selectedCards.removeAll()
                            score -= 5
                        }
                    }
                } else {
                    selectedCards.remove(at: selectedCards.index(of: card)!)
                    score -= 1
                }
            }
    }
    
    init() {
        deck = PlayingCardDeck()
        selectedCards =  [PlayingCard]()
        matchedCards = [PlayingCard]()
        for _ in 0..<12 {
            inPlayCards.append(deck.draw()!)
        }
    }
    
}

extension Array where Element == Int {
    func containsUnique () -> Bool {
        for index in self.indices {
            var temp = self
            temp.remove(at: index)
            if !temp.reduce(true, { (Result: Bool, value : Element) -> Bool in return Result && value != self[index]})
            {
                return false
            }
        }
        return true
    }
}

extension Array where Element == Int {
    func containsSame () -> Bool {
        for index in self.indices {
            var temp = self
            temp.remove(at: index)
            if temp.reduce(true, { (Result: Bool, value : Element) -> Bool in return Result && value == self[index]})
            {
                return true
            }
        }
        return false
    }
}



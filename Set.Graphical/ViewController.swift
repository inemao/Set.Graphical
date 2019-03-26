//
//  ViewController.swift
//  Set.With.Graphics
//
//  Created by beckerresearch on 3/19/19.
//  Copyright © 2019 Washington University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViewFromModel()
    }
    var game = Set()
    
    @IBOutlet weak var board: PlayingBoardView!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    @IBOutlet weak var dealCardsButton: UIButton!
    @IBOutlet weak var newGameButton: UIButton!
    @IBAction func deal3Cards(_ sender: UIButton) {
        game.deal3Cards()
        updateViewFromModel()
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        game = Set()
        updateViewFromModel()
    }
    
    @IBAction func touchCard(_ sender: UITapGestureRecognizer) {
        var cardIndex = 0
        let location = sender.location(in: sender.view)
        let cardLocation = CGRect(x: location.x, y: location.y, width: 0, height: 0)
        
        for index in 0..<sender.view!.subviews.count {
            if sender.view!.subviews[index].frame.contains(cardLocation){
                cardIndex = index
            }
        }
        
        switch sender.state {
        case .ended: game.chooseCard(at: cardIndex)
        default: break
        }
        updateViewFromModel()
    
    }
    
    @IBAction func swipe3Cards(_ sender: UISwipeGestureRecognizer) {
        
        switch sender.state {
        case .ended: game.deal3Cards()
        default: break
        }
        updateViewFromModel()
    }
    
    
    @IBAction func rotateShuffleCards(_ sender: UIRotationGestureRecognizer) {
        switch sender.state {
        case .ended: game.shuffleCards()
        default: break
        }
        updateViewFromModel()
        
    }
    
    func updateViewFromModel() {
        board.game =  game
        scoreLabel.text = "Score: \(game.score)"
        view.addSubview(board)
        view.setNeedsDisplay()
        setButtons()
    }
    
    private func setButtons(){
        var font = UIFont.preferredFont(forTextStyle: .body).withSize(25)
        font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
        scoreLabel.font = font
        let attributedNewGame = NSAttributedString(string: "New Game", attributes: [.font:font])
        newGameButton.setAttributedTitle(attributedNewGame, for: .normal)
        newGameButton.setTitleColor(UIColor.blue, for: .normal)
        let attributedDeal = NSAttributedString(string: "Deal 3 Cards", attributes: [.font:font])
        dealCardsButton.setAttributedTitle(attributedDeal, for: .normal)
        if game.deck.cards.isEmpty {
            dealCardsButton.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        } else {
            dealCardsButton.setTitleColor(UIColor.blue, for: UIControl.State.normal)
        }
    }
    
}


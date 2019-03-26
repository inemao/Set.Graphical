//
//  PlayingBoardView.swift
//  Set.With.Graphics
//
//  Created by beckerresearch on 3/21/19.
//  Copyright © 2019 Washington University. All rights reserved.
//

import UIKit

class PlayingBoardView: UIView {
    var cellCount = 12
    
    var game = Set(){
        didSet{
            setBoard()
        }
    }
    
    override func layoutSubviews() {
        setBoard()
    }
    
    private func setBoard(){
        for subview in self.subviews {
            subview.removeFromSuperview()
        }
        var grid = Grid.init(layout: .aspectRatio(1), frame: bounds )
        grid.cellCount = game.inPlayCards.count
        for index in 0..<grid.cellCount{
            let card = game.inPlayCards[index]
            switch card.shape.rawValue {
            case 1 :
                let PlayingCardView = SquigglyCardView()
                PlayingCardView.color =  card.color.rawValue
                PlayingCardView.number = card.number.rawValue
                PlayingCardView.shading = card.shading.rawValue
                PlayingCardView.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
                PlayingCardView.frame = grid[index]!
                //                    PlayingCardView.isUserInteractionEnabled = true
                if game.selectedCards.contains(card){
                    PlayingCardView.layer.borderWidth = 3.0
                    PlayingCardView.layer.cornerRadius = 8.0
                    PlayingCardView.layer.borderColor = UIColor.blue.cgColor
                } else
                {
                    PlayingCardView.layer.borderWidth = 1.0
                    PlayingCardView.layer.cornerRadius = 0.0
                    PlayingCardView.layer.borderColor = UIColor.black.cgColor
                }
                self.addSubview(PlayingCardView)
            case 2 :
                let PlayingCardView = DiamondCardView()
                PlayingCardView.color =  card.color.rawValue
                PlayingCardView.number = card.number.rawValue
                PlayingCardView.shading = card.shading.rawValue
                PlayingCardView.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
                PlayingCardView.frame = grid[index]!
                //                    PlayingCardView.isUserInteractionEnabled = true
                if game.selectedCards.contains(card){
                    PlayingCardView.layer.borderWidth = 3.0
                    PlayingCardView.layer.cornerRadius = 8.0
                    PlayingCardView.layer.borderColor = UIColor.blue.cgColor
                } else
                {
                    PlayingCardView.layer.borderWidth = 1.0
                    PlayingCardView.layer.cornerRadius = 0.0
                    PlayingCardView.layer.borderColor = UIColor.black.cgColor
                }
                self.addSubview(PlayingCardView)
            case 3 :
                let PlayingCardView = OvalCardView()
                PlayingCardView.color =  card.color.rawValue
                PlayingCardView.number = card.number.rawValue
                PlayingCardView.shading = card.shading.rawValue
                PlayingCardView.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
                PlayingCardView.frame = grid[index]!
                //                    PlayingCardView.isUserInteractionEnabled = true
                if game.selectedCards.contains(card){
                    PlayingCardView.layer.borderWidth = 3.0
                    PlayingCardView.layer.cornerRadius = 8.0
                    PlayingCardView.layer.borderColor = UIColor.blue.cgColor
                } else
                {
                    PlayingCardView.layer.borderWidth = 1.0
                    PlayingCardView.layer.cornerRadius = 0.0
                    PlayingCardView.layer.borderColor = UIColor.black.cgColor
                }
                self.addSubview(PlayingCardView)
            default: break
                
            }
            
        }
    }
}
extension CGRect {
    func inset(by size: CGSize) -> CGRect {
        return insetBy(dx: size.width, dy: size.height)
    }
    
    func sized(to size: CGSize) -> CGRect {
        return CGRect(origin: origin, size: size)
    }
    
    func zoom(by scale: CGFloat) -> CGRect {
        let newWidth = width * scale
        let newHeight = height * scale
        return insetBy(dx: (width - newWidth) / 2, dy: (height - newHeight) / 2)
    }
}

extension CGPoint {
    func offsetBy(dx: CGFloat, dy: CGFloat) -> CGPoint {
        return CGPoint(x: x+dx, y: y+dy)
    }
}

//
//  DiamondCardView.swift
//  Set.With.Graphics
//
//  Created by beckerresearch on 3/20/19.
//  Copyright © 2019 Washington University. All rights reserved.
//

import UIKit

@IBDesignable
class DiamondCardView: UIView {

    @IBInspectable
    var number: Int = 1 { didSet { setNeedsDisplay(); setNeedsLayout()} }
    @IBInspectable
    var shading: Int = 1 { didSet { setNeedsDisplay(); setNeedsLayout()} }
    @IBInspectable
    var color: Int = 1 { didSet { setNeedsDisplay(); setNeedsLayout()} }
    
    
    func createDiamondPath() -> UIBezierPath {
        let DiamondPath = UIBezierPath()
        DiamondPath.move(to: CGPoint(x: bounds.width*3/16, y: bounds.midY))
        DiamondPath.addLine(to: CGPoint(x: bounds.midX, y: bounds.height*3/8))
        DiamondPath.addLine(to: CGPoint(x: bounds.width*13/16, y: bounds.midY))
        DiamondPath.addLine(to: CGPoint(x: bounds.midX, y: bounds.height*5/8))
        DiamondPath.close()
        
        return DiamondPath
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        switch number {
        case 1 :
            path.append(createDiamondPath())
        case 2 :
            let path1 = createDiamondPath()
            path1.apply(CGAffineTransform(translationX: 0, y: -bounds.height/5))
            let path2 = createDiamondPath()
            path2.apply(CGAffineTransform(translationX: 0, y: +bounds.height/5))
            path.append(path1)
            path.append(path2)
        case 3 :
            let path1 = createDiamondPath()
            path1.apply(CGAffineTransform(translationX: 0, y: -bounds.height*1/4))
            let path2 = createDiamondPath()
            path2.apply(CGAffineTransform(translationX: 0, y: +bounds.height*0/8))
            let path3 = createDiamondPath()
            path3.apply(CGAffineTransform(translationX: 0, y: +bounds.height*1/4))
            path.append(path1)
            path.append(path2)
            path.append(path3)
        default : break
        }
        
        path.addClip()
        switch color{
        case 1:
            UIColor.green.setStroke()
            if shading == 1 {
                UIColor.green.setFill()
                path.fill()
            }
        case 2:
            UIColor.red.setStroke()
            if shading == 1 {
                UIColor.red.setFill()
                path.fill()
            }
        case 3:
            UIColor.purple.setStroke()
            if shading == 1 {
                UIColor.purple.setFill()
                path.fill()
            }
        default: break
        }
        if shading == 2 {
            for offset in 1...15{
                path.move(to: CGPoint(x: CGFloat(offset)*bounds.width/16, y: 0))
                path.addLine(to: CGPoint(x: CGFloat(offset)*bounds.width/16, y: bounds.height))
            }
        }
        
        path.lineWidth = 1.0
        path.stroke()
    }
}



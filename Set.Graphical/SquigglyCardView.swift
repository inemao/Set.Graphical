//
//  SquigglyCardView.swift
//  Set.With.Graphics
//
//  Created by beckerresearch on 3/19/19.
//  Copyright © 2019 Washington University. All rights reserved.
//

import UIKit

@IBDesignable
class SquigglyCardView: UIView {
    
    @IBInspectable
    var number: Int = 1 { didSet { setNeedsDisplay(); setNeedsLayout()} }
    @IBInspectable
    var shading: Int = 1 { didSet { setNeedsDisplay(); setNeedsLayout()} }
    @IBInspectable
    var color: Int = 1 { didSet { setNeedsDisplay(); setNeedsLayout()} }
    
    
    func createSquigglyPath() -> UIBezierPath {
        let squigglyPath = UIBezierPath()
        squigglyPath.move(to: CGPoint(x: bounds.width*3/16, y: bounds.height*3/8))
        squigglyPath.addCurve(to: CGPoint(x: bounds.width*5/8, y: bounds.height*3/8), controlPoint1: CGPoint(x: bounds.width*3/8, y: bounds.height*1/4), controlPoint2: CGPoint(x: bounds.midX, y: bounds.midY) )
        squigglyPath.addArc(withCenter: CGPoint(x: bounds.width*3/4, y: bounds.height*3/8), radius: bounds.height/8, startAngle: CGFloat.pi, endAngle: CGFloat.pi/4, clockwise: true)
        squigglyPath.addCurve(to: CGPoint(x: bounds.width*3/8, y: bounds.midY), controlPoint1: CGPoint(x: bounds.width*5/8, y: bounds.height*5/8), controlPoint2: CGPoint(x: bounds.midX, y: bounds.height*3/8) )
        squigglyPath.addArc(withCenter: CGPoint(x: bounds.width*1/4, y: bounds.height*31/64), radius: bounds.height/8, startAngle: 0, endAngle: CGFloat.pi*5/4, clockwise: true)
        squigglyPath.close()
        
        
        return squigglyPath
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        switch number {
        case 1 :
            path.append(createSquigglyPath())
        case 2 :
            let path1 = createSquigglyPath()
            path1.apply(CGAffineTransform(translationX: 0, y: -bounds.height/5))
            let path2 = createSquigglyPath()
            path2.apply(CGAffineTransform(translationX: 0, y: +bounds.height/5))
            path.append(path1)
            path.append(path2)
        case 3 :
            let path1 = createSquigglyPath()
            path1.apply(CGAffineTransform(translationX: 0, y: -bounds.height/5))
            let path2 = createSquigglyPath()
            path2.apply(CGAffineTransform(translationX: 0, y: +bounds.height*3/8))
            let path3 = createSquigglyPath()
            path3.apply(CGAffineTransform(translationX: 0, y: +bounds.height*5/64))
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



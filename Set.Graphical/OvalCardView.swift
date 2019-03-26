//
//  OvalCardView.swift
//  Set.With.Graphics
//
//  Created by beckerresearch on 3/20/19.
//  Copyright © 2019 Washington University. All rights reserved.
//

import UIKit

@IBDesignable
class OvalCardView: UIView {

   
    @IBInspectable
    var number: Int = 1 { didSet { setNeedsDisplay(); setNeedsLayout()} }
    @IBInspectable
    var shading: Int = 1 { didSet { setNeedsDisplay(); setNeedsLayout()} }
    @IBInspectable
    var color: Int = 1 { didSet { setNeedsDisplay(); setNeedsLayout()} }
    
    
    func createOvalPath() -> UIBezierPath {
        let OvalPath = UIBezierPath()
        OvalPath.move(to: CGPoint(x: bounds.width*3/16, y: bounds.midY))
        OvalPath.addArc(withCenter: CGPoint(x: bounds.width*5/16, y: bounds.midY), radius: bounds.height*1/8, startAngle: CGFloat.pi, endAngle: CGFloat.pi*3/2, clockwise: true)
        OvalPath.addLine(to: CGPoint(x: bounds.width*13/16, y: bounds.height*3/8))
        OvalPath.addArc(withCenter: CGPoint(x: bounds.width*13/16, y: bounds.midY), radius: bounds.height*1/8, startAngle: CGFloat.pi*3/2, endAngle: CGFloat.pi*1/2, clockwise: true)
        OvalPath.addLine(to: CGPoint(x: bounds.width*3/16, y: bounds.height*5/8))
        OvalPath.addArc(withCenter: CGPoint(x: bounds.width*5/16, y: bounds.midY), radius: bounds.height*1/8, startAngle: CGFloat.pi*1/2, endAngle: CGFloat.pi, clockwise: true)
        OvalPath.close()
        
        return OvalPath
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        switch number {
        case 1 :
            path.append(createOvalPath())
        case 2 :
            let path1 = createOvalPath()
            path1.apply(CGAffineTransform(translationX: 0, y: -bounds.height/5))
            let path2 = createOvalPath()
            path2.apply(CGAffineTransform(translationX: 0, y: +bounds.height/5))
            path.append(path1)
            path.append(path2)
        case 3 :
            let path1 = createOvalPath()
            path1.apply(CGAffineTransform(translationX: 0, y: -bounds.height*5/16))
            let path2 = createOvalPath()
            path2.apply(CGAffineTransform(translationX: 0, y: +bounds.height*0/8))
            let path3 = createOvalPath()
            path3.apply(CGAffineTransform(translationX: 0, y: +bounds.height*5/16))
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




//
//  DesignableHouseView.swift
//  Our House
//
//  Created by John Pavley on 8/1/17.
//  Copyright © 2017 John Pavley. All rights reserved.
//

import UIKit

@IBDesignable class DesignableHouseView: UIView {
    
    @IBInspectable var fillColor: UIColor = UIColor.blue
    @IBInspectable var lineColor: UIColor = UIColor.white
    @IBInspectable var lineWidth: CGFloat = 3.0
    @IBInspectable var useContext: Bool = false
    
    
    override func draw(_ rect: CGRect) {
        drawBackground()
        drawHorizontalLine()
    }
    
    func drawBackground() {
        let path = UIBezierPath(roundedRect: bounds, cornerRadius: 20.0)
        fillColor.setFill()
        path.fill()
    }
    
    func drawHorizontalLine() {
        print(bounds)
        let lineLength = bounds.width
        let pattern: [CGFloat] = [10.0, 5.0]
        
        if useContext {
            
            let con = UIGraphicsGetCurrentContext()!
            con.setLineWidth(lineWidth)
            con.move(to: CGPoint(x: 0, y: bounds.height/2))
            con.addLine(to: CGPoint(x: lineLength, y: bounds.height/2))
            con.setLineDash(phase: 0.0, lengths: pattern)
            con.setStrokeColor(lineColor.cgColor)
            con.strokePath()
            
        } else {
            
            let linePath = UIBezierPath()
            linePath.lineWidth = lineWidth
            linePath.move(to: CGPoint(x: 0, y: bounds.height/2))
            linePath.addLine(to: CGPoint(x: lineLength, y: bounds.height/2))
            linePath.setLineDash(pattern, count: 2, phase: 0.0)
            UIColor.cyan.setStroke()
            linePath.stroke()
            
        }
    }
}

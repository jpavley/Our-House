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
    
    override func draw(_ rect: CGRect) {
        drawBackground(rect)
        drawHorizontalLine()
    }
    
    func drawBackground(_ rect: CGRect) {
        let path = UIBezierPath(roundedRect: rect, cornerRadius: 20.0)
        fillColor.setFill()
        path.fill()
    }
    
    func drawHorizontalLine() {
        print(bounds)
        let lineLength: CGFloat = min(bounds.width, bounds.height)
        
        let linePath = UIBezierPath()
        linePath.lineWidth = lineWidth
        linePath.move(to: CGPoint(x: bounds.width/2 - lineLength/3, y: bounds.height/2))
        linePath.addLine(to: CGPoint(x: bounds.width/2 + lineLength/3, y: bounds.height/2))
        
        let pattern: [CGFloat] = [10.0, 5.0]
        linePath.setLineDash(pattern, count: 2, phase: 0.0)
        
        lineColor.setStroke()
        linePath.stroke()
    }
    
}

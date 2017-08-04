//
//  DesignableHouseView.swift
//  Our House
//
//  Created by John Pavley on 8/1/17.
//  Copyright © 2017 John Pavley. All rights reserved.
//

import UIKit

/// Grid branch:
/// Create a 15 x 26 grid of cells that fits any iOS device screen size
/// and maintains a perfect square aspect ratio.
@IBDesignable class DesignableHouseView: UIView {
    
    @IBInspectable var fillColor: UIColor = UIColor.lightGray
    @IBInspectable var lineColor: UIColor = UIColor.black
    @IBInspectable var lineThickness: CGFloat = 1.0
    @IBInspectable var rows: Int = 26
    @IBInspectable var cols: Int = 15
    @IBInspectable var dashSegmentWidth: CGFloat = 2.0
    @IBInspectable var dashGapWidth: CGFloat = 2.0
    
    var cellSideLength: CGFloat = 0.0
    
    override func draw(_ rect: CGRect) {
        drawBackground()
        drawGrid()
    }
    
    func drawBackground() {
        let path = UIBezierPath(rect: bounds)
        fillColor.setFill()
        path.fill()
    }
    
    func drawGrid() {
        print(bounds)
        
        calcCellSideLength()
        
        for col in 0..<cols {
            for row in 0..<rows {
                drawCell(col: col, row: row)
            }
        }
    }
    
    func calcCellSideLength() {
        let cellWidthCandidate = bounds.width/CGFloat(cols)
        let cellHeightCandidate = bounds.height/CGFloat(rows)
        
        cellSideLength = min(cellWidthCandidate, cellHeightCandidate)
    }
    
    func drawCell(col: Int, row: Int) {
        let x1 = cellSideLength * CGFloat(col)
        let y1 = cellSideLength * CGFloat(row)
        
        let cellPath = UIBezierPath(rect: CGRect(x: x1, y: y1, width: cellSideLength, height: cellSideLength))
        cellPath.lineWidth = lineThickness
        
        cellPath.move(to: CGPoint(x: x1, y: x1))
        let pattern: [CGFloat] = [dashSegmentWidth, dashGapWidth]
        cellPath.setLineDash(pattern, count: 2, phase: 0.0)
        lineColor.setStroke()
        cellPath.stroke()
        
    }
}

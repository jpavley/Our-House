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
    
    let fillColor = UIColor.lightGray
    let lineColor = UIColor.black
    let backColor = UIColor.black
    
    let lineThickness: CGFloat = 1.0
    
    let rows: Int = 26
    let cols: Int = 15
    
    let dashSegmentWidth: CGFloat = 2.0
    let dashGapWidth: CGFloat = 4.0
    
    var gridHOffset: CGFloat = 0.0
    var gridVOffset: CGFloat = 0.0
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        drawBackground()
        drawGrid()
    }
    
    func drawBackground() {
        let path = UIBezierPath(rect: bounds)
        backColor.setFill()
        path.fill()
    }
    
    func drawGrid() {
        print(bounds)
        
        let cellSideLength = calcCellSideLength()
        gridHOffset = calcGridHOffset(cellSideLength: cellSideLength)
        gridVOffset = calcGridVOffset(cellSideLength: cellSideLength)
        
        for col in 0..<cols {
            for row in 0..<rows {
                drawCell(col: col, row: row, gridHOffset: gridHOffset)
            }
        }
    }
    
    func calcCellSideLength() -> CGFloat {
        let cellWidthCandidate = bounds.width/CGFloat(cols)
        let cellHeightCandidate = bounds.height/CGFloat(rows)
        return min(cellWidthCandidate, cellHeightCandidate)
    }
    
    func calcCellBounds(col: Int, row: Int, cellSideLength: CGFloat) -> CGRect {
        let x1 = (cellSideLength * CGFloat(col)) + gridHOffset
        let y1 = cellSideLength * CGFloat(row)
        return CGRect(x: x1, y: y1, width: cellSideLength, height: cellSideLength)
    }
    
    func calcGridHOffset(cellSideLength: CGFloat) -> CGFloat {
        let gridWidth = cellSideLength * CGFloat(cols)
        let offset = (bounds.width - gridWidth) / 2
        return offset
    }
    
    func calcGridVOffset(cellSideLength: CGFloat) -> CGFloat {
        let gridHight = cellSideLength * CGFloat(rows)
        let offset = (bounds.height - gridHight) / 2
        return offset
    }

    
    func drawCell(col: Int, row: Int, gridHOffset: CGFloat) {
        let cellSideLength = calcCellSideLength()
        let cellBounds = calcCellBounds(col: col, row: row, cellSideLength: cellSideLength)
        
        let cellPath = UIBezierPath(rect: cellBounds)
        cellPath.lineWidth = lineThickness
        
        let pattern: [CGFloat] = [dashSegmentWidth, dashGapWidth]
        cellPath.setLineDash(pattern, count: 2, phase: 0.0)
        fillColor.setFill()
        cellPath.fill()
        lineColor.setStroke()
        cellPath.stroke()
        
    }
}

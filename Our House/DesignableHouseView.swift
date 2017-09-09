//
//  DesignableHouseView.swift
//  Our House
//
//  Created by John Pavley on 8/1/17.
//  Copyright © 2017 John Pavley. All rights reserved.
//

import UIKit

/// Grass Sun Sky branch:
/// A test of our coorindate system with three elements.
@IBDesignable class DesignableHouseView: UIView {
    
    struct Grass {
        let bounds = CGRect(x: 1, y: 76, width: 58, height: 27)
        let color = UIColor.green
    }
    
    struct Sky {
        let bounds = CGRect(x: 1, y: 1, width: 58, height: 75)
        let color = UIColor.blue
    }
    
    struct Sun {
        let bounds = CGRect(x: 40, y: 7, width: 13, height: 14)
        let color = UIColor.yellow
    }
    
    struct World {
        let bounds: CGRect?
        let rows: Int?
        let cols: Int?
        var cellSideLength: CGFloat = 0.0
        var gridHOffset: CGFloat = 0.0
        var gridVOffset: CGFloat = 0.0
        
        func calcCellSideLength() -> CGFloat? {
            if let bounds = bounds, let rows = rows, let cols = cols {
                let cellWidthCandidate = bounds.width/CGFloat(cols)
                let cellHeightCandidate = bounds.height/CGFloat(rows)
                return min(cellWidthCandidate, cellHeightCandidate)
            }
            return nil
        }
        
        func calcCellBounds(col: Int, row: Int, cellSideLength: CGFloat) -> CGRect {
            let x1 = (cellSideLength * CGFloat(col)) + gridHOffset
            let y1 = cellSideLength * CGFloat(row)
            return CGRect(x: x1, y: y1, width: cellSideLength, height: cellSideLength)
        }
        
        func calcGridHOffset(cellSideLength: CGFloat) -> CGFloat? {
            if let bounds = bounds, let cols = cols {
                let gridWidth = cellSideLength * CGFloat(cols)
                let offset = (bounds.width - gridWidth) / 2
                return offset
            }
            return nil
        }
        
        func calcGridVOffset(cellSideLength: CGFloat) -> CGFloat? {
            if let bounds = bounds, let rows = rows {
                let gridHight = cellSideLength * CGFloat(rows)
                let offset = (bounds.height - gridHight) / 2
                return offset
            }
            return nil
        }
        
        init(bounds: CGRect, rows: Int, cols: Int) {
            self.bounds = bounds
            self.rows = rows
            self.cols = cols
            cellSideLength = calcCellSideLength()!
            gridHOffset = calcGridHOffset(cellSideLength: cellSideLength)!
            gridVOffset = calcGridVOffset(cellSideLength: cellSideLength)!
        }
        
    }
    
    var world: World?
        
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        
        if world == nil {
            world = World(bounds: bounds, rows: 104, cols: 60)
        }
        
        drawBackground()
        drawGrass()
        //drawSky()
        //drawSun()
    }
    
    func drawBackground() {
        let path = UIBezierPath(rect: bounds)
        UIColor.black.setFill()
        path.fill()
    }
    
    func drawGrass() {
        let grass = Grass()
        let path = UIBezierPath(rect: grass.bounds)
        grass.color.setFill()
        path.fill()
    }

    
}

//
//  GraphView.swift
//  gView
//
//  Created by apple on 15/03/20.
//  Copyright © 2020 apple. All rights reserved.
//

import Foundation
import UIKit

struct Graph {
    static let kGraphHeight = 150
    static let kDefaultGraphWidth = 900
    static let kOffsetX = 0
    static let kStepX = 5
    static let kGraphBottom = 300
    static let kGrpahTop = 0
    static let kStepY = 5
    static let kOffsetY = 0
}
class GraphUI: UIView {
    var context: CGContext? = nil
    var data : [Double]? = [0]
    var currentRect: CGPoint = CGPoint(x: 0, y: 0)
    var x_Axis = 0.0
    
   
    func drawLineGraph(count: Int, value: Double) {
        context?.setLineWidth(2.0)
        context?.setStrokeColor(UIColor.white.cgColor)
        let maxGraphHeight = Graph.kGraphHeight - Graph.kOffsetY
        context?.beginPath()
        var point = CGPoint(x: 0, y: 0)
        if (count - 2 < 0) {
            point = CGPoint(x: 0, y: 150)
        } else {
            point = CGPoint(x: Double(Graph.kOffsetX) + Double(count-1) * Double(Graph.kStepX), y: Double(Graph.kGraphHeight) - Double(maxGraphHeight) * data![(count-2)])
        }
        context?.move(to: point)
        context?.addLine(to: CGPoint(x: Double(Graph.kOffsetX) + Double(count) * Double(Graph.kStepX), y:Double(Graph.kGraphHeight) - Double(maxGraphHeight) * Double(value)))
        currentRect = CGPoint(x: Double(Graph.kOffsetX) + Double(count) * Double(Graph.kStepX), y: Double(Graph.kGraphHeight) - Double(maxGraphHeight) * value)
        context?.strokePath()
        
    }
    
    func addValue(value: Double) {
        data?.append(value)
        //drawLineGraph(count: (data!.count) , value: value)
        UIView.animate(withDuration: 5.0) {
            self.setNeedsDisplay()
        }
        
    }
    
    override func draw(_ rect: CGRect) {
        print(self.frame)
        context = UIGraphicsGetCurrentContext()
        context?.clear(self.bounds)
        x_Axis = 0.0
//        context?.setFillColor(UIColor(displayP3Red: <#T##CGFloat#>, green: <#T##CGFloat#>, blue: <#T##CGFloat#>, alpha: <#T##CGFloat#>))
//        context?.setFillColor(UIColor(red: 80.0/255, green: 69.0/255.0, blue: 99.0/255.0, alpha: 1.0).cgColor)
        
        context?.setFillColor(UIColor(red: 0.0/255, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor)
        
        context?.fill(self.bounds)
        context?.setLineWidth(0.6)
        context?.setStrokeColor(UIColor.black.cgColor)
        let lines = (Graph.kDefaultGraphWidth - Graph.kOffsetX) / Graph.kStepX
        
        for i in 0...lines {
            context?.move(to: CGPoint(x: Graph.kOffsetX + i * Graph.kStepX , y: Graph.kGrpahTop))
            context?.addLine(to: CGPoint(x: Graph.kOffsetX + i * Graph.kStepX, y: Graph.kGraphBottom))
        }
        
        let howManyHorizontal = (Graph.kGraphBottom - Graph.kGrpahTop - Graph.kOffsetY) / Graph.kStepY
        for i in 0...howManyHorizontal {
            context?.move(to: CGPoint(x: Graph.kOffsetX, y: Graph.kGraphBottom - Graph.kOffsetY - i * Graph.kStepY))
            context?.addLine(to: CGPoint(x: Graph.kDefaultGraphWidth, y: Graph.kGraphBottom - Graph.kOffsetY - i * Graph.kStepY))
        }
        
        for i in 0...lines {
            context?.saveGState()
            defer {
                context?.restoreGState()
            }
            
            let attrs = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 10)!,
                         NSAttributedString.Key.foregroundColor: UIColor.init(displayP3Red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1)]
            print(rect)
            context?.translateBy(x: rect.origin.x, y: rect.origin.y + rect.size.height)
            context?.scaleBy(x: 1.0, y: -1.0)
//            String(x_Axis).draw(in: CGRect(origin: CGPoint(x: (i * Graph.kStepX), y: 0), size: CGSize(width: 50, height: 50)), withAttributes: attrs)
            String(x_Axis).draw(in: CGRect(origin: CGPoint(x: (i * 30), y: 0), size: CGSize(width: 50, height: 50)), withAttributes: attrs)

            x_Axis = x_Axis + 1
        }
        context?.strokePath()
        guard let con = context else {return}
        var count =  1
        // var start = limit
        for i in 0..<data!.count {
            print("Count " + i.description)
            drawLineGraph(count: count, value: (data?[i])!)
            count = count + 1
        }
    }
}


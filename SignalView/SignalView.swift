//
//  SignalView.swift
//
//  Created by Antonio081014 on 6/17/15.
//  Copyright (c) 2015 Antonio081014.com. All rights reserved.
//

import UIKit

@IBDesignable
class SignalView: UIView {
    
    /**
        Private
    
        Five Levels of Signal Strength.

        Level Listing:
    
        * NoSignal
        * WeekSignal
        * MediumSignal
        * StrongSignal
        * ExtraStrongSignal
    
    */
    private enum SignalLevelType: Int {
        case NoSignal = 0
        case WeekSignal = 8
        case MediumSignal = 28
        case StrongSignal = 60
        case ExtraStrongSignal = 85
    }
    
    /**
        Private Stored Property: SignalLevelType
    */
    private var signalStrengthLevel: SignalLevelType = SignalLevelType.NoSignal {
        didSet {
            setNeedsDisplay()
        }
    }
    
    /**
        Signal Level: Range from 0 to 100 inclusive.
        
        Computed Property: Int
    */
    var signalLevel: Int {
        get {
            return signalStrengthLevel.rawValue
        }
        set {
            let signal: Int = min(100, max(0, newValue))
            if signal >= SignalLevelType.ExtraStrongSignal.rawValue {
                signalStrengthLevel = SignalLevelType.ExtraStrongSignal
            } else if signal >= SignalLevelType.StrongSignal.rawValue {
                signalStrengthLevel = SignalLevelType.StrongSignal
            } else if signal >= SignalLevelType.MediumSignal.rawValue {
                signalStrengthLevel = SignalLevelType.MediumSignal
            } else if signal >= SignalLevelType.WeekSignal.rawValue {
                signalStrengthLevel = SignalLevelType.WeekSignal
            } else {
                signalStrengthLevel = SignalLevelType.NoSignal
            }
        }
    }
    
    @IBInspectable
    var startAngle: CGFloat = CGFloat(-0.5) { didSet { setNeedsDisplay() } }
    @IBInspectable
    var endAngle: CGFloat = CGFloat(0.5) { didSet { setNeedsDisplay() } }
    
    private var origin: CGPoint {
        get {
            return CGPointMake(0, CGRectGetHeight(self.bounds) / 2)
        }
    }
    
    private let basicUnitRatio: CGFloat = 1.0 / 13
    
    /**
        Override function drawRect(rect: CGRect)
    
        The function will be called by system automatically.
    
        Adding Five Partial Rings to Represent the Strength of the Signal
    */
    override func drawRect(rect: CGRect) {
        let unitLength = min(CGRectGetWidth(rect), CGRectGetHeight(rect)) * basicUnitRatio
        
        let wave0 = drawWavePath(0, radiusOuter: unitLength)
        UIColor.blackColor().set()
        wave0.stroke()
        
        let wave1 = drawWavePath(3 * unitLength, radiusOuter: 2 * unitLength)
        UIColor.blackColor().set()
        wave1.stroke()

        let wave2 = drawWavePath(7 * unitLength, radiusOuter: 2 * unitLength)
        UIColor.blackColor().set()
        wave2.stroke()
        
        let wave3 = drawWavePath(11 * unitLength, radiusOuter: 2 * unitLength)
        UIColor.blackColor().set()
        wave3.stroke()
        
        UIColor.cyanColor().set()
        switch signalStrengthLevel {
        case .NoSignal:
            // donothing;
            break
        case .WeekSignal:
            wave0.fill()
        case .MediumSignal:
            wave0.fill()
            wave1.fill()
        case .StrongSignal:
            wave0.fill()
            wave1.fill()
            wave2.fill()
        case .ExtraStrongSignal:
            wave0.fill()
            wave1.fill()
            wave2.fill()
            wave3.fill()
        }
    }
    
    /**
        Private function Returns the UIBezierPath of Partial Ring
        
        :param: radiusInner,the radius of inner circle.
        
        :param: radiusOuter,the radius of outer circle.
    
        :returns: The return path of drawing.
    */
    private func drawWavePath(radiusInner: CGFloat, radiusOuter: CGFloat) -> UIBezierPath {
        var path = UIBezierPath()
        
        path.addArcWithCenter(origin, radius: radiusInner, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        path.addLineToPoint(CGPointMake(origin.x + radiusOuter * cos(endAngle), origin.y + radiusOuter * sin(endAngle)))
        path.addArcWithCenter(origin, radius: radiusOuter, startAngle: endAngle, endAngle: startAngle, clockwise: false)
        path.closePath()
        
        return path
        
    }
}

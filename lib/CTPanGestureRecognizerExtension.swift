//
//  PanGestureRecognizerExtension.swift
//  GPSControl Pro
//
//  Created by Gio Andriadze on 5/19/17.
//  Copyright © 2017 Casatrade Ltd. All rights reserved.
//

import UIKit

public extension UIPanGestureRecognizer {
    
    func isLeft(theViewYouArePassing: UIView) -> Bool {
        let vel : CGPoint = velocity(in: theViewYouArePassing)
        if vel.x > 0 {
            return false
        } else {
            return true
        }
    }
    
    
    func isUp(theViewYouArePassing: UIView) -> Bool {
        let vel : CGPoint = velocity(in: theViewYouArePassing)
        if vel.y < 0 {
            return false
        } else {
            return true
        }
    }
}

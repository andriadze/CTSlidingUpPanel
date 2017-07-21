//
//  BottomSlideDelegate.swift
//  GPSControl Pro
//
//  Created by Gio Andriadze on 6/6/17.
//  Copyright © 2017 Casatrade Ltd. All rights reserved.
//
import UIKit

public protocol CTBottomSlideDelegate: class {
    func didPanelCollapse()
    func didPanelExpand()
    func didPanelAnchor()
    func didPanelMove(panelOffset: CGFloat)
}

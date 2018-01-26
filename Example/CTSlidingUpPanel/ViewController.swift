//
//  ViewController.swift
//  CTBottomSlideController
//
//  Created by Gio Andriadze on 6/29/17.
//  Copyright © 2017 Casatrade Ltd. All rights reserved.
//

import UIKit
import CTSlidingUpPanel

class ViewController: UIViewController, CTBottomSlideDelegate{
    @IBOutlet weak var bottomView: UIView!

    var bottomController:CTBottomSlideController?;
    

    override func viewDidLoad() {
        super.viewDidLoad()
        bottomController = CTBottomSlideController(parent: view, bottomView: bottomView, tabController: self.tabBarController!, navController: self.navigationController, visibleHeight: 64)
        
        
        bottomController?.setAnchorPoint(anchor: 0.7)
        bottomController?.delegate = self;
        
        if bottomController?.currentState == .collapsed
        {
            //do anything, i don't care
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didPanelCollapse()
    {
        print("Collapsed");
    }
    func didPanelExpand(){
        print("Expanded")
    }
    func didPanelAnchor(){
        print("Anchored")
    }
    
    func didPanelMove(panelOffset: CGFloat)
    {
        print(panelOffset);
    }


}


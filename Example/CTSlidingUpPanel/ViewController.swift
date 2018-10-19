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
        
        bottomController?.onPanelExpanded = {
            print("Panel Expanded in closure")
        }
        
        bottomController?.onPanelCollapsed = {
            print("Panel Collapsed in closure")
        }
        
        bottomController?.onPanelMoved = { offset in
            print("Panel moved in closure " + offset.description)
        }
        
        //Uncomment to specify top margin on expanded panel
        //bottomController?.setExpandedTopMargin(pixels: 100)
        
        if bottomController?.currentState == .collapsed
        {
            //do anything, i don't care
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        bottomController?.viewWillTransition(to: size, with: coordinator)
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


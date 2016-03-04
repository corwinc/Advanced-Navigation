//
//  TabBarController.swift
//  Advanced Navigation
//
//  Created by Corwin Crownover on 2/22/16.
//  Copyright © 2016 Corwin Crownover. All rights reserved.
//

import UIKit

class TabBarController: UIViewController {
    
    // OUTLETS
    @IBOutlet weak var contentView: UIView!
    
    var blueViewController: UIViewController!
    var pinkViewController: UIViewController!
    var greenViewController: UIViewController!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        blueViewController = storyboard.instantiateViewControllerWithIdentifier("BlueViewController")
        
        pinkViewController = storyboard.instantiateViewControllerWithIdentifier("PinkViewController")
        
        greenViewController = storyboard.instantiateViewControllerWithIdentifier("GreenViewController")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // ACTIONS
    @IBAction func onGreenButton(sender: AnyObject) {
        greenViewController.willMoveToParentViewController(self)
        
        greenViewController.view.frame = contentView.frame
        contentView.addSubview(greenViewController.view)
        
        greenViewController.didMoveToParentViewController(self)
    }
    
    @IBAction func onPinkButton(sender: AnyObject) {
        pinkViewController.view.frame = contentView.frame
        contentView.addSubview(pinkViewController.view)
    }
    
    @IBAction func onBlueButton(sender: AnyObject) {
        blueViewController.view.frame = contentView.frame
        contentView.addSubview(blueViewController.view)
    }
    
    

}

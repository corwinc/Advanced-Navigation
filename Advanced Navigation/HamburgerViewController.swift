//
//  HamburgerViewController.swift
//  Advanced Navigation
//
//  Created by Corwin Crownover on 2/22/16.
//  Copyright © 2016 Corwin Crownover. All rights reserved.
//

import UIKit

class HamburgerViewController: UIViewController {
    
    // OUTLETS
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var contentView: UIView!
    
    var initialCenter: CGPoint!
    
    var menuViewController: UIViewController!
    var feedViewController: UIViewController!
    
    
    
    
    
    // VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        menuViewController = storyboard.instantiateViewControllerWithIdentifier("MenuViewController")
        feedViewController = storyboard.instantiateViewControllerWithIdentifier("FeedViewController")
        
        feedViewController.view.frame = contentView.frame
        contentView.addSubview(feedViewController.view)
        
        menuViewController.view.frame = menuView.frame
        menuView.addSubview(menuViewController.view)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
    
    // ACTIONS
    @IBAction func onPanGesture(sender: UIPanGestureRecognizer) {
        let translation = sender.translationInView(view)
        let location = sender.locationInView(view)
        let velocity = sender.velocityInView(view)
        
        if sender.state == .Began {
            initialCenter = contentView.center
        
        } else if sender.state == .Changed {
            contentView.center = CGPoint(x: translation.x + initialCenter.x, y: initialCenter.y)
        
        } else if sender.state == .Ended {
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                if velocity.x < 0 {
                    self.contentView.center = self.view.center
                    
                } else {
                    self.contentView.center = CGPoint(x: self.view.center.x + 260, y: self.view.center.y)
                }
            })
            
        }
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}

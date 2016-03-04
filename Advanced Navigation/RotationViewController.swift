//
//  RotationViewController.swift
//  Advanced Navigation
//
//  Created by Corwin Crownover on 2/22/16.
//  Copyright © 2016 Corwin Crownover. All rights reserved.
//

import UIKit

class RotationViewController: UIViewController {
    
    
    // OUTLETS
    @IBOutlet weak var imageView: UIImageView!
    
    var rotation: CGFloat!
    var foreshortening: CGFloat!
    
    
    
    // VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rotation = 0
        foreshortening = 100

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    // ACTIONS
    @IBAction func onRotationChanged(sender: UISlider) {
        rotation = CGFloat(sender.value)
        updateTransform()
    }
    
    @IBAction func onForeshorteningChanged(sender: UISlider) {
        foreshortening = CGFloat(sender.value)
        updateTransform()
    }
    
    func updateTransform() {
        var transform = CATransform3DIdentity
        transform.m34 = 1.0 / CGFloat(foreshortening)
        
        let angle = rotation * CGFloat(M_PI) / 180.0
        transform = CATransform3DRotate(transform, angle, 0, 1, 0)
        
        imageView.layer.transform = transform
    }
    
    
    
    
    
    
    

   
    
    
}

//
//  ViewController.swift
//  mixer
//
//  Created by Angela Yu on 10/11/17.
//  Copyright © 2017 Angela Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var profileImageView: UIImageView!
    var initialImageCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onPanDrag(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view)
        
        switch sender.state {
        case .began:
            initialImageCenter = profileImageView.center
        case .changed:
            profileImageView.center.x = initialImageCenter.x + translation.x
        default:
            break
        }
        
    }
    
}


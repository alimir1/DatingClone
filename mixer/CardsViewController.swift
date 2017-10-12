//
//  ViewController.swift
//  mixer
//
//  Created by Angela Yu on 10/11/17.
//  Copyright © 2017 Angela Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var profileImageView: DraggableImageView!

    var initialImageCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImageView.photoImage = #imageLiteral(resourceName: "ryan")
    }

    @IBAction func onButton(_ sender: Any) {
        profileImageView.restoreRyan()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }    
}


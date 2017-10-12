//
//  DraggableImageView.swift
//  mixer
//
//  Created by Oscar Bonilla on 10/11/17.
//  Copyright © 2017 Angela Yu. All rights reserved.
//

import UIKit

class DraggableImageView: UIView {

    @IBOutlet var contentView: UIView!

    @IBOutlet weak var profileImageView: UIImageView!

    var photoImage: UIImage? {
        get {
            return profileImageView.image
        }
        set {
            profileImageView.image = newValue
        }
    }

    var originalCenter: CGPoint!

    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubViews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubViews()
    }

    func initSubViews() {
        let nib = UINib(nibName: "DraggableImageView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
    }

    @IBAction func onPanGesture(_ sender: UIPanGestureRecognizer) {
        print("panning")
        let translation = sender.translation(in: self.superview)
        switch sender.state {
        case .began:
            originalCenter = self.center
        case .changed:
            self.center.x = originalCenter.x + translation.x
        default:
            break
        }
    }

}

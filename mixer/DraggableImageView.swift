//
//  DraggableImageView.swift
//  mixer
//
//  Created by Oscar Bonilla on 10/11/17.
//  Copyright © 2017 Angela Yu. All rights reserved.
//

import UIKit

extension Int {
    var degreesToRadians: Double { return Double(self) * .pi / 180 }
}
extension FloatingPoint {
    var degreesToRadians: Self { return self * .pi / 180 }
    var radiansToDegrees: Self { return self * 180 / .pi }
}

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
        let translation = sender.translation(in: self.superview)
        let velocity = sender.velocity(in: self.superview)
        print("x: \(translation.x), velX: \(velocity.x)")
        switch sender.state {
        case .began:
            originalCenter = self.center
        case .changed:
            self.center.x = originalCenter.x + translation.x
            var rotationRadians = max(translation.x.degreesToRadians, CGFloat(35.degreesToRadians))
            if velocity.x > 0 {
                self.transform = CGAffineTransform.identity
                rotationRadians = -rotationRadians
            }
            print("rotation: \(rotationRadians)")
            self.transform = CGAffineTransform(rotationAngle: rotationRadians)
        default:
            break
        }
    }

}

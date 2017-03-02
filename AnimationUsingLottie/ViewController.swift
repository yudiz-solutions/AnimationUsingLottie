//
//  ViewController.swift
//  AnimationUsingLottie
//
//  Created by Yudiz Pvt.Ltd on 01/03/17.
//  Copyright © 2017 Yudiz Pvt.Ltd. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    @IBOutlet weak var btnLooping: UIButton!
    var animationView = LOTAnimationView()

    override func viewDidLoad() {
        super.viewDidLoad()
        btnLooping.addTarget(self, action:#selector(toggleLooping), for: .touchUpInside)
    }

    func animatePin(_ animation:Bool) {
        animationView.removeFromSuperview()
        animationView = LOTAnimationView.animationNamed("PinJump")
        animationView.frame.size = CGSize(width: 340, height: 340)
        animationView.center = self.view.center
        animationView.loopAnimation = animation
//        animationView.animationSpeed = 1.0;     // Default Animation Spped is 1.0
        self.view.addSubview(animationView)
        animationView.play()
//        animationView.pause()         // Pause animation in between if needed

//        animationView.play { (success : Bool) in
//            // Any stuff to do after animation
//        }
    }

    // MARK:- Button Actions    
    @IBAction func startPinAnimation(_ sender: UIButton) {
        if(btnLooping.isHidden) {
            animatePin(animationView.loopAnimation)
            sender.setTitle("Hide Animation", for: .normal)
        } else {
            animationView.removeFromSuperview()
            sender.setTitle("Show Animation", for: .normal)
        }
        btnLooping.isHidden = !btnLooping.isHidden
    }

    func toggleLooping() {
        animationView.loopAnimation = !animationView.loopAnimation
        if (animationView.loopAnimation) {
            btnLooping.setTitle("Looping Off", for: .normal)
        } else {
            btnLooping.setTitle("Looping On", for: .normal)
        }
        animatePin(animationView.loopAnimation)
    }
}

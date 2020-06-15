//
//  GesturesManager.swift
//  puttingAllTogether
//
//  Created by Pedro Sousa on 15/06/20.
//  Copyright © 2020 Brabo. All rights reserved.
//

import UIKit

public enum GesturesType {
    case up
    case right
    case down
    case left
    case pinch
}

class GesturesManager {
    
    public static let shared: GesturesManager = GesturesManager()
    public var delegate: ManagerDelegate? {
        didSet {
            setupGestures()
        }
    }
    
    private let pinchGesture      = UIPinchGestureRecognizer()
    private let swipeUpGesture    = UISwipeGestureRecognizer()
    private let swipeRightGesture = UISwipeGestureRecognizer()
    private let swipeDownGesture  = UISwipeGestureRecognizer()
    private let swipeLeftGesture  = UISwipeGestureRecognizer()
    
    private init() {
        
    }
    
    private func setupGestures() {
        pinchGesture.addTarget(self, action: #selector(pinch))
        pinchGesture.delegate = delegate
        
        swipeUpGesture.addTarget(self, action: #selector(swipeUp))
        swipeUpGesture.direction = .up
        swipeUpGesture.delegate = delegate
        
        swipeRightGesture.addTarget(self, action: #selector(swipeRight))
        swipeRightGesture.direction = .right
        swipeRightGesture.delegate = delegate
        
        swipeDownGesture.addTarget(self, action: #selector(swipeDown))
        swipeDownGesture.direction = .down
        swipeDownGesture.delegate = delegate
        
        swipeLeftGesture.addTarget(self, action: #selector(swipeLeft))
        swipeLeftGesture.direction = .left
        swipeLeftGesture.delegate = delegate
    }
    
    @objc private func pinch(_ pinch: UIPinchGestureRecognizer) {
        if(pinch.scale > 1) {
            print("Code to show the menu goes here...")
        } else {
            print("(Maybe) Code to hide the menu goes here...")
        }
    }
    
    @objc private func swipeUp() {
        print("Swipe up recognized!")
    }
    
    @objc private func swipeRight() {
        print("Swipe right recognized!")
    }
    
    @objc private func swipeDown() {
        print("Swipe down recognized!")
    }
    
    @objc private func swipeLeft() {
        print("Swipe left recognized!")
    }
    
    public func activateSwipes(gameplay: Gameplay, gestures: GesturesType...) {
        for gesture in gestures {
            switch gesture {
            case .up:
                gameplay.addGestureRecognizer(swipeUpGesture)
                gameplay.topView.isHidden = false
                UIView.animate(withDuration: 1.5, animations: {
                    gameplay.topView.alpha = 0.9
                }, completion: { (completion) in
                    gameplay.topView.layer.add(Gameplay.pulseAnimation, forKey: "pulseAnimation")
                })
            case .right:
                gameplay.addGestureRecognizer(swipeRightGesture)
                gameplay.rightView.isHidden = false
                UIView.animate(withDuration: 1.5, animations: {
                    gameplay.rightView.alpha = 0.9
                }, completion: { (completion) in
                    gameplay.rightView.layer.add(Gameplay.pulseAnimation, forKey: "pulseAnimation")
                })
            case .down:
                gameplay.addGestureRecognizer(swipeDownGesture)
                gameplay.bottomView.isHidden = false
                UIView.animate(withDuration: 1.5, animations: {
                    gameplay.bottomView.alpha = 0.9
                }, completion: { (completion) in
                    gameplay.bottomView.layer.add(Gameplay.pulseAnimation, forKey: "pulseAnimation")
                })
            case .left:
                gameplay.addGestureRecognizer(swipeLeftGesture)
                gameplay.leftView.isHidden = false
                UIView.animate(withDuration: 1.5, animations: {
                    gameplay.leftView.alpha = 0.9
                }, completion: { (completion) in
                    gameplay.leftView.layer.add(Gameplay.pulseAnimation, forKey: "pulseAnimation")
                })
            case .pinch:
                gameplay.addGestureRecognizer(pinchGesture)
            }
        }
    }
    
    public func deactivateSwipes(gameplay: Gameplay, gestures: GesturesType...) {
        for gesture in gestures {
            switch gesture {
            case .up:
                gameplay.removeGestureRecognizer(swipeUpGesture)
                UIView.animate(withDuration: 1.5, animations: {
                    gameplay.topView.alpha = 0
                }, completion: { (completion) in
                    gameplay.topView.isHidden = true
                })
            case .right:
                gameplay.removeGestureRecognizer(swipeRightGesture)
                UIView.animate(withDuration: 1.5, animations: {
                    gameplay.rightView.alpha = 0
                }, completion: { (completion) in
                    gameplay.rightView.isHidden = true
                })
            case .down:
                gameplay.removeGestureRecognizer(swipeDownGesture)
                UIView.animate(withDuration: 1.5, animations: {
                    gameplay.bottomView.alpha = 0
                }, completion: { (completion) in
                    gameplay.bottomView.isHidden = true
                })
            case .left:
                gameplay.removeGestureRecognizer(swipeLeftGesture)
                UIView.animate(withDuration: 1.5, animations: {
                    gameplay.leftView.alpha = 0
                }, completion: { (completion) in
                    gameplay.leftView.isHidden = true
                })
            case .pinch:
                gameplay.removeGestureRecognizer(pinchGesture)
            }
        }
    }
}

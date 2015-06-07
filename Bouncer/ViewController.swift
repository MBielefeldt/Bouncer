//
//  ViewController.swift
//  Bouncer
//
//  Created by Mads Bielefeldt on 07/06/15.
//  Copyright (c) 2015 GN ReSound. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    let bouncher = BouncerBehavior()
    
    lazy var animator: UIDynamicAnimator = {
        UIDynamicAnimator(referenceView: self.view)
    }()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        animator.addBehavior(bouncher)
    }
    
    var redBlock: UIView?
    
    struct Constants {
        static let blockSize = CGSize(width: 40, height: 40)
    }
    
    private func addBlock() -> UIView
    {
        let block = UIView(frame: CGRect(origin: CGPointZero, size: Constants.blockSize))
        block.center = CGPoint(x: self.view.bounds.midX, y: self.view.bounds.midY)
        view.addSubview(block)
        return block
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        
        if redBlock == nil {
            redBlock = addBlock()
            redBlock!.backgroundColor = UIColor.redColor()
            bouncher.addBlock(redBlock!)
        }
    }
}


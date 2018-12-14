//
//  ViewController.swift
//  Snowman
//
//  Created by Ivan Prybolovetz on 11/19/18.
//  Copyright © 2018 Ivan Prybolovetz. All rights reserved.
//

import UIKit

class SnowmanViewController: UIViewController{
    
    weak var timer = Timer()
    var isEyesOpen: Bool = true
    
    
    @IBOutlet var imageViewSnowman: Snowman!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(blinking), userInfo: nil, repeats: true)
        blinking()
    }
    
    @objc func blinking() {
        isEyesOpen = !isEyesOpen
        imageViewSnowman.delegateOpenEyes = self
        imageViewSnowman.setNeedsDisplay()
    }
}

extension SnowmanViewController: EyesOpeningDelegate {
    func openEyes() -> Bool {
        return isEyesOpen
    }
}

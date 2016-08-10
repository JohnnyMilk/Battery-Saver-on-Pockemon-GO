//
//  ViewController.swift
//  Battery Saver
//
//  Created by Milk on 2016/8/9.
//  Copyright © 2016年 Johnny Milk. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    let motionManager = CMMotionManager()
    let coverImageView = UIImageView()
    var saverMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Cover image setting
        coverImageView.frame = view.frame
        coverImageView.image = UIImage(named: "cover.PNG")
        
        //Background image setting
        let backgroundView = UIImageView(frame: view.frame)
        backgroundView.image = UIImage(named: "background.PNG")
        view.addSubview(backgroundView)
        
        if motionManager.accelerometerAvailable {
            let queue = NSOperationQueue.currentQueue()
            motionManager.startDeviceMotionUpdatesToQueue(queue!, withHandler: { (deviceMotion:CMDeviceMotion?, error:NSError?) in
                let myDevice = UIDevice.currentDevice()
                
                //Mode switching between of Battery Saver and Normal
                //Or using the UIScreen.mainScreen().brightness
                if (myDevice.orientation == UIDeviceOrientation.PortraitUpsideDown) && !(self.saverMode) {
                    self.view.addSubview(self.coverImageView)
                    self.saverMode = true
                    
                    print("Saver mode")
                } else if !(myDevice.orientation == UIDeviceOrientation.PortraitUpsideDown) && (self.saverMode) {
                    self.coverImageView.removeFromSuperview()
                    self.saverMode = false
                    
                    print("Go to work")
                }
            })
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}


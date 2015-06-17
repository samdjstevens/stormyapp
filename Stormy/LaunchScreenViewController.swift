//
//  LaunchScreenViewController.swift
//  Stormy
//
//  Created by Sam Stevens on 14/06/2015.
//  Copyright © 2015 Sam Stevens. All rights reserved.
//

//
//  ViewController.swift
//  Stormy
//
//  Created by Sam Stevens on 13/06/2015.
//  Copyright © 2015 Sam Stevens. All rights reserved.
//

import UIKit

class LaunchScreenViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let colorTop = UIColor(red: 192.0/255.0, green: 38.0/255.0, blue: 42.0/255.0, alpha: 1.0).CGColor
        let colorBottom = UIColor(red: 35.0/255.0, green: 2.0/255.0, blue: 2.0/255.0, alpha: 1.0).CGColor
        
        let gl: CAGradientLayer = CAGradientLayer()
        gl.colors = [ colorTop, colorBottom]
        gl.locations = [ 0.0, 1.0]
        gl.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        
        self.view.layer.insertSublayer(gl, atIndex: 1)
  
        
    }
}


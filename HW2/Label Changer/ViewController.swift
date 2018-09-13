//
//  ViewController.swift
//  Label Changer
//
//  Created by CSC214 Instructor on 7/18/18.
//  Copyright © 2018 University of Rochester. All rights reserved.
//

import UIKit
import SceneKit

class ViewController: UIViewController {

    // initial squares
    @IBOutlet weak var square1: UIView!
    @IBOutlet weak var square2: UIView!
    @IBOutlet weak var square3: UIView!
    @IBOutlet weak var square4: UIView!
    
    // import changer model
    var model = ColorChangerModel()

    // set initial background color
    override func viewDidLoad() {
        super.viewDidLoad()
        square1.backgroundColor = UIColor.black
        square2.backgroundColor = UIColor.black
        square3.backgroundColor = UIColor.black
        square4.backgroundColor = UIColor.black
    }



    // change colors when button clicked
    @IBAction func secondButtonClicked(_ sender: UIButton) {
        square1.backgroundColor = model.getFirstColor()
        square2.backgroundColor = model.getSecondColor()
        square3.backgroundColor = model.getThirdColor()
        square4.backgroundColor = model.getForthColor()
    }
}


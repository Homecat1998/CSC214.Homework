//
//  ViewController.swift
//  MakeItHappen
//
//  Created by CSC214 Instructor on 7/20/18.
//  Copyright © 2018 University of Rochester. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var faveImage: UIImageView!
    @IBOutlet weak var stackViewXConstraint: NSLayoutConstraint!
    @IBOutlet weak var makeItHappenBtnBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var button: UIButton!
    
    // when button clicked, play the animation
    @IBAction func pressButton(_ sender: Any) {
        bgColorAnimation()
    }
    

    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // hide the image
        faveImage.isHidden = true
        
        // start to show the image
        imageAnimation()
        
        // move stack view and button to the initial position
        self.makeItHappenBtnBottomConstraint.constant = -200
        self.stackViewXConstraint.constant = -500


        



    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // shart to show the button and stack view
        showButtons()
        stackViewAnimation()

        
    }

    // MARK - Utility
    

    // animation for image
    func imageAnimation() {

        // set alpha and cancel hidden
        self.faveImage.alpha = 0;
        self.faveImage.isHidden = false

        // 3 seconds to show, delay 1 second
        UIView.animate(withDuration: 3.0, delay: 1.0,animations: {
            self.faveImage.alpha = 1.0
        })
    }

    // animation fot button
    func showButtons(){
        
        UIView.animate(withDuration: 1.0, delay: 2.0, animations: {
            
            // move upwards 200 points
            self.button.center.y -= 200
        }, completion: { _ in
            
            //after complete, reset the constant
            self.makeItHappenBtnBottomConstraint.constant = 0
        })
        
    }
    
    
    // like the one for the button
    // the animation for stack view
    func stackViewAnimation (){
        
        UIView.animate(withDuration: 1.0, delay: 3.0, animations: {
            self.stackView.center.x += 500
        }, completion: { _ in
            self.stackViewXConstraint.constant = 0
        })
        
    }
    
    // animation for background color
    // and I scale the image here as well
    func bgColorAnimation() {
        UIView.animate(withDuration: 2.0, animations: {
            
            // make a new transform
            self.faveImage.transform = self.faveImage.transform.scaledBy(x: 2.0, y: 2.0)
            
            // change the bgcolor
            self.view.backgroundColor = UIColor.purple
        }, completion: { _ in
            
            UIView.animate(withDuration: 2.0, animations:{
                self.faveImage.transform = self.faveImage.transform.scaledBy(x: 0.5, y: 0.5)
                self.view.backgroundColor = UIColor.brown
            })
            
            })
    }

    
    
    @IBAction func onMakeItHappen(_ sender: UIButton) {

    }
}


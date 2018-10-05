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
    // @IBOutlet weak var favoriteImageView: UIImageView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var button: UIButton!
    @IBAction func pressButton(_ sender: Any) {
        bgColorAnimation()
    }
    

    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        faveImage.isHidden = true
        imageAnimation()
        print("view did load")
        self.makeItHappenBtnBottomConstraint.constant = -200
        self.stackViewXConstraint.constant = -350


        



    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
        showButtons()
        stackViewAnimation()

        
    }

    // MARK - Utility
    
    
    func imageAnimation() {

        self.faveImage.alpha = 0;
        self.faveImage.isHidden = false

        UIView.animate(withDuration: 3.0, delay: 1.0,animations: {
            self.faveImage.alpha = 1.0
        })
    }

    func showButtons(){
        
        UIView.animate(withDuration: 1.0, delay: 3.0, animations: {
            self.button.center.y -= 200
        }, completion: { _ in
            self.makeItHappenBtnBottomConstraint.constant = 0
        })
        
    }
    
    func stackViewAnimation (){
        
        UIView.animate(withDuration: 1.0, delay: 2.0, animations: {
            self.stackView.center.x += 350
        }, completion: { _ in
            self.stackViewXConstraint.constant = 0
        })
        
    }
    
    func bgColorAnimation() {
        
        
        UIView.animate(withDuration: 2.0, animations: {
            self.faveImage.transform = self.faveImage.transform.scaledBy(x: 2.0, y: 2.0)
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


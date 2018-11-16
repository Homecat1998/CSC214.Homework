//
//  DetailViewController.swift
//  QuickDraw
//
//  Created by Zhong, Zhetao on 11/15/18.
//  Copyright © 2018 Zhong, Zhetao. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var document : QDDocument?

    
    @IBOutlet var drawView: DrawView! {
        didSet {
            drawView.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if document == nil{
                document = QDDocument(title: NSLocalizedString("str_untitled", comment: ""))
        }
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    
    
        
        // MARK: - Utility
        
                func configureView() {
                    
                    drawView?.roundBrush = (document?.roundBrush)!
                    drawView?.tint = (document?.tint)!
                    drawView?.lines = (document?.lines)!
                }
                
                // MARK: - Actions
                
                @IBAction func onEraserBtn(_ sender: UIBarButtonItem) {
                    document?.lines.removeAll()
                    configureView()
                }
                
                @IBAction func onSquareShapeBtn(_ sender: Any) {
                    document?.roundBrush = false
                    configureView()
                }
                @IBAction func onRoundShapeBtn(_ sender: Any) {
                    document?.roundBrush = true
                    configureView()
                }
                
                @IBAction func onBlackColorBtn(_ sender: Any) {
                    document?.tint = .black
                    configureView()
                }
                @IBAction func onRedColorBtn(_ sender: Any) {
                    document?.tint = .red
                    configureView()
                }
                @IBAction func onGreenColorBtn(_ sender: Any) {
                    document?.tint = .green
                    configureView()
                }
                @IBAction func onBlueColorBtn(_ sender: Any) {
                    document?.tint = .blue
                    configureView()
                }
            }
            
            extension DetailViewController: DrawViewDelegate {
                func updateLines(_ drawView: DrawView, lines: [QDLine]) {
                    document?.lines = lines
                }
}


    
    






//
//  AboutViewViewController.swift
//  Passwords
//
//  Created by Zhong, Zhetao on 11/7/18.
//  Copyright © 2018 University of Rochester. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    @IBAction func onDoneBtn(_ sender: UIButton) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var appName: UILabel!
    @IBOutlet weak var appVersion: UILabel!
    @IBOutlet weak var appBuild: UILabel!
    @IBOutlet weak var copyright: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var launchDate: UILabel!
    @IBOutlet weak var launchNum: UILabel!
    
    
    let defaults = UserDefaults(suiteName: kAppGroupBundleID)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1.0)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale.current
        
        appName.text = Bundle.main.displayName
        appVersion.text = Bundle.main.version
        appBuild.text = Bundle.main.build
        copyright.text = Bundle.main.copyright
        launchNum.text = defaults.integer(forKey: dNumLaunches).description
//        launchDate.text = dateFormatter.string(from: defaults.object(forKey: dLastLaunch))

        // Do any additional setup after loading the view.
        backBtn.setTitle(NSLocalizedString("str_done", comment: ""), for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

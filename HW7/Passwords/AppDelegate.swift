//
//  AppDelegate.swift
//  Passwords
//
//  Created by Arthur Roolfs on 11/3/18.
//  Copyright © 2018 University of Rochester. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var passwords: Passwords!
    
    let defaults = UserDefaults(suiteName: kAppGroupBundleID)!
    
    override init() {
        defaults.set(Bundle.main.build, forKey: dAppVersion)
    }
    
    var dataFileName = "PasswordsFile"
    
    lazy var fileURL: URL = {
        let documentsDir =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDir.appendingPathComponent(dataFileName, isDirectory: false)
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        initDefaults()

        loadData()
        if let navController = window?.rootViewController as? UINavigationController,
            let mainViewController = navController.viewControllers.first as? TableViewController {
            mainViewController.passwords = passwords
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        let currentDate = Date().timeIntervalSince1970
        defaults.set(dLastLaunch, forKey: String (currentDate))
        let numLaunches = defaults.integer(forKey: dNumLaunches) + 1
        defaults.set(numLaunches, forKey: dNumLaunches)
        saveData()
    }
    
    

    func applicationDidEnterBackground(_ application: UIApplication) { }

    func applicationWillEnterForeground(_ application: UIApplication) { }

    func applicationDidBecomeActive(_ application: UIApplication) { }

    func applicationWillTerminate(_ application: UIApplication) {
        saveData()
    }

    // MARK - Persistence Methods
    
    func saveData() {
        
        if FileManager.default.fileExists(atPath: fileURL.path) {
            do {
                try FileManager.default.removeItem(at: fileURL)
            } catch {
                fatalError(error.localizedDescription)
            }
        }
        
        if let encodedData = try? JSONEncoder().encode(passwords) {
            FileManager.default.createFile(atPath: fileURL.path, contents: encodedData, attributes: nil)
        } else {
            fatalError("Couldn't write data!")
        }
    }
    
    func loadData() {
        
        if !FileManager.default.fileExists(atPath: fileURL.path) {
            passwords = Passwords()
            return
        }
        
        if let jsondata = FileManager.default.contents(atPath: fileURL.path) {
            let decoder = JSONDecoder()
            do {
                passwords = try decoder.decode(Passwords.self, from: jsondata)
            } catch {
                fatalError(error.localizedDescription)
            }
        } else {
            fatalError("No data at \(fileURL.path)!")
        }
    }
    
    func initDefaults() {
        if let path = Bundle.main.path(forResource: "Defaults", ofType: "plist"),
            let dictionary = NSDictionary(contentsOfFile: path) {
            defaults.register(defaults: dictionary as! [String : Any])
            defaults.synchronize()
        }
    }
    

}


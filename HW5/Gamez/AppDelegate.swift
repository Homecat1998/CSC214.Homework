//
//  AppDelegate.swift
//  Gamez
//
//  Created by CSC214 Instructor on 7/27/18.
//  Copyright © 2018 University of Rochester. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var gameLibrary = GameLibrary()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        gameLibrary.addGame("The Legend of Zelda", .actionRPG, 1986)
        gameLibrary.addGame("Diablo III", .actionRPG, 2012)
        gameLibrary.addGame("Metroid", .actionRPG, 1986)
        gameLibrary.addGame("Borderlands", .actionRPG, 2009)
        
        gameLibrary.addGame("BioShock Infinite", .firstPersonShooter, 2013)
        gameLibrary.addGame("Doom", .firstPersonShooter, 2016)
        gameLibrary.addGame("Dying Light", .firstPersonShooter, 2015)
        gameLibrary.addGame("Evolve", .firstPersonShooter, 2015)
        gameLibrary.addGame("Half-Life 3", .firstPersonShooter, 1997)
        gameLibrary.addGame("Quake", .firstPersonShooter, 1999)
        gameLibrary.addGame("Titanfall", .firstPersonShooter, 2014)
        
        gameLibrary.addGame("Final Fantasy IV", .jrpg, 1994)
        gameLibrary.addGame("Ni No Kuni 2", .jrpg, 2017)
        gameLibrary.addGame("Nights of Azure", .jrpg, 2017)
        
        gameLibrary.addGame("Super Mario Odyssey", .platformer, 2017)
        gameLibrary.addGame("Sonic Mania", .platformer, 2017)
        gameLibrary.addGame("Runner 3", .platformer, 2018)
        
        gameLibrary.addGame("Super Mario Brothers", .sideScroller, 1985)
        gameLibrary.addGame("Rayman Legends", .sideScroller, 2013)
        gameLibrary.addGame("Shovel Knight", .sideScroller, 2014)
        
        gameLibrary.addGame("Team Fortress 2", .teamShooter, 2007)
        gameLibrary.addGame("Overwatch", .teamShooter, 2016)
        gameLibrary.addGame("Left 4 Dead", .teamShooter, 2008)
        
        gameLibrary.addGame("Kingdom Rush", .towerDefense, 2017)
        gameLibrary.addGame("Orcs Must Die 2", .towerDefense, 2012)
        gameLibrary.addGame("Warzone 2100", .towerDefense, 2017)
        
        gameLibrary.addGame("Mass Effect", .westernRPG, 2007)
        gameLibrary.addGame("The Witcher 3", .westernRPG, 2015)

        /*
         **  Depencency injection to main view controller via window?.rootViewController
         */
        if let mainViewController = window?.rootViewController as? ViewController {
            mainViewController.library = gameLibrary
        }

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}


//
//  AppDelegate.swift
//  ProjectSettingsSwift
//
//  Created by GK on 16/3/26.
//  Copyright © 2016年 GK. All rights reserved.
//

import UIKit
import Fabric
import Crashlytics
import Optimizely

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        Fabric.sharedSDK().debug = true
        
        Fabric.with([Crashlytics.self, Optimizely.self])
        
        Optimizely.startOptimizelyWithAPIToken("AANO7ZkBrBBMCvtni3CXah6U-mwHNkT6~5640121080", launchOptions:launchOptions)

      
        self.logUser()
        
        
        //print(ServerURL)
        #if DEBUG
            print("Debug")
        #else
            print("Release")
        #endif
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        if Optimizely.handleOpenURL(url) {
            return true
        }
        
        return false
    }
}
extension AppDelegate {
    //给Crashlytics添加用户的基本信息
    func logUser() {
        // TODO: Use the current user's information
        // You can call any combination of these three methods
        Crashlytics.sharedInstance().setUserEmail("user@fabric.io")
        Crashlytics.sharedInstance().setUserIdentifier("12345")
        Crashlytics.sharedInstance().setUserName("Test User")
        Crashlytics.sharedInstance().setObjectValue(NSDate(), forKey: "CrashDate")
    }
}

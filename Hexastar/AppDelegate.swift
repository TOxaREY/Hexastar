//
//  AppDelegate.swift
//  Hexastar
//
//  Created by REYNIKOV ANTON on 16.01.2018.
//  Copyright © 2018 REYNIKOV ANTON. All rights reserved.
//

import UIKit
import YandexMobileMetrica

var screenHeight: CGFloat {
    return UIScreen.main.bounds.height
}
var nameStoryboard = String()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //Check storyboard
        switch screenHeight {
        case 568: nameStoryboard = "SE"
        case 667: nameStoryboard = "8"
        case 736: nameStoryboard = "8+"
        case 812: nameStoryboard = "Xs"
        case 896: nameStoryboard = "Xrs"
        default: nameStoryboard = "8"
        }
        YMMYandexMetrica.activate(with: YMMYandexMetricaConfiguration.init(apiKey: "9e5c9f56-49f3-47a5-95b1-3e2504e512f0")!)
        RateManager.incrementCount()
        launchScreenTimer()
        return true
    }
    //LaunchScreen timer
    private func launchScreenTimer(){
        let launchScreenVC = UIStoryboard.init(name: "LaunchScreen", bundle: nil)
        let rootVC = launchScreenVC.instantiateViewController(withIdentifier: "splashController")
        self.window?.rootViewController = rootVC
        self.window?.makeKeyAndVisible()
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(dismissSplashController), userInfo: nil, repeats: false)
    }
    @objc func dismissSplashController(){
        let mainVC = UIStoryboard.init(name: nameStoryboard, bundle: nil)
        let rootVC = mainVC.instantiateViewController(withIdentifier: "VC")
        self.window?.rootViewController = rootVC
        self.window?.makeKeyAndVisible()
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


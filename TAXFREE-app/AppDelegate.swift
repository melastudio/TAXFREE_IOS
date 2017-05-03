//
//  AppDelegate.swift
//  TAXFREE-app
//
//  Created by Elżbieta Matus on 04.03.2017.
//  Copyright © 2017 Elżbieta Matus. All rights reserved.
//

import UIKit
import Material

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

   /* func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch. UINavigationController(rootViewController: viewController)
        let viewController = MasterViewController(nibName: nil, bundle: nil)
        let navigationController = AppSearchBarController(rootViewController: AppFABMenuController(rootViewController: viewController))
        //window!.rootViewController = AppSearchBarController(rootViewController: UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RootViewController"))
     
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        return true
    }
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        return true
    }*/
    func applicationDidFinishLaunching(_ application: UIApplication) {
        window = UIWindow(frame: Screen.bounds)
        window!.rootViewController = AppSearchBarController(rootViewController: UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RootViewController"))
        window!.makeKeyAndVisible()
        UIApplication.shared.statusBarStyle = .lightContent
        UIApplication.shared.statusBarView?.backgroundColor = Color.lightBlue.accent3
        UINavigationBar.appearance().backgroundColor = Color.lightBlue.accent2
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        UINavigationBar.appearance().tintColor = Color.white
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

extension UIApplication {
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }
}

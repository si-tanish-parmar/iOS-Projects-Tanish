//
//  AppDelegate.swift
//  AppStates
//
//  Created by Tanish Parmar on 30/10/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
//    func applicationWillResignActive(_ application: UIApplication) {
//        print("Tanish is in application will resign active state")
//    }
//    
//    func applicationDidEnterBackground(_ application: UIApplication) {
//        print("Tanish is in application did enter bacground state")
//    }
//    
//    func applicationWillEnterForeground(_ application: UIApplication) {
//        print("Tanish is in application will enter foreground state")
//    }
//    
//    func applicationDidBecomeActive(_ application: UIApplication) {
//        print("Tanish is in application did become active state")
//    }
//    
//    func applicationWillTerminate(_ application: UIApplication) {
//        print("Tanish is in application will terminate state")
//    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}


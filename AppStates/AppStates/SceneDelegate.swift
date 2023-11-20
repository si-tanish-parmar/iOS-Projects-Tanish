//
//  SceneDelegate.swift
//  AppStates
//
//  Created by Tanish Parmar on 30/10/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        print("App in suspend state")
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        print("App in active state")
    }

    func sceneWillResignActive(_ scene: UIScene) {
        print("App in resign active state")
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        print("App in foreground state")
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
       print("App in background state")
    }


}


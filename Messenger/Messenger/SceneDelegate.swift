//
//  SceneDelegate.swift
//  Messenger
//
//  Created by Tanish Parmar on 09/10/23.
//

import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var authListener: AuthStateDidChangeListenerHandle?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        autoLogin()
        //restBudge()
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
        //restBudge()
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        LocationManager.shared.startUpdating()
        //restBudge()
    }

    func sceneWillResignActive(_ scene: UIScene) {
        LocationManager.shared.stopUpdating()
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
        //restBudge()
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        LocationManager.shared.stopUpdating()
        //restBudge()
    }

    //MARK: - Autologin
    func autoLogin(){
        authListener = Auth.auth().addStateDidChangeListener({ (auth, user) in
            Auth.auth().removeStateDidChangeListener(self.authListener!)
            if user != nil && userDefaults.object(forKey: kCURRENTUSER) != nil{
                DispatchQueue.main.async {
                    self.goToApp()
                }
            }
        })
    }
    private func goToApp(){
        let mainView = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainView") as! UITabBarController
        self.window?.rootViewController = mainView
    }
    
//    private func restBudge() {
//        UIApplication.shared.applicationIconBadgeNumber = 0
//    }
}

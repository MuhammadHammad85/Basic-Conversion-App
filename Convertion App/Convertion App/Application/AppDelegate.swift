//
//  AppDelegate.swift
//  Convertion App
//
//  Created by Hammad Baig on 31/05/2019.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setInitialViewConttroller()
        return true
    }
    
    func setInitialViewConttroller(){
        window = UIWindow(frame: UIScreen.main.bounds)
        let loginVc = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "ConvertionVC") as! ConvertionVC
        let NavLogin = UINavigationController(rootViewController: loginVc)
        window?.rootViewController = NavLogin
        window?.makeKeyAndVisible()
    }

   
}


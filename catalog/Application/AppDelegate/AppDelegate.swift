//
//  AppDelegate.swift
//  catalog
//
//  Created by Никита Владимирович on 25.08.2022.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow()
        window?.rootViewController = MainViewController<MainView>()
        window?.makeKeyAndVisible()
        
        IQKeyboardManager.shared.enable = true
        
        return true
    }
    
}


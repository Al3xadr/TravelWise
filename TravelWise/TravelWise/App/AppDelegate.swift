//
//  AppDelegate.swift
//  TravelWise
//
//  Created by apple on 24.07.2023.
//

import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
         // Создаем экземпляр LoginViewController
         let loginViewController = LoginViewController()
         
         window = UIWindow(frame: UIScreen.main.bounds)
         window?.rootViewController = loginViewController
         window?.makeKeyAndVisible()
         
         return true
     }
}


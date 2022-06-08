//
//  AppDelegate.swift
//  MarkTestTask
//
//  Created by Oleksandr Kachkin on 30.05.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    let window = UIWindow(frame: UIScreen.main.bounds)
    window.makeKeyAndVisible()
//    window.rootViewController = HomeViewController()
    window.rootViewController = UINavigationController(rootViewController: HomeViewController())
    
    self.window = window
    
    return true
  }
 

}


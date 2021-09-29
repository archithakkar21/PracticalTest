//
//  AppDelegate.swift
//  PracticalTest
//
//  Created by Archi Thakkar on 29/09/21.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var mainNavController : UINavigationController!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //Prepare navigation
        PTApplication.shared.prepareView()
        return true
    }
}

//
//  AppDelegate.swift
//  infoSysAssignmentKamlakar
//
//  Created by ideaqu1 on 22/06/20.
//  Copyright © 2020 kamlakar. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func applicationDidFinishLaunching(_ application: UIApplication) {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: DataListViewController())
        window?.makeKeyAndVisible()
    }
}


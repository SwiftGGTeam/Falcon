//
//  RootWindowConfigurator.swift
//  Falcon
//
//  Created by Roc Zhang on 2019/11/6.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import UIKit

/// TODO: We may have to migrate this from `AppDelegate` to `SceneSessionDelegate`
class RootWindowConfigurator: FalconAppConfigurator {
    
    // MARK: Data Elements
    
    private var window: UIWindow? {
        get {
            return (UIApplication.shared.delegate as? AppDelegate)?.window
        }
        
        set {
            (UIApplication.shared.delegate as? AppDelegate)?.window = newValue
        }
    }
    
    // MARK: Private Methods
    
    private func initWindowIfNeeded() {
        if window == nil {
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.makeKeyAndVisible()
        }
    }
    
    private func initRootViewController() {
        let tabBarController = FalcTabBarController()
        window?.rootViewController = tabBarController
    }
    
    private func configAppearance() {
        UITabBar.appearance().tintColor = .sgMainTintColor
        UINavigationBar.appearance().tintColor = .sgMainTintColor
    }
    
    // MARK: App Configurator
    
    func onAppFinishLaunching() {
        initWindowIfNeeded()
        initRootViewController()
        configAppearance()
    }
    
}

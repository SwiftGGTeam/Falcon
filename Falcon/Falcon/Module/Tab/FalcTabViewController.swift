//
//  FalcTabViewController.swift
//  Falcon
//
//  Created by Harry Duan on 2019/6/26.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import UIKit
import CYLTabBarController

class FalcTabViewController: CYLTabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }

}

extension FalcTabViewController {
    override func updateSelectionStatusIfNeeded(for tabBarController: UITabBarController, shouldSelect viewController: UIViewController) {
        self.updateSelectionStatusIfNeeded(for: tabBarController, shouldSelect: viewController)
    }
}

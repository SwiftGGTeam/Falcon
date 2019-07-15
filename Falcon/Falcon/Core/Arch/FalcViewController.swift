//
//  FalcViewController.swift
//  Falcon
//
//  Created by Harry Duan on 2019/7/15.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import UIKit

// FalcViewController 实例
public class FalcViewController<T: ViewModel>: UIViewController, View {
    public typealias ViewModel = T
    
    public var viewModel: T? {
        didSet {
            updateViews()
            updateLayouts()
        }
    }
    
    open class func show() {
        let vc = self.init()
        _showLogic(vc: vc)
    }
    
    final class func _showLogic(vc: UIViewController) {
        let keyWindow = UIApplication.shared.keyWindow
        var viewController = keyWindow!.rootViewController
        
        if let navigationController = viewController as? UINavigationController {
            navigationController.pushViewController(vc, animated: true)
        }
        else if let tabViewController = viewController as? UITabBarController {
            viewController = tabViewController.selectedViewController
            let navigationController = viewController as! UINavigationController
            navigationController.pushViewController(vc, animated: true)
        }
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        initialViews()
        initialLayouts()
    }
    
    open func initialViews() {
        view.backgroundColor = .falcBackgroundColor
    }
    open func updateViews() {}
    open func initialLayouts() {}
    open func updateLayouts() {}
}


//
//  FalcTabBarController.swift
//  Falcon
//
//  Created by Harry Duan on 2019/6/26.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import UIKit

class FalcTabBarController: UITabBarController {
    
    // MARK: Models
    
    enum Tab: Int, CaseIterable {
        case articles
        case ggtalk
        case events
        case shop
        
        var tabIcon: UIImage? {
            switch self {
            case .articles:
                return R.image.iconTabArticles()
            case .ggtalk:
                return R.image.iconTabPodcast()
            case .events:
                return R.image.iconTabEvents()
            case .shop:
                return R.image.iconTabShop()
            }
        }
        
        var tabSelectedIcon: UIImage? {
            switch self {
            case .articles:
                return R.image.iconTabArticlesSelected()
            case .ggtalk:
                return R.image.iconTabPodcastSelected()
            case .events:
                return R.image.iconTabEventsSelected()
            case .shop:
                return R.image.iconTabShopSelected()
            }
        }
        
        var title: String? {
            switch self {
            case .articles:
                return R.string.falLocalizedStrings.commonTabArticlesTitle()
            case .ggtalk:
                return R.string.falLocalizedStrings.commonTabGgtalkTitle()
            case .events:
                return R.string.falLocalizedStrings.commonTabEventsTitle()
            case .shop:
                return R.string.falLocalizedStrings.commonTabShopTitle()
            }
        }
        
        var viewControllerType: UIViewController.Type {
            switch self {
            case .articles:
                return HomeViewController.self
            case .ggtalk:
                return GGTalkViewController.self
            case .events:
                return EventViewController.self
            case .shop:
                return ShopViewController.self
            }
        }
    }
    
    // MARK: Life-Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewControllers()
    }
    
    // MARK: Private Methods
    
    private func setupViewControllers() {
        let viewControllers: [UIViewController] = Tab.allCases.map { tab in
            let controller = tab.viewControllerType.init()
            controller.title = tab.title
            controller.tabBarItem.image = tab.tabIcon
            controller.tabBarItem.selectedImage = tab.tabSelectedIcon
            return UINavigationController(rootViewController: controller)
        }
        
        setViewControllers(viewControllers, animated: true)
    }
    
}

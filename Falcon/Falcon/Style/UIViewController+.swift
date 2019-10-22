//
//  UIViewController+.swift
//  Falcon
//
//  Created by Rickey on 2019/10/17.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import UIKit

extension UIViewController {

    /**
     *  Height of status bar + navigation bar (if navigation bar exist)
     */
    var navbarHeight: CGFloat {
        return UIApplication.shared.statusBarFrame.size.height +
            (self.navigationController?.navigationBar.frame.height ?? 0.0)
    }
}

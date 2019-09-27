//
//  TalkDetailViewController.swift
//  Falcon
//
//  Created by Rickey on 2019/9/16.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import UIKit
import Then

class TalkDetailViewController: PullUpController<TalkListViewModel> {
    
    override var pullUpControllerPreferredSize: CGSize {
        let height = tabBarController?.tabBar.frame.size.height ?? 44
        return CGSize(width: UIScreen.main.bounds.width, height: height)
    }
    
}

//
//  TalkDetailViewController.swift
//  Falcon
//
//  Created by Rickey on 2019/9/16.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import UIKit
import Then
import WebKit

class TalkDetailViewController: PullUpController<TalkItemViewModel> {
    
    // MARK: - pull up actions
    
    override var pullUpControllerPreferredSize: CGSize {
        let height = tabBarController?.tabBar.frame.size.height ?? 44
        return CGSize(width: UIScreen.main.bounds.width, height: height)
    }
    
    // MARK: - Data
    
    override func initialDatas() {
        super.initialDatas()
    }
    
    override func updateViews() {
        super.updateViews()
        progressView.viewModel = viewModel
    }
    
    // MARK: - UI
    
    private let progressView = TalkDetailProgressView(TalkItemViewModel())
    
    private let webview = WKWebView()
    
    override func initialViews() {
        super.initialViews()
        view.backgroundColor = .white
        progressView.frame = CGRect(x: 0, y: 0, width: Layout.SCREEN_WIDTH, height: 200)
        webview.frame = CGRect(x: 0, y: 200, width: Layout.SCREEN_WIDTH, height: Layout.SCREEN_HEIGHT - 200 - navbarHeight)
        view.addSubview(progressView)
        view.addSubview(webview)
    }
    
    override func initialLayouts() {
        super.initialLayouts()
    }
    
}

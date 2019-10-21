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

class TalkDetailViewController: FalcViewController<TalkItemViewModel>, HalfModalPresentable {
    
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
        view.addSubview(progressView)
        view.addSubview(webview)
    }
    
    override func initialLayouts() {
        super.initialLayouts()
        progressView.snp.makeConstraints { (make) in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(200)
        }
        webview.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(progressView.snp.bottom)
        }
    }
    
}

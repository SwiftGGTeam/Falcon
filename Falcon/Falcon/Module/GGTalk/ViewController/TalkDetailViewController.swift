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
        if let url = viewModel?.summary {
            // TODO: - 如果有较长的 url 时会左右滚动
            webview.loadHTMLString(url, baseURL: nil)
        }
    }
    
    // MARK: - UI
    
    private let progressView = TalkDetailProgressView(TalkItemViewModel())
    
    private let titleLabel = UILabel().then {
        $0.font = UIFont.sgHeadline
        $0.text = "Episode Notes"
    }
    
    private let webview: WKWebView = {
        // js脚本
        let jScript = "var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'width=device-width, shrink-to-fit=YES'); document.getElementsByTagName('head')[0].appendChild(meta); document.createElement('span'); span.setAttribute('style', 'word-break:break-all'); document.getElementsByTagName('head')[0].appendChild(span);"
        // 注入
        let wkUScript = WKUserScript(source: jScript, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        let wkUController = WKUserContentController()
        wkUController.addUserScript(wkUScript)
        // 配置对象
        let wkWebConfig = WKWebViewConfiguration()
        wkWebConfig.userContentController = wkUController
        // 设置字体大小
        let preference = WKPreferences()
        preference.minimumFontSize = 15
        wkWebConfig.preferences = preference
        // webview config
        let webview = WKWebView(frame: .zero, configuration: wkWebConfig)
        webview.scrollView.showsVerticalScrollIndicator = false
        return webview
    }()
    
    override func initialViews() {
        super.initialViews()
        view.backgroundColor = .white
        view.addSubview(progressView)
        view.addSubview(titleLabel)
        view.addSubview(webview)
    }
    
    override func initialLayouts() {
        super.initialLayouts()
        progressView.snp.makeConstraints { (make) in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(200)
        }
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(18)
            make.top.equalTo(progressView.snp.bottom).offset(20)
            make.height.equalTo(19)
        }
        webview.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.left.equalTo(18)
            make.right.equalTo(-18)
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
        }
    }
    
}

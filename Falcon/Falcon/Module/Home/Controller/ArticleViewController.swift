//
//  ArticleViewController.swift
//  Falcon
//
//  Created by Jianing Wang on 2019/7/23.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import UIKit
import SnapKit
import SafariServices

class ArticleViewController: FalcViewController<ArticleViewModel> {
    
    lazy private var markdownView: MarkdownView = { [unowned self] in
        let markdownView = MarkdownView()
        markdownView.delegate = self
        return markdownView
    }()
    
    override func initialDatas() {
        super.initialDatas()
        viewModel?.vmDelegate = self
        viewModel?.fetchData()
    }
    
    override func initialViews() {
        super.initialViews()
        self.view.backgroundColor = .white
//        navigationController?.hidesBarsOnSwipe = true
        view.addSubview(markdownView)
    }
    
    override func initialLayouts() {
        super.initialLayouts()
        
        markdownView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func updateViews() {
        super.updateViews()
        
        guard let viewModel = viewModel else { return }
        
        let markdownViewModel = MarkdownViewModel()
        markdownViewModel.markdown = viewModel.data?.body
        markdownViewModel.isShowImage = true
        markdownViewModel.canTouchImage = true
        markdownView.viewModel = markdownViewModel
    }
}

extension ArticleViewController: MarkdownViewDelegate {
    
    func didFinishRendering(_ markdownView: MarkdownView, height: CGFloat) {
        print("Markdown did finish rendering, the height is", height)
    }
    
    func onTouchLink(_ markdownView: MarkdownView, request: URLRequest) -> Bool {
        guard let url = request.url else { return false }
        //        guard let naviController = self.navigationController else { return false }
        if url.scheme == "file" {
            return false
        } else if url.scheme == "https" {
            let safariController = SFSafariViewController(url: url)
            safariController.preferredBarTintColor = UIColor.sgNaviColor
            safariController.preferredControlTintColor = UIColor.sgMainTintColor
            self.present(safariController, animated: true, completion: nil)
            //            naviController.pushViewController(safari, animated: true)
            return false
        } else {
            return false
        }
    }
    
    func onTouchImage(_ markdownView: MarkdownView, url: URL) -> Bool {
        print(url)
        return true
    }
    
}

extension ArticleViewController: ViewModelDelegate {
    
    func updateViewAfterChangeData() {
        updateViews()
        updateLayouts()
    }
    
}

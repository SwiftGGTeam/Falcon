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
        if #available(iOS 13.0, *) {
            markdownView.backgroundColor = .systemBackground
        }
        return markdownView
    }()
    
    private var progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.progressTintColor = UIColor.sgMainTintColor
        progressView.trackTintColor = UIColor.sgLightGrayColor
        return progressView
    }()
    
    override func initialDatas() {
        super.initialDatas()
        viewModel?.vmDelegate = self
        viewModel?.fetchData()
        progressView.progress = 0.3
        progressView.setProgress(progressView.progress, animated: true)
    }
    
    override func initialViews() {
        super.initialViews()
        self.view.backgroundColor = .white
        [markdownView, progressView].forEach {
            view.addSubview($0)
        }
//        markdownView.addSubview()
    }
    
    override func initialLayouts() {
        super.initialLayouts()
        
        markdownView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        progressView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            make.height.equalTo(2)
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
        
        if progressView.progress == 0.3 {
            progressView.progress = 0.8
            progressView.setProgress(progressView.progress, animated: true)
        }
    }
}

extension ArticleViewController: MarkdownViewDelegate {
    
    func didFinishRendering(_ markdownView: MarkdownView, height: CGFloat) {
        print("Markdown did finish rendering, the height is", height)
        progressView.progress = 1.0
        progressView.setProgress(progressView.progress, animated: true)
        progressView.isHidden = true
    }
    
    func onTouchLink(_ markdownView: MarkdownView, request: URLRequest) -> Bool {
        guard let url = request.url else { return false }
        //        guard let naviController = self.navigationController else { return false }
        if url.scheme == "file" {
            return false
        } else if url.scheme == "https" {
            let safariController = SFSafariViewController(url: url)
            safariController.preferredBarTintColor = UIColor.falcNaviBackColor
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
        let imageViewerController = ArticleImageViewerController()
        imageViewerController.imageUrl = url
        navigationController?.pushViewController(imageViewerController, animated: true)
        return true
    }
    
}

extension ArticleViewController: ViewModelDelegate {
    
    func updateViewAfterChangeData() {
        updateViews()
        updateLayouts()
    }
    
}

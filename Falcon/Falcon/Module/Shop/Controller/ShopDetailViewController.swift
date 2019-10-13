//
//  ShopDetailViewController.swift
//  Falcon
//
//  Created by piggy on 2019/9/15.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import UIKit
import SnapKit
import SafariServices

/// 商品详情
class ShopDetailViewController: FalcViewController<ShopDetailViewModel>, BasicViewDelegate {
    
    lazy private var markdownView: MarkdownView = { [unowned self] in
        let markdownView = MarkdownView()
        markdownView.delegate = self
        return markdownView
    }()
    
    private var progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.progressTintColor = UIColor.sgMainTintColor
        progressView.trackTintColor = UIColor.sgLightGrayColor
        return progressView
    }()
    
    private var bottomCartView: UIView = {
        var view = UIView()
        view.backgroundColor = UIColor.sgMainTintColor
        return view
    }()
    
    lazy private var addCartButton: UIButton = {
        var button = UIButton(type: .custom)
        button.backgroundColor = UIColor.white
        button.setTitleColor(.white, for: .normal)
        button.setImage(UIImage(named: "iconBuy"), for: .normal)
        button.addTarget(self, action: #selector(clickBuyAction), for: .touchUpInside)
        button.cornerRadius = 27.5
        return button
    }()
    
    private var previousPriceLabel: UILabel = {
        var label = UILabel()
        label.numberOfLines = 1
        label.textColor = UIColor(white: 1.0, alpha: 0.75)
        label.font = UIFont.textStyle2
        return label
    }()
    
    let previousPriceLabelAttr: [NSAttributedString.Key: Any] = [
        .foregroundColor: UIColor(white: 1.0, alpha: 0.75),
        .font: UIFont.textStyle2,
        .strikethroughStyle: NSUnderlineStyle.single.rawValue,
        .strikethroughColor: UIColor(white: 1.0, alpha: 0.75),
        .baselineOffset: 0
    ]
    
    private var nowPriceLabel: UILabel = {
        
        var label = UILabel()
        label.numberOfLines = 1
        label.textColor = UIColor.white
        label.font = UIFont.sgNaviTitle
        return label
    }()
    
    override func initialViews() {
        super.initialViews()
        view.addSubview(progressView)
        view.addSubview(markdownView)
        view.addSubview(bottomCartView)
        bottomCartView.addSubview(addCartButton)
        bottomCartView.addSubview(previousPriceLabel)
        bottomCartView.addSubview(nowPriceLabel)
        
        progressView.progress = 0.3
        progressView.setProgress(progressView.progress, animated: true)
    }
    
    override func updateViews() {
        super.updateViews()
        guard let viewModel = viewModel, let shopGoodsModel = viewModel.data as? ShopGoodsModel else { return }
        previousPriceLabel.attributedText = NSAttributedString(string: shopGoodsModel.previousPriceText, attributes: previousPriceLabelAttr)
        nowPriceLabel.text = shopGoodsModel.nowPriceText
        
        let markdownViewModel = MarkdownViewModel()
        markdownViewModel.markdown = shopGoodsModel.markdown
        markdownViewModel.isShowImage = true
        markdownViewModel.canTouchImage = true
        markdownView.viewModel = markdownViewModel
        
        if progressView.progress == 0.3 {
            progressView.progress = 0.8
            progressView.setProgress(progressView.progress, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func initialLayouts() {
        super.initialLayouts()
        
        progressView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            make.height.equalTo(2)
        }
        
        markdownView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-65)
        }
        bottomCartView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(markdownView.snp.bottom)
            make.bottom.equalTo(view)
        }
        
        previousPriceLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(18)
            make.top.equalToSuperview().offset(14)
            make.height.equalTo(18)
        }
        
        nowPriceLabel.snp.makeConstraints { make in
            make.leading.equalTo(previousPriceLabel.snp.leading)
            make.top.equalTo(previousPriceLabel.snp.bottom).offset(2)
            make.height.equalTo(18)
        }
        
        addCartButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-18)
            make.top.equalToSuperview().offset(8)
            make.size.equalTo(CGSize(width: 100, height: 50))
        }
    }
    
    @objc private func clickBuyAction(_ sender: Any) {
        guard let shopGoodsModel = viewModel?.data as? ShopGoodsModel, let urlString = shopGoodsModel.purchaseURL, let url = URL(string: urlString) else { return }
        let safariController = SFSafariViewController(url: url)
        safariController.preferredBarTintColor = UIColor.sgNaviColor
        safariController.preferredControlTintColor = UIColor.sgMainTintColor
        self.present(safariController, animated: true, completion: nil)
    }
}

extension ShopDetailViewController {
    open func modelChanged(_ models: [Any]) {
        self.updateViews()
    }
}

extension ShopDetailViewController: MarkdownViewDelegate {
    
    func didFinishRendering(_ markdownView: MarkdownView, height: CGFloat) {
        print("Markdown did finish rendering, the height is", height)
        progressView.progress = 1.0
        progressView.setProgress(progressView.progress, animated: true)
        progressView.isHidden = true
    }
    
    func onTouchLink(_ markdownView: MarkdownView, request: URLRequest) -> Bool {
        guard let url = request.url else { return false }
        if url.scheme == "file" {
            return false
        } else if url.scheme == "https" {
            let safariController = SFSafariViewController(url: url)
            safariController.preferredBarTintColor = UIColor.sgNaviColor
            safariController.preferredControlTintColor = UIColor.sgMainTintColor
            self.present(safariController, animated: true, completion: nil)
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
